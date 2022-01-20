`timescale 1ns / 1ps

module conv2_mutiply
#(parameter RGB_BIT = 4'd8,
parameter kernel2_size = 4'd3,
parameter photo_widht = 6'd12,
parameter photo_high = 6'd12,
parameter weight_widht = 6'd17,
parameter bias_widht = 6'd16,
parameter feature_widht = 7'd32)
(
	input 					clk,
	input 					clk_2x,
	input 					clk_5x,
	input 					rst_n,
	input					weight_en,
	input					Multiply_en,
	input [weight_widht-1: 0]	weight,
	input [feature_widht-1: 0]	data_in,
	output [feature_widht: 0]	data_out,
	output					out_start,
	output					out_end,
	output					out_vaild
);
	//将权重先存起来
	wire signed  	[weight_widht-2: 0]		weight_mult[ 0:kernel2_size * kernel2_size-1];
	reg			[5:0]				clk_num11;
	reg								weight_en_r;
	//输入的数据分给五个dsp进行处理
	reg			[3:0]				clk_num5;
	reg signed  	[feature_widht-1: 0]	data_in_r [ 0:kernel2_size * kernel2_size-1];
	
	reg								en_flag;
	reg								en_flag_r;
	reg			[5:0]				cnt_cols;//计算列
	reg			[5:0]				cnt_rows;//计算行

	//有符号*无符号；无符号*有符号，算法不一致；
	wire signed	[63: 0]				multiply[0: kernel2_size*kernel2_size];
	wire signed	[31: 0]				mult_r  [0: kernel2_size*kernel2_size];
	wire signed	[31: 0]				mult    [0: kernel2_size*kernel2_size];
	wire signed 	[32: 0]				data_out_1[ 0: 4];
	wire signed 	[32: 0]				data_out_2[ 0: 1];
	wire signed 	[32: 0]				data_out_3;
	wire signed 	[32: 0]				data_out_4;
	//data_ou1t，将9个乘法积相加进行输出
	wire								clk_5x_posedge,out_vaild_r;
	reg			[11:0]				cnt_cols_r;
	//输出前的数据储存
	wire 		[32:0]				data_out_r;
	reg 			[32:0]				data_out_r2;
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			weight_en_r <= 1'd0;
		end
		else begin
			weight_en_r <= weight_en;
		end
	end
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			clk_num11 <= 6'd0;
		else if(clk_num11 == kernel2_size*kernel2_size-1)
			clk_num11 <= 6'd0;
		else	if(weight_en_r)
			clk_num11 <= clk_num11 + 1'b1;
	end
	
	//权重例化25个进行储存
	genvar i;
	generate 
		for(i=0; i<kernel2_size * kernel2_size; i=i+1)
		begin:weight_n
			assign weight_mult[i] = (clk_num11 == i && weight_en_r)? {weight[16],weight[14:0]}:weight_mult[i];
		end
	endgenerate
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			en_flag <= 1'd0;
			en_flag_r <= 1'd0;
		end
		else begin
			en_flag_r <= Multiply_en;
			en_flag   <= en_flag_r;
		end
	end 
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			cnt_cols <= 6'd0;
		else if(cnt_cols==6'd11 || weight_en)
			cnt_cols <= 6'd0;
		else if(Multiply_en||en_flag)
			cnt_cols <= cnt_cols + 1'b1;
	end 
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			cnt_rows <= 6'd0;

		else if(cnt_rows==6'd10)
			cnt_rows <= 6'd0;
		else if(cnt_cols==6'd11)
			cnt_rows <= cnt_rows + 1'b1;
	end 
	
	always@(posedge clk_5x or negedge rst_n)begin
		if(!rst_n)
			clk_num5 <= 4'd0;
		else if(clk_num5 == 4)
			clk_num5 <= 4'd0;
		else	if(en_flag||Multiply_en)
			clk_num5 <= clk_num5 + 1'b1;
	end
	genvar dij;
	generate 
		for(dij=0;dij<kernel2_size;dij=dij+1)
		begin:data_in_n
			always@(posedge clk_5x or negedge rst_n)begin
				if(!rst_n)begin
					data_in_r[dij*3   ] <= 16'd0;
					data_in_r[dij*3+ 1] <= 16'd0;
					data_in_r[dij*3+ 2] <= 16'd0;
				end
				else if(clk_num5-dij == 1)begin
					data_in_r[dij*3   ] <= data_in_r[dij*3+ 1];
					data_in_r[dij*3+ 1] <= data_in_r[dij*3+ 2];	  
					data_in_r[dij*3+ 2] <= data_in;
				end
			end
		end
	endgenerate
	
	//////////////////////////////////////
	//////////float乘法器/////////////////
	//////////////////////////////////////
	assign multiply[kernel2_size*kernel2_size] = 32'd0;
	assign mult_r[kernel2_size*kernel2_size] = 32'd0;
	assign mult[kernel2_size*kernel2_size] = 32'd0;
	
	genvar j;
	generate
		for(j=0;j<kernel2_size*kernel2_size;j=j+1)
		begin:multiply_n
			assign multiply[j][62:0] = (en_flag)? data_in_r[j]*weight_mult[j][14:0]:63'd0;
		     assign multiply[j][63] = weight_mult[j][15];
		     assign mult_r[j] = {multiply[j][63],multiply[j][46:16]};// >>> FW;
			assign mult[j] = ((Multiply_en||en_flag_r) && mult_r[j][31])?{1'b1,~mult_r[j][30:0]+1}:mult_r[j];
			
		end
	endgenerate
	////////////////////////////////////////
	//////////////////相加//////////////////
	////////////////////////////////////////

	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			cnt_cols_r <= 12'd0;
		else
			cnt_cols_r <= cnt_cols;
	end
	
	assign clk_5x_posedge = (clk_num5 == 3'd1)?1'b1:1'b0;
	assign out_start 	  = (cnt_cols == 6'd3  && clk_num5 == 1'd0)?1'b1:1'b0;
	assign out_end 	  = (cnt_rows == 6'd10)?1'b1:1'b0;
	assign out_vaild_r 	  = (en_flag && cnt_cols_r*5+clk_num5>8'd9)?1'b1:1'b0;
	
	
	genvar do1;
	generate 
		for(do1=0;do1<5;do1=do1+1)
		begin:data_out_1_n
			assign data_out_1[do1] = mult[do1] + mult[do1+4'd5];
		end
	endgenerate
	
	
	genvar do2;
	generate 
		for(do2=0;do2<2;do2=do2+1)
		begin:data_out_2_n
			assign	data_out_2[do2] = data_out_1[do2] + data_out_1[do2+3'd2];
		end
	endgenerate
	
	assign 	data_out_3 = data_out_2[0] + data_out_2[1];
	assign	data_out_4 = data_out_3 + data_out_1[4];
	assign 	data_out_r = (clk_num5 == 3'd4 && cnt_cols>5'd1)? data_out_4:data_out_r;

	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			data_out_r2 <= 33'd0;
		else
			data_out_r2 <= data_out_r;
	end
	
	assign 	data_out = data_out_r2;
	assign 	out_vaild = out_vaild_r;
	
endmodule
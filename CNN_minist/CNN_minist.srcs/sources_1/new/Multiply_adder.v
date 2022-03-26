`timescale 1ns / 1ps

module Multiply_adder
#(parameter RGB_BIT = 4'd8,
parameter kernel_size = 4'd5,
parameter photo_widht = 6'd28,
parameter photo_high = 6'd28,
parameter weight_widht = 6'd17,
parameter bias_width = 6'd17,
parameter pix_widht = 6'd16,
parameter feature_widht = 7'd32)
(
	input 					clk,
	input 					clk_2x,
	input 					clk_5x,
	input 					rst_n,
	input					weight_en,
	input					Multiply_en,
	input [weight_widht-1: 0]	weight,
	input [bias_width-1: 0]		data_b,
	input [pix_widht-1: 0]		data_in,
	output [feature_widht-1: 0]	data_out,
	output					out_start,
	output					out_end,
	output					out_vaild
);
	//将权重先存起来
	wire signed  	[weight_widht-2: 0]		weight_mult[ 0:kernel_size*kernel_size-1];
	reg			[5:0]				clk_num26;
	reg								clk_num_flag;
	
	reg			[3:0]				clk_num5;
	reg signed  	[pix_widht-1: 0]		data_in_r [ 0:kernel_size*kernel_size-1];
	
	reg								en_flag;
	reg								en_flag_r;
	reg			[5:0]				cnt_col;//计算列
	//有符号*无符号；无符号*有符号，算法不一致；
	wire signed  	[31: 0]				mult[0: 25];
	wire signed  	[31: 0]				multiply[0: 25];
		
	wire  signed 	[32: 0]				data_out_1[ 0:13];
	wire  signed 	[32: 0]				data_out_2[ 0: 7];
	wire  signed 	[32: 0]				data_out_3[ 0: 3];
	wire  signed 	[32: 0]				data_out_4[ 0: 1];
	wire  signed  	[32: 0]				data_out_5;
	reg 			[32:0]				data_out_r;

	//data_ou1t，将9个乘法积相加进行输出
	wire								clk_5x_posedge;
		
		
	always@(posedge clk_5x or negedge rst_n)begin
		if(!rst_n)
			clk_num_flag <= 1'd0;
		else if(weight_en)
			clk_num_flag <= 1'd1;
		else 
			clk_num_flag <= 1'd0;
	end
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			clk_num26 <= 6'd0;
		else if(clk_num26 == 6'd26)
			clk_num26 <= clk_num26;
		else	if(clk_num_flag)
			clk_num26 <= clk_num26 + 1'b1;
	end
	
	//权重例化25个进行储存
	genvar i;
	generate 
		for(i=0; i<kernel_size*kernel_size; i=i+1)
		begin:weight_n
			//assign weight_mult[i] = (clk_num26 == i)? weight_r:weight_mult[i];
			assign weight_mult[i] = (clk_num26 == i)? {weight[16],weight[14:0]}:weight_mult[i];
		end
	endgenerate
	
	//输入的数据分给五个dsp进行处理
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			en_flag <= 1'd0;
			en_flag_r <= 1'd0;
		end
		else begin
			en_flag_r <= Multiply_en;
			en_flag <= Multiply_en;
		end
	end 
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			cnt_col <= 6'd0;
		else if(!(Multiply_en||en_flag))
			cnt_col <= 6'd0;
		else if(cnt_col>6'd29)
			cnt_col <= cnt_col;
		else if(Multiply_en||en_flag)
			cnt_col <= cnt_col + 1'b1;
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
		for(dij=0;dij<5;dij=dij+1)
		begin:data_in_n
			always@(posedge clk_5x or negedge rst_n)begin
				if(!rst_n)begin
					data_in_r[dij*5  ] <= 16'd0;
					data_in_r[dij*5+1] <= 16'd0;
					data_in_r[dij*5+2] <= 16'd0;
					data_in_r[dij*5+3] <= 16'd0;	  
					data_in_r[dij*5+4] <= 16'd0;
				end
				else if(clk_num5-dij == 1'd1 || dij-clk_num5==3'd4)begin
					data_in_r[dij*5  ] <= data_in_r[dij*5+1];
					data_in_r[dij*5+1] <= data_in_r[dij*5+2];	  
					data_in_r[dij*5+2] <= data_in_r[dij*5+3];
					data_in_r[dij*5+3] <= data_in_r[dij*5+4];	  
					data_in_r[dij*5+4] <= data_in;
				end
			end
		end
	endgenerate

	
	assign multiply[25] = 32'd0;
	assign mult[25] = (data_b[16]) ? {data_b[16],7'h7f,~data_b[15:0]+1,8'h00}:data_b*9'd256;
	
	genvar j;
	generate
		for(j=0;j<25;j=j+1)
		begin:multiply_n
		
			assign multiply[j][30:0] = (cnt_col>6'd4)? data_in_r[j]*weight_mult[j][14:0]:32'd0;
			assign multiply[j][31] = weight_mult[j][15];
			assign mult[j] = (weight_mult[j][15])?{1'd1,~multiply[j][30:0]+1}:multiply[j];
			//assign mult[j][30:0] = (cnt_col>6'd4)? data_in_r[j]*weight_mult[j][14:0]:33'd0;
			//assign mult[j][31] = weight_mult[j][15];
		end
	endgenerate
	////////////////////////////////////////
	//////////////////相加//////////////////
	////////////////////////////////////////

	assign clk_5x_posedge = (clk_num5 == 3'd1)?1'b1:1'b0;
	assign out_start 	= (cnt_col == 6'd5  && clk_num5 == 1'd1)?1'b1:1'b0;
	assign out_end 	= (cnt_col == 6'd29)?1'b1:1'b0;
	assign out_vaild 	= (cnt_col*4+clk_num5>8'd20)?1'b1:1'b0;
	
	
	//always@(posedge clk_5x)begin
	assign	data_out_2[7] = 32'd0; 
	assign	data_out_1[13] = 32'd0;
	//end
	
	genvar do1;
	generate 
		for(do1=0;do1<13;do1=do1+1)
		begin:data_out_1_n
			assign data_out_1[do1] = mult[do1] + mult[do1+4'd13];
		end
	endgenerate
	
	genvar do2;
	generate 
		for(do2=0;do2<7;do2=do2+1)
		begin:data_out_2_n
			assign	data_out_2[do2] = data_out_1[do2] + data_out_1[do2+3'd7];
		end
	endgenerate
	

	genvar do3;
	generate 
		for(do3=0;do3<4;do3=do3+1)
		begin:data_out_3_n
			assign data_out_3[do3] = data_out_2[do3] + data_out_2[do3+3'd4];
		end
	endgenerate
	
	
	genvar do4;
	generate 
		for(do4=0;do4<2;do4=do4+1)
		begin:data_out_4_n
				assign	data_out_4[do4] = data_out_3[do4] + data_out_3[do4+2'd2];
		end
	endgenerate

	assign data_out_5 = (clk_num5 == 3'd1)?data_out_4[1] + data_out_4[0]:data_out_5;
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			data_out_r <= 33'd0;
		else if(clk_num5 == 3'd4 && cnt_col >5'd4)
			data_out_r <= data_out_5;
	end
	//assign data_out = data_out_r;
	//激活函数
	assign data_out   = (data_out_r[32]==1'b0)? data_out_r[31:8]:32'b0;
	
endmodule

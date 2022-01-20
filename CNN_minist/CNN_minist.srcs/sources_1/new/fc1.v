`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/09 21:16:42
// Design Name: 
// Module Name: fc1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 	先输入1000个数据，再对权重进行去读计算
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fc1
#(parameter fc1_num = 10'd1000,
parameter fc2_num = 10'd200,
parameter weight_widht = 6'd17,
parameter feature_widht = 7'd32)(
	input						clk,
	input						clk_5x,
	input						rst_n,
	input						vaild,
	input  [feature_widht-1: 0]		data_in,
	output 						out_en,
	output [feature_widht-1: 0]		data_out
    	);
    	
	reg		[9: 0]				cnt_data;		//对输入的1000个数据进行赋值再buffer中
	reg		[feature_widht-1: 0]	buffer_in		[0:fc1_num-1];		//储存1000个数据的buffer
	
	reg							W_en;			//权重读取使能
	reg							vaild_r,vaild_r2;	
	wire		[17: 0]				addra;			//权重值在ram的地址读取
	reg		[17: 0]				addra_1000,addra_1000_r;	//每读取一个进行+1
	reg		[ 8: 0]				cnt_200,cnt_200_r;		//每位1000权值的输出进行+1
	wire		[16: 0]				fc1_weight;			//输出的权值
	wire		[47:0]				fc1_bias;			//偏置
	wire							bias_en;			//偏置的使能
	
	reg 							W_en_r;
	wire							data_out_r_en;		//判断乘数是否为0
	wire							last;			//W_en使能完也说明该fc数据处理完，对其进行判断为最后一个输出值
	reg							last_r,last_r2;	//为last做铺垫
	wire		[63:0]				data_out_r;		//相乘后的数值，有0直接输出得数为0；
	wire		[47:0]				data_out_r2;		//求对负数的反码
	reg		[47: 0]				data_out_r3;		//求1000个data_out_r2的和
	reg		[47: 0]				data_1;			//最后data_out_r3再加上偏置之后就为输出值
	    	
	///////////////////////////
	//////////bias和weight/////////////
	///////////////////////////
	fc1_bias fc1_bias_u(
		.clk_5x			(clk_5x),
		.rst_n			(rst_n),
		.en				(bias_en),
		.data_out			(fc1_bias)
	    );
	
	assign bias_en = (addra_1000 == 10'd500)? 1'd1:1'd0;
	
	W_fc1 W_fc1_u (
	  .clka(clk_5x),    // input wire clka
	  .ena(W_en),      // input wire ena
	  .addra(addra),  // input wire [17 : 0] addra
	  .douta(fc1_weight)  // output wire [16 : 0] douta
	);
	
	/////////////////////////////////
	/////////////////////////////////
	/////////////////////////////////
    		
    	always@(posedge clk or negedge rst_n)begin
    		if(!rst_n)
    			cnt_data <=10'd0;
    		else if(vaild)
    			cnt_data <= cnt_data + 1'd1;
    	end
    	
    	genvar i;
    	generate 
    		for(i=0; i< fc1_num; i=i+1)
    		begin:data_in_rr
			always@(posedge clk or negedge rst_n)begin
				if(!rst_n)
					buffer_in[i] <= 32'd0;
				else if(vaild && i == cnt_data)
					buffer_in[i] <= data_in;
			end 
		end
	endgenerate
	
	
    	
	always@(posedge clk_5x or negedge rst_n)begin
		if(!rst_n)begin
			vaild_r <= 1'd0;
			vaild_r2 <= 1'd0;
		end
		else	begin
			vaild_r2 <= vaild;
			vaild_r <= vaild_r2;
		end
	end
    	
	always@(posedge clk_5x or negedge rst_n)begin
		if(!rst_n)
			W_en <= 1'd0;
		else if(cnt_200 == (fc2_num-1) && addra_1000 == (fc1_num-1))
			W_en <= 1'd0;
		else	if(vaild_r && !vaild)
			W_en <= 1'd1;
	end
	
	
	always@(posedge clk_5x or negedge rst_n)begin
		if(!rst_n)
			addra_1000 <= 18'd0;
		else if(addra_1000 == (fc1_num-1))
			addra_1000 <= 18'd0;
		else if(W_en)
			addra_1000 <= addra_1000 + 1'd1;
	end
	
	always@(posedge clk_5x or negedge rst_n)begin
		if(!rst_n)
			addra_1000_r <= 1'd0;
		else	
			addra_1000_r <= addra_1000;
	end
	
	always@(posedge clk_5x or negedge rst_n)begin
		if(!rst_n)
			cnt_200 <= 9'd0;
		else if(cnt_200 == (fc2_num-1))
			cnt_200 <= cnt_200;
		else if(addra_1000 == (fc1_num-1))
			cnt_200 <= cnt_200 + 1'd1;
		else if(W_en)
			cnt_200 <= cnt_200;
	end
    	
    	
	always@(posedge clk_5x or negedge rst_n)begin
		if(!rst_n)
			cnt_200_r <= 1'd0;
		else	
			cnt_200_r <= cnt_200;
	end
    	
    	assign addra = cnt_200 * fc1_num + addra_1000;
    	
    	
    	
    	always@(posedge clk_5x or negedge rst_n)begin
    		if(!rst_n)
    			W_en_r <= 1'd0;
    		else
    			W_en_r <= W_en;
    	end
    	
    	assign data_out_r_en = W_en_r && !(buffer_in[addra_1000_r]==32'd0||fc1_weight[15:0]==32'd0);
    	assign data_out_r = (data_out_r_en)? ({fc1_weight[16],63'd0}+fc1_weight[15:0]*buffer_in[addra_1000_r]):64'd0;
    	assign data_out_r2 = (data_out_r[63])?{1'd1,~data_out_r[46:0]+1}:data_out_r[47:0];
    	
    	
    	always@(negedge clk_5x or negedge rst_n)begin
    		if(!rst_n)
    			data_out_r3 <= 32'd0;
    		else	if(W_en_r)begin
			if(addra_1000 == 18'd1)
				data_out_r3 <= data_out_r2;
			else
				data_out_r3 <= data_out_r3 + data_out_r2;
		end
    	end
    	
    	
    	always@(posedge clk or negedge rst_n)begin
    		if(!rst_n)
    			last_r <= 1'd0;
    		else
    			last_r <= W_en_r;
    	end
    	always@(posedge clk_5x or negedge rst_n)begin
		if(!rst_n)
			last_r2 <= 1'd0;
		else
			last_r2 <= last_r;
	end 
    	
    	assign	last = last_r2 &(!W_en_r);
    	
	always@(posedge out_en or negedge rst_n)begin
		if(!rst_n)
			data_1 <= 32'd0;
		else
			data_1 <= data_out_r3 + fc1_bias;
	end
	
	//	relu层
	assign	data_out = (data_1[47])? 32'd0:data_1[39:8];
	assign 	out_en = ((addra_1000>18'd0 && addra_1000<18'd6 && cnt_200>9'd0) || last)?1'd1:1'd0;
    	
endmodule

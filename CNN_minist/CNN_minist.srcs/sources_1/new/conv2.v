`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/26 15:50:53
// Design Name: 
// Module Name: conv2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module conv2
#(parameter photo_high = 7'd12,
parameter photo_widht = 7'd12,
parameter kernel_size = 4'd3,
parameter kernel_num1 = 4'd6,
parameter kernel_num2 = 4'd10,
parameter weight_num = kernel_size*kernel_size * kernel_num1 * kernel_num2,//六个卷积核
parameter weight_widht = 6'd17,
parameter feature_widht = 7'd32)
    (
    	input           						clk_sys,
	input           						clk,
    	input           						clk_2x,
    	input           						clk_5x,
    	input           						rst_n,
    	input   [feature_widht*kernel_num1-1:0]  	data_in,
    	input           						vaild,
	input           						fifo_full,
    	input           						last,
    	output  [feature_widht-1: 0]  			data_out,
    	output								out_start,
    	output								out_end,
	output								out_ready,	
    	output								out_vaild
    	);
    	
    	
    	wire									c2_b_en,c2_w_en;
    	reg 									c2_w_en_r;	//延迟一拍 c2_w_en
	reg		[4:0]						c2_w_en_num;	//对计算feature的层数计算，对于不同的权值和偏置
	wire		[weight_widht-1:0]				c2_b;		//bias读取
	wire		[feature_widht:0]				data_bias_r;	//bias转换
	wire		[feature_widht:0]				data_bias;	//bias存放
	reg		[4:0]						cnt_b;		//cnt_b,计算第几个偏置
	wire   	[weight_widht*kernel_num1-1 : 0] 	c2_w;		//六个weight一起读取
	wire	 	[weight_widht-1 : 0] 			Multiply_weight[0:kernel_num1-1];	//存放六个weight

	wire									u1_vaild;		//使能bias和weight的读取
	
	//3*3kernel，因此定义三个buffer
	reg 		[feature_widht*kernel_num1-1: 0] 	buffer_1[0:photo_widht-1];	
	reg 		[feature_widht*kernel_num1-1: 0] 	buffer_2[0:photo_widht-1];
	reg 		[feature_widht*kernel_num1-1: 0] 	buffer_3[0:photo_widht-1];
	
	reg		[3:0]						clk_num;		//通过5倍频输送信号
	reg 		[feature_widht*kernel_num1-1: 0]  	data_r_n;		//5倍频输送的信号
	
	reg 		[11: 0] 						cnt_cols;		//计算列
	reg 		[11: 0] 						cnt_rows;		//计算行
	reg         							vaild_conv2_r;
	reg									vaild_conv2_r2;
	
	wire			[feature_widht: 0]			Mult_data_out[0:kernel_num1-1];
	wire			[feature_widht: 0]			Mult_data_in[0:kernel_num1-1];
	wire 								Multiply_adder_en;
	
	wire  signed [32: 0]					data_out_1[ 0: 3];
	wire  signed [32: 0]					data_out_2[ 0: 1];
	wire  signed [32: 0]					data_out_3;
	
	assign u1_vaild = out_end || fifo_full;		//计算完一层feature，就重新使能权值和偏置
	
	//第二层卷积的权值读取
	conv2_weight conv2_weight_u1	(.clk(clk), .rst_n(rst_n), .vaild(u1_vaild), 
							.c2_w_en(c2_w_en), .c2_w(c2_w));
	//第二层卷积的偏置读取
	conv2_bias conv2_bias_u1		(.clk(clk), .rst_n(rst_n), .vaild(c2_w_en), 
							.c2_b_en(c2_b_en), .c2_b(c2_b));
	
	
	always@(posedge c2_w_en or negedge rst_n)begin
		if(!rst_n)
			c2_w_en_num <= 5'd0;
		else if(c2_w_en)
			c2_w_en_num <= c2_w_en_num+1'd1;
	end
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			c2_w_en_r <= 1'b0;
		else
			c2_w_en_r <= c2_w_en;
	end
	assign out_ready =  c2_w_en_r & (!c2_w_en);	//判断最后一个权值输出完，告诉feature_ram开始输出数据
    	//////////////////////////////
    	//////buffer//////////////////
    	//////////////////////////////
    	
    	always@(posedge clk or negedge rst_n)begin
    		if(!rst_n)begin
    			vaild_conv2_r  <= 12'b0;
    			vaild_conv2_r2 <= 12'b0;
    		end
    		else begin
    			vaild_conv2_r  <= vaild;
    			vaild_conv2_r2 <= vaild_conv2_r;
    		end
    	end
    		
    		
    	//cnt_cols,计算第几列
    	always@(posedge clk or negedge rst_n)begin
    		if(!rst_n)      			
    			cnt_cols <= 1'b0;
    		else if(cnt_cols == 12'd11 || c2_w_en)
    			cnt_cols <= 1'b0;
    		else if(vaild_conv2_r)
    			cnt_cols <= cnt_cols + 1'b1;
    		else
    			cnt_cols <= cnt_cols;
    	end
    	
    	//flag_num,flag_num=kernel_size-1,数据就需要更替
    	always@(posedge clk or negedge rst_n)begin
    		if(!rst_n)begin
    			cnt_rows <= 11'd0;
    		end
    		else if(cnt_rows==(photo_high))begin
    			cnt_rows <= 11'd0;
    		end
    		else if(cnt_cols==(photo_high-1))begin//num_n_r>=(photo_widht-1) && 
    			cnt_rows <= cnt_rows + 1;
    		end
    	end
    	
    	//数据输入到buffer中
    	//data_r1，flag_num>=kernel_size-1时，进行数据更替
    	genvar i;
    	generate 
    		for(i=0;i<photo_widht;i=i+1)
    		begin:data1
    			always@(posedge clk or negedge rst_n)begin
    				if(!rst_n)begin
    					buffer_1[i] <= 32'd0;
    					buffer_2[i] <= 32'd0;
    				end
				else if(c2_w_en)begin
					buffer_1[i] <= 32'd0;
					buffer_2[i] <= 32'd0;
				end
    				else if(cnt_cols == 12'd0)begin
    					buffer_1[i] <= buffer_2[i];
    					buffer_2[i] <= buffer_3[i];
    				end
    			end
    			
    			always@(posedge clk or negedge rst_n)begin
				if(!rst_n)begin
					buffer_3[i] <= 32'd0;
				end
				else if(c2_w_en)begin
					buffer_3[i] <= 32'd0;
				end
				else if(vaild && i==cnt_cols)begin
					buffer_3[i] <= data_in;
				end
			end
    		end
    	endgenerate
    
    	
    	///////////////////////////////////////
    	/////////25_data///////////////////////
    	///////////////////////////////////////
    	always@(posedge clk_5x or negedge rst_n)begin
    		if(!rst_n)		  
    			clk_num <= 4'd0;
    		else if(clk_num == 3'd4)
    			clk_num <= 4'd0;
    		else if(vaild || vaild_conv2_r2)
    			clk_num <= clk_num + 1'b1;
    		else
    			clk_num <= 4'd0;
    	end
    	//
    	always@(posedge clk_5x or negedge rst_n)begin
    		if(!rst_n)		  
    			data_r_n <= 32'd0;
    		else if(clk_num == 1 && vaild_conv2_r2)begin
			if(cnt_cols == 12'd0)
				data_r_n <= buffer_1[11];
			else
				data_r_n <= buffer_1[cnt_cols-1];//减少一个时钟的延迟
		end
    		else if(clk_num == 2 && vaild_conv2_r2)begin
			if(cnt_cols == 12'd0)
				data_r_n <= buffer_2[11];
			else
				data_r_n <= buffer_2[cnt_cols-1];
		end
    		else if(clk_num == 3 && vaild_conv2_r2)begin
    			if(cnt_cols == 12'd0)
    				data_r_n <= buffer_3[11];
    			else
    				data_r_n <= buffer_3[cnt_cols-1];
    		end
    		else
    			data_r_n <= 32'd0;
    	end
    	
    	///////////////////////////////////
    	////////////偏置的读取/////////////
    	///////////////////////////////////
	always@(posedge clk_sys or negedge rst_n)begin
		if(!rst_n)      			
			cnt_b <= 5'b0;
		else if(cnt_b == 5'd11)
			cnt_b <= cnt_b;
		else if(c2_b_en)
			cnt_b <= cnt_b + 1'b1;
	end

    	assign data_bias_r = (c2_b_en)? {c2_b[16],16'h0000,c2_b[15:0]}:data_bias_r;
	assign data_bias = (data_bias_r[32]==1) ? {1'd1,~data_bias_r[31:0]+1}:data_bias_r;

    	
    //////////////////////////////////////////////////////////////
    /////////////////权值的读取////////////////////////////////////
    /////////////////权值也是有限的，在linebuffer准备的时候就读取出来放入乘法器中
    ///////////////////////////////////////////////////////////////
    
    	assign Multiply_weight[0]=c2_w[weight_widht*1-1:weight_widht*0];
    	assign Multiply_weight[1]=c2_w[weight_widht*2-1:weight_widht*1];
    	assign Multiply_weight[2]=c2_w[weight_widht*3-1:weight_widht*2];
    	assign Multiply_weight[3]=c2_w[weight_widht*4-1:weight_widht*3];
    	assign Multiply_weight[4]=c2_w[weight_widht*5-1:weight_widht*4];
    	assign Multiply_weight[5]=c2_w[weight_widht*6-1:weight_widht*5];
    	
    
    //////////////////////////////////////////////////////////////
    ///////////////////有6个通道，例化6个Multiply_adder///////////
    ///////////////////////10层，循环十次/////////////////////////
    //////////////////////////////////////////////////////////////
    
    	//当cnt_rows>10'd1 && cnt_rows + cnt_cols>10'd2，说明buffer_5在输入，需要进行乘法了
    	assign Multiply_adder_en = (cnt_rows>10'd1 && cnt_rows + cnt_cols>10'd2)? 1'b1:1'b0;
	
    	genvar ma_n;
    	generate 
    		for(ma_n=0; ma_n< kernel_num1; ma_n=ma_n+1)
    		begin:conv2_mutiply
    			conv2_mutiply n(
    				.clk			(clk),
    				.clk_2x        (clk_2x),
    				.clk_5x        (clk_5x),
    				.rst_n		(rst_n),
    				.weight_en	(c2_w_en),
    				.Multiply_en	(Multiply_adder_en),
    				.weight 		(Multiply_weight[ma_n]),
//    				.data_b 		(data_bias[ma_n]),
    				.data_in		(Mult_data_in[ma_n]),
    				.data_out		(Mult_data_out[ma_n]),
    				.out_start	(out_start),
    				.out_end		(out_end),
    				.out_vaild	(out_vaild)
    			);
    		assign Mult_data_in[ma_n] = data_r_n[32*(ma_n+1)-1:32*ma_n];
    		end
    	endgenerate
    	
    	
    	assign	data_out_1[0] = Mult_data_out[0]+Mult_data_out[3];
	assign	data_out_1[1] = Mult_data_out[1]+Mult_data_out[4];
	assign	data_out_1[2] = Mult_data_out[2]+Mult_data_out[5];
	assign	data_out_1[3] = data_bias;//data_bias_r [c2_w_en_num-1];
	
	assign	data_out_2[0] = data_out_1[0]+data_out_1[2];
	assign	data_out_2[1] = data_out_1[1]+data_out_1[3];
	
	assign	data_out_3    = data_out_2[0]+data_out_2[1];
	
	assign data_out   = (data_out_3[32]==1'b0)? data_out_3[31:0]:32'b0;


endmodule

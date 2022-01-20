`timescale 1ns / 1ps

module conv1
#(parameter photo_high = 7'd28,
parameter photo_widht = 7'd28,
parameter kernel_size = 4'd5,
parameter parameter_w = kernel_size * kernel_size * 6,//六个卷积核
parameter weight_widht = 6'd17,
parameter bias_width = 6'd17,
parameter feature_widht = 7'd32,
parameter pix_widht = 6'd16)
(
	input           		clk,
	input           		clk_2x,
	input           		clk_5x,
	input           		rst_n,
	input   [pix_widht-1:0]  data_in,
	input           		vaild,
	input           		last,
	input				c1_b_en,
	input   [bias_width-1:0]	c1_b,
	input				c1_w_en,
	input   [weight_widht*6-1 : 0] 		c1_w,
	output  [feature_widht*6-1: 0]  		data_out,
	output					out_start,
	output					out_end,
	output					out_vaild
	);
	
	
	//////////////////////////////
	//////buffer//////////////////
	//////////////////////////////
	reg [pix_widht-1: 0] 			buffer_1[0:photo_widht-1];
	reg [pix_widht-1: 0] 			buffer_2[0:photo_widht-1];
	reg [pix_widht-1: 0] 			buffer_3[0:photo_widht-1];
	reg [pix_widht-1: 0] 			buffer_4[0:photo_widht-1];
	reg [pix_widht-1: 0] 			buffer_5[0:photo_widht-1];
	
	reg 		[11: 0] 				cnt_cols;
	reg 		[11: 0] 				cnt_cols_r;
	reg         					vaild_conv1_r;
	reg 		[10: 0] 				cnt_rows;
	
	reg 		[pix_widht-1:0]  		data_r_n;
	reg		[3:0]				clk_num5;
	
	//dout_b1,输出偏置1的值
	wire		[bias_width-1: 0]		data_bias[0:5];
	wire	 	[weight_widht-1: 0] 	Multiply_weight[0:5];	
	
	wire 						Multiply_adder_en;
	wire		[31:0]				out_conv1		[0:5];
	wire							out_start_r	[0:5];
	wire							out_end_r		[0:5];
	wire							out_vaild_r	[0:5];
	wire 						vaild_conv1;
	
	assign vaild_conv1 = (cnt_rows<photo_high) ? vaild:1'b0;
	
	//flag_last,为了延迟last一拍进行输出
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			vaild_conv1_r  <= 1'b0;
		end
		else begin
			vaild_conv1_r  <= vaild_conv1;
		end
	end
		
	//cnt_cols,计算第几列
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)      			
			cnt_cols <= 12'b0;
		else if(last)
			cnt_cols <= 12'b0;
		else if(cnt_cols == 12'd27)
			cnt_cols <= cnt_cols;
		else if(vaild)
			cnt_cols <= cnt_cols + 1'b1;
		else
			cnt_cols <= cnt_cols;
	end
	
	//num_n_r，延迟一拍
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)      			
			cnt_cols_r <= 1'b0;
		else            			
			cnt_cols_r <= cnt_cols;
	end
	
	//flag_num,flag_num=kernel_size-1,数据就需要更替
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			cnt_rows <= 11'd0;
		end
		else if(cnt_rows==(photo_high))	begin
			cnt_rows <= cnt_rows;
		end
		else if(last)begin//num_n_r>=(photo_widht-1) && 
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
					buffer_1[i] <= 0;
					buffer_2[i] <= 0;
					buffer_3[i] <= 0;
					buffer_4[i] <= 0;
					buffer_5[i] <= 0;
				end
				else if(last && cnt_rows < photo_high)begin
					buffer_1[i] <= buffer_2[i];
					buffer_2[i] <= buffer_3[i];
					buffer_3[i] <= buffer_4[i];
					buffer_4[i] <= buffer_5[i];
				end
				else if((vaild_conv1_r||vaild_conv1) && (i==cnt_cols) && cnt_rows < photo_high)begin
					buffer_5[cnt_cols] <= data_in;
				end
			end
		end
	endgenerate

	
	///////////////////////////////////////
	/////////25_data///////////////////////
	///////////////////////////////////////
	always@(posedge clk_5x or negedge rst_n)begin
		if(!rst_n)		  
			clk_num5 <= 4'd0;
		else if(last)
			clk_num5 <= 4'd0;
		else if(clk_num5 == 4)
			clk_num5 <= 4'd0;
		else if(vaild_conv1 || vaild)
			clk_num5 <= clk_num5 + 1'b1;
	end
	//
	always@(posedge clk_5x or negedge rst_n)begin
		if(!rst_n)		  
			data_r_n <= 16'd0;
		else if(clk_num5 == 0 && vaild_conv1_r)
			data_r_n <= buffer_1[cnt_cols_r];//减少一个时钟的延迟
		else if(clk_num5 == 1 && vaild_conv1_r)
			data_r_n <= buffer_2[cnt_cols_r];
		else if(clk_num5 == 2 && vaild_conv1_r)
			data_r_n <= buffer_3[cnt_cols_r];
		else if(clk_num5 == 3 && vaild_conv1_r)
			data_r_n <= buffer_4[cnt_cols_r];
		else if(clk_num5 == 4 && vaild_conv1_r)
			data_r_n <= buffer_5[cnt_cols_r];
		else
			data_r_n <= data_r_n;
	end
	
	///////////////////////////////////
	////////////偏置的读取/////////////
	///////////////////////////////////
	genvar n;
	generate 
		for(n=0;n<6;n=n+1)
		begin:datab
			assign data_bias[n] = (c1_b_en && (cnt_cols_r-1)==n)?c1_b:data_bias[n];
		end
	endgenerate
	
//////////////////////////////////////////////////////////////
/////////////////权值的读取////////////////////////////////////
/////////////////权值也是有限的，在linebuffer准备的时候就读取出来放入乘法器中
///////////////////////////////////////////////////////////////

	assign Multiply_weight[0]=c1_w[weight_widht*1-1:weight_widht*0];
	assign Multiply_weight[1]=c1_w[weight_widht*2-1:weight_widht*1];
	assign Multiply_weight[2]=c1_w[weight_widht*3-1:weight_widht*2];
	assign Multiply_weight[3]=c1_w[weight_widht*4-1:weight_widht*3];
	assign Multiply_weight[4]=c1_w[weight_widht*5-1:weight_widht*4];
	assign Multiply_weight[5]=c1_w[weight_widht*6-1:weight_widht*5];
	

//////////////////////////////////////////////////////////////
///////////////////例化六个Multiply_adder///////////////////////
///////////////////////////////////////////////////////////////

	//当cnt_rows>10'd3，说明buffer_5在输入，需要进行乘法了
	assign Multiply_adder_en = (cnt_rows>10'd3)? vaild_conv1_r:1'b0;

	genvar ma_n;
	generate 
		for(ma_n=0; ma_n< 6; ma_n=ma_n+1)
		begin:Multiply_adder
			Multiply_adder n(
				.clk			(clk),
				.clk_2x        (clk_2x),
				.clk_5x        (clk_5x),
				.rst_n		(rst_n),
				.weight_en	(c1_w_en),
				.Multiply_en	(Multiply_adder_en),
				.weight 		(Multiply_weight[ma_n]),
				.data_b 		(data_bias[ma_n]),
				.data_in		(data_r_n),
				.data_out		(out_conv1[ma_n]),
				.out_start	(out_start_r[ma_n]),
				.out_end		(out_end_r[ma_n]),
				.out_vaild	(out_vaild_r[ma_n])
			);
		end
	endgenerate
	
	assign data_out = {out_conv1[5],out_conv1[4],out_conv1[3],out_conv1[2],out_conv1[1],out_conv1[0]};
	assign out_start = out_start_r[0];
	assign out_end = out_end_r[0];
	assign out_vaild = out_vaild_r[0];

endmodule

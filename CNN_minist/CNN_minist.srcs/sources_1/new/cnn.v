`timescale 1ns / 1ps

module cnn
#(parameter photo_high = 7'd28,
parameter photo_widht = 7'd28,
parameter RGB_BIT = 6'd16,
parameter weight_width = 6'd17,
parameter bias_width = 6'd17,
parameter feature_width = 7'd32,
parameter photo_indata = 6'd16)
(
	input           					clk,
	input           					rst_n,
	input           					vaild,
	input           					vaild2,
	input           					input_end,
	output    [feature_width-1:0]    		data_out
	);
	wire								clk_50M;
	wire								clk_100M;
	wire								clk_250M;
	wire	 	[weight_width*6-1 : 0] 		c1_w,c2_w;
	wire	 	[bias_width-1 : 0] 			c1_b,c2_b;
	wire								c1_w_en,c2_w_en;
	wire								c1_b_en,c2_b_en;
	
	wire								vaild_conv1;
	wire	 	[photo_indata-1 : 0] 		conv1_in_data;
	wire 	[feature_width*6-1:0]		conv1_out_data;
	
	wire		[feature_width-1:0]			conv2_out_data;
	wire		conv2_out_start,conv2_out_end,conv2_out_vaild,conv2_out_ready;

	//第一层卷积
	wire	conv1_out_start,conv1_out_end,conv1_out_vaild;

	//最大池化层
	wire		[feature_width*6-1:0]		pooling_data;
	wire		pooling_out_start,pooling_out_end,pooling_out_vaild;
	wire		ram_out_en,ram_full;
	
	wire	 	[feature_width*6-1:0]		feature1_ram_data;

	wire				fc2_out_en;
	wire		[31: 0]	fc2_data_out;
	wire			fifo_200_rd_en,fifo_200_prog_full,fifo_200_out_en;
	wire	[31:0]	fifo_200_data;
	wire				fc1_out_en;
	wire		[31: 0]	fc1_data_out;
	wire			fifo_1000_rd_en,fifo_1000_prog_full,fifo_1000_out_en;
	wire		[31: 0]	fifo_1000_data;
	
    image_data	image_data_u1(
    	
    		.clk			(clk_50M),
    		.rst_n		(rst_n),
    		.vaild		(vaild),
    		.input_end	(input_end),
    		.vaild_conv1	(vaild_conv1),
    		.data_in_conv1	(conv1_in_data)
    	);
    
	// input clk_in1
	clk_wiz_0 clk_wiz_u1(
		// Clock out ports
		.clk_out1(clk_50M),     // output clk_100M
		.clk_out2(clk_100M),     // output clk_100M
		.clk_out3(clk_250M),     // output clk_250M
		// Status and control signals
		.resetn(rst_n), // input resetn
		// Clock in ports
		.clk_in1(clk)
	);   
		
	conv1    conv1_u1(
		.clk			(clk_50M),
		.clk_2x        (clk_100M),
		.clk_5x        (clk_250M),
		.rst_n         (rst_n),
		.data_in       (conv1_in_data),
		.vaild   		(vaild_conv1),
		.last          (input_end),
		.c1_b_en		(c1_b_en),
		.c1_b          (c1_b),
		.c1_w_en		(c1_w_en),
		.c1_w		(c1_w),
		.data_out      (conv1_out_data),
		.out_start	(conv1_out_start),
		.out_end		(conv1_out_end),
		.out_vaild	(conv1_out_vaild)
	);
	
//	第一层卷积的权值读取
	conv1_weight conv1_weight_u1
    (
		.clk			(clk),
		.rst_n		(rst_n),
		.vaild		(vaild_conv1),
		.c1_w_en		(c1_w_en),
		.c1_w		(c1_w)
	    );
//第一层卷积的偏置读取
	conv1_bias	conv1_bias_u1
	(
		.clk			(clk),
		.rst_n		(rst_n),
		.vaild	 	(vaild_conv1),
		.c1_b_en		(c1_b_en),
		.c1_b          (c1_b)
	    );
	
	
	pooling pooling_u1(
		.clk				(clk),
		.rst_n			(rst_n),
		.in_data			(conv1_out_data),
		.in_start			(conv1_out_start),
		.in_last			(conv1_out_end),
		.in_vaild			(conv1_out_vaild),
		.out_data			(pooling_data),
		.out_vaild          (pooling_out_vaild)
	    );
	
	    
	feature1_ram feature1_ram_u0(
	    	.rst_n			(rst_n),
	    	.clk				(clk),
	    	.wr_en			(pooling_out_vaild),
	    	.in_data			(pooling_data),
	    	.tx_ready			(conv2_out_ready),
	    	.rd_en			(ram_out_en),
	    	.prog_full		(ram_full),
	    	.out_data			(feature1_ram_data)
	);
	
	
	conv2    conv2_u1(
		.clk_sys		(clk),
		.clk			(clk_50M),
		.clk_2x        (clk_100M),
		.clk_5x        (clk_250M),
		.rst_n         (rst_n),
		.data_in       (feature1_ram_data),
		.vaild   		(ram_out_en),
		.fifo_full   	(ram_full),
		.last          (1'd0),
		.data_out      (conv2_out_data),
		.out_start	(conv2_out_start),
		.out_end		(conv2_out_end),
		.out_ready	(conv2_out_ready),
		.out_vaild	(conv2_out_vaild)
	);
	
	fifo_1000 fifo_1000_u(
		.clk			(clk),
		.rst_n		(rst_n),
		.data_in		(conv2_out_data),
		.wr_en		(conv2_out_vaild),
		.rd_en		(fifo_1000_rd_en),
		.prog_full	(fifo_1000_prog_full),
		.out_en		(fifo_1000_out_en),
		.data_out		(fifo_1000_data)
	    );
	    
	fc1	fc1_u(
	    	.clk			(clk_50M),
	    	.clk_5x		(clk_250M),
	    	.rst_n		(rst_n),
	    	.vaild		(fifo_1000_out_en),
	    	.data_in		(fifo_1000_data),
	    	.out_en		(fc1_out_en),
	    	.data_out		(fc1_data_out)
	);
	
	
	fifo_200 fifo_200_u(
		.clk			(clk_50M),
		.rst_n		(rst_n),
		.data_in		(fc1_data_out),
		.wr_en		(fc1_out_en),
		.rd_en		(fifo_200_rd_en),
		.prog_full	(fifo_200_prog_full),
		.out_en		(fifo_200_out_en),
		.data_out		(fifo_200_data)
	    );
	
	fc2	fc2_u(
		.clk			(clk_50M),
		.clk_5x		(clk_250M),
		.rst_n		(rst_n),
		.vaild		(fifo_200_out_en),
		.data_in		(fifo_200_data),
		.out_en		(fc2_out_en),
		.data_out		(fc2_data_out)
	);
endmodule

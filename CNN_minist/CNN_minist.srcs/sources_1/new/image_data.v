`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/13 16:04:37
// Design Name: 
// Module Name: image_data
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


module image_data(

	input           		clk,
	input           		rst_n,
	input           		vaild,
	input           		input_end,
	output           		vaild_conv1,
	output	[15 : 0] 		data_in_conv1
    );
    
    	wire [31:0]			data_out_conv2 [0:5];
    	reg 	[5:0]	cnt_col;//ÁÐ
    	reg 	[5:0]	cnt_row;//ÐÐ
    	//vaild_conv1
    	reg [5:0]		cv_28;
    	wire			vaild_conv1_r;
    	reg			vaild_conv1_rl;
	reg			vaild_conv1_r2;
    	(* use_dsp48 = "yes" *)wire		[9:0]	addra;
    	
    	assign  addra = cnt_row * 28+cnt_col-1;
    	assign vaild_conv1_r = (vaild && (cv_28 < 6'd28))? 1'b1:1'b0;
    	assign vaild_conv1 = vaild_conv1_r2;
    	
    	always@(posedge clk or negedge rst_n)begin
    		if(!rst_n)begin
    			vaild_conv1_rl <= 1'd0;
			vaild_conv1_r2 <= 1'd0;
		end
    		else begin
    			vaild_conv1_rl <= vaild_conv1_r;
			vaild_conv1_r2 <= vaild_conv1_rl;
		end
    	end
    	
    	
    	always@(posedge clk or negedge rst_n)begin
    		if(!rst_n)
    			cv_28 <= 0;
    		else if(!vaild)
    			cv_28 <= 6'd0;
    		else if(cv_28 == 6'd29)
    			cv_28 <= cv_28;
    		else if(vaild)
    			cv_28 <= cv_28 + 1'b1;
    	end
    	
	//cnt_col
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)      	
			cnt_col <= 1'b0;
		else if(input_end)  
			cnt_col <= 1'b0;
		else if(vaild)
			cnt_col <= cnt_col + 1'b1;
		else            	
			cnt_col <= 1'b0;
	end
	
	//cnt_row
	always@(negedge vaild or negedge rst_n)begin
		if(!rst_n)
			cnt_row <= 0;
		else if(cnt_row == 6'd27)
			cnt_row <= 0;
		else 
			cnt_row <= cnt_row + 1'b1;
	end
	
    	
    	picture_784 picture_784 (
		.clka(clk),    // input wire clka
		.ena(vaild_conv1_r),      // input wire ena
		.addra(addra),  // input wire [9 : 0] addra
		.douta(data_in_conv1)  // output wire [7 : 0] douta
	);
    	    	
    	
endmodule

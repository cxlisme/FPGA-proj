`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/28 20:53:08
// Design Name: 
// Module Name: conv2_bisa
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


module conv2_bias
#(parameter bias_widht = 6'd17,
parameter bias_num = 7'd10)
(
	input           		clk,
	input           		rst_n,
	input           		vaild,
	output           		c2_b_en,
	output [bias_widht-1: 0]			c2_b
    );
    
    ///////////////////////////////////
    ////////////ƫ�õĶ�ȡ/////////////
    ///////////////////////////////////
    	wire [bias_widht-1: 0]		bias_out;
    	
    	
	reg		[3:0]					rd_vaild;//
	reg		[3:0]					rd_vaild_r;//
	always@(posedge vaild or negedge rst_n)begin
		if(!rst_n)
			rd_vaild <= 4'b0;
		else	if(vaild)
			rd_vaild <= rd_vaild + 1'b1;
	end
    	always@(*)begin
		if(!rst_n)
			rd_vaild_r <= 4'b0;
		else	if(vaild)
			rd_vaild_r <= rd_vaild - 1'b1;
	end
    	
    	
    	
    	B_conv2 B_conv2_u1 (
    		.clka(clk),    // input wire clka
    		.ena(vaild),      // input wire ena
    		.addra(rd_vaild_r),  // input wire [2 : 0] addra
    		.douta(bias_out)//bias_out)  // output wire [15 : 0] douta
    	);
    	
   	assign c2_b = (rd_vaild_r<4'd10)? bias_out:c2_b;
    
	assign c2_b_en = (rd_vaild > 1'd0)? vaild:1'b0;
    
endmodule
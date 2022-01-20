`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/13 13:45:04
// Design Name: 
// Module Name: conv1_weight
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


module conv1_bias
#(parameter bias_width = 7'd17)
(
	input           		clk,
	input           		rst_n,
	input           		vaild,
	output           		c1_b_en,
	output [bias_width-1: 0]	c1_b
    );
    
    ///////////////////////////////////
    ////////////偏置的读取/////////////
    ///////////////////////////////////
	reg				en_r;
    	reg				en_r2;
    	wire [bias_width-1: 0]		bias_out;
	reg [4: 0] 		num_n;
	reg [4: 0] 		num_n_r;
	
    	assign c1_b_en = (num_n < 6'd7)? en_r:1'b0;
    	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			en_r <= 1'b0;
			en_r2 <= 1'b0;
		end
		else	begin
			en_r2 <= vaild;
			en_r <= en_r2;
		end
    	end
    	
    	
	//num_n,计算第几列
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)      			
			num_n_r <= 3'd0;
		else if(num_n_r >5'd6)  
			num_n_r <= num_n_r;
		else if(vaild)
			num_n_r <= num_n_r + 1'b1;
	end
    	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)      			
			num_n <= 3'd0;
		else
			num_n <= num_n_r;
	end
    	
    	B_conv1 B_conv1 (
    		.clka(clk),    // input wire clka
    		.ena(vaild),      // input wire ena
    		.addra(num_n),  // input wire [2 : 0] addra
    		.douta(bias_out)  // output wire [15 : 0] douta
    	);
    	
    	assign c1_b = bias_out;
    
    
    
endmodule
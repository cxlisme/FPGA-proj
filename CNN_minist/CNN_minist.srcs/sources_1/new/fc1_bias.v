`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/10 20:14:15
// Design Name: 
// Module Name: fc2_bias
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


module fc1_bias(
	input			clk_5x,
	input			rst_n,
	input			en,
	output	[47: 0]	data_out
    );
     
     reg	[7:0]	addra;
     wire	[16:0]	douta; 
     
     always@(negedge en or negedge rst_n)begin
     	if(!rst_n)
     		addra <= 7'd0;
     	else
     		addra <= addra + 1'd1;
     end 
     
	B_fc1 B_fc1_u (
        	  .clka(clk_5x),    // input wire clka
        	  .ena(en),      // input wire ena
        	  .addra(addra),  // input wire [7 : 0] addra
        	  .douta(douta)  // output wire [16 : 0] douta
        	);
     assign data_out = (douta[16])? {32'hffffffff,~douta[15:0]+1}:douta;
     
endmodule

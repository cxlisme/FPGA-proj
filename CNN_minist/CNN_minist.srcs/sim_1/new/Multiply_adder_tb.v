`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/17 20:13:55
// Design Name: 
// Module Name: Multiply_adder_tb
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


module Multiply_adder_tb();
	reg				clk		;
	reg            	clk_3x	;
	reg            	rst_n	;
	reg            	en		;
	reg   [8 : 0]       data[8:0]	;
	wire   [31: 0]       data_out	;
Multiply_adder mult(
	.clk		(clk),
	.clk_3x	(clk_3x),
	.rst_n	(rst_n),
	.en		(en),
	.data1	(data[0]),
	.data2	(data[1]),
	.data3	(data[2]),
	.data4	(data[3]),
	.data5	(data[4]),
	.data6	(data[5]),
	.data7	(data[6]),
	.data8	(data[7]),
	.data9	(data[8]),
	.data_out	(data_out)
);


initial begin
	clk = 0;
	forever #15 clk = ~clk;
end


initial begin
	clk_3x = 0;
	forever #5 clk_3x = ~clk_3x;
end


//data_r3
genvar k;
generate 
	for(k=0;k<9;k=k+1)
	begin:data99
		initial begin
			data[k] = 9'b0;
			#5 if(en)			data[k] = data[k] + 1'b1;
			forever #10 if(en)	data[k] = data[k] + 1'b1;
		end
	end
endgenerate

initial begin
			rst_n = 1'b0;	en = 1'b0;
	#10 		rst_n = 1'b1;	en = 1'b0;
	#10 		rst_n = 1'b1;	en = 1'b1;
	#2000 	rst_n = 1'b1;	en = 1'b0;
end

endmodule

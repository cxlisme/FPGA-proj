`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/19 14:21:38
// Design Name: 
// Module Name: fixpmul_tb
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


module fixpmul_tb();
    parameter IW = 8; //整数位宽
    parameter FW = 8; //小数位宽
    reg signed [IW+FW-1 : 0] a;
    reg signed [IW+FW-1 : 0] b;
    wire signed [IW*2+FW*2-1 : 0] o;
    
    fixpmul fixpmul(
        .a(a),
        .b(b),
        .o(o)
    );
    
	initial begin
    			a = 16'h0000;	b = 16'h0000;
    		#20 	a = 16'h4800;	b = 16'h6240;
    		#20 	a = 16'he600;	b = 16'h5a60;
    		#20 	a = 16'h4e00;	b = 16'ha620;
    		#20 	a = 16'h4800;	b = 16'h6240;
    		#20 	a = 16'he620;	b = 16'h5a60;
    		#20 	a = 16'h4e90;	b = 16'ha620;
    		#20 	a = 16'h4860;	b = 16'h6245;
    		#20 	a = 16'he620;	b = 16'h5a60;
    		#20 	a = 16'h4e90;	b = 16'ha620;
    		#20 	a = 16'h4860;	b = 16'h6240;
    		#20 	a = 16'he620;	b = 16'h5a00;
    		#20 	a = 16'h4e90;	b = 16'ha600;
    		#20 	a = 16'h4860;	b = 16'h6200;
    		#20 	a = 16'he620;	b = 16'h5a00;
    		#20 	a = 16'h4e90;	b = 16'ha600;
    		#20 	a = 16'h4860;	b = 16'h6200;
    		#20 	a = 16'he625;	b = 16'h5a00;
    		#20 	a = 16'h4e96;	b = 16'ha600;

	end
endmodule

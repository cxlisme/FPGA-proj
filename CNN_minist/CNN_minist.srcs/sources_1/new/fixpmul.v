`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/19 14:19:40
// Design Name: 
// Module Name: fixpmul
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
//16位*16位结果化简成为16位（）

module fixpmul
#(
    parameter IW = 16, //整数位宽
    parameter FW = 16  //小数位宽
)(
    input signed [IW+FW-1 : 0] a,
    input signed [IW+FW-1 : 0] b,
    output signed [IW*2+FW*2-1 : 0] out
);
    (* multstyle = "dsp" *) wire signed [IW*2+FW*2-1 : 0] long;
    assign long = a * b;
    assign out = long;// >>> FW;
endmodule

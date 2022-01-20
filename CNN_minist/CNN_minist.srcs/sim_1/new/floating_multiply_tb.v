`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/22 15:41:51
// Design Name: 
// Module Name: floating_multiply_tb
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

module floating_multiply_tb();
 
reg aclk;
reg aresetn;
reg [15: 0]	s_axis_a_tdata;
reg [15: 0]	s_axis_b_tdata;
reg 			result_tready;

initial
begin
		aclk=1'b1;	aresetn=1'b1;	s_axis_a_tdata = 16'h0000;
		s_axis_b_tdata = 32'h0000;	result_tready = 1'b0;
	#20 	aresetn=1'b1;	s_axis_a_tdata = 16'h432f;	s_axis_b_tdata = 16'h46c2;	
	#20 	aresetn=1'b1;	s_axis_a_tdata = 16'h4498;	s_axis_b_tdata = 16'h45c2;	
	#20 	aresetn=1'b1;	s_axis_a_tdata = 16'h4598;	s_axis_b_tdata = 16'h44c2;	
	#20 	aresetn=1'b1;	s_axis_a_tdata = 16'h4698;	s_axis_b_tdata = 16'h4384;	
	#20 	aresetn=1'b1;	s_axis_a_tdata = 16'h4798;	s_axis_b_tdata = 16'h4184;	
	#20 	aresetn=1'b1;	s_axis_a_tdata = 16'h484c;	s_axis_b_tdata = 16'h3f08;	
	#20 	aresetn=1'b1;	s_axis_a_tdata = 16'h48cc;	s_axis_b_tdata = 16'h3a10;	
	#20 	aresetn=1'b1;	s_axis_a_tdata = 16'h494c;	s_axis_b_tdata = 16'hb3c0;	
	#20 	aresetn=1'b1;	s_axis_a_tdata = 16'h49cc;	s_axis_b_tdata = 16'hbcf8;	
	#20 	aresetn=1'b1;	s_axis_a_tdata = 16'h4a4c;	s_axis_b_tdata = 16'hc07c;	
end
always #5 aclk=~aclk;

always #10 result_tready=~result_tready;

//0x432f  :3.59245242455
//0x46c2  :6.7578578578
//0x4e12:  24.27728284601788
  
//0x4498  :4.59245242455
//0x45c2  :5.7578578578
//0x4e9c:  26.442688279267884
  
//0x4598  :5.59245242455
//0x44c2  :4.7578578578
//0x4ea7:  26.60809371251788
  
//0x4698  :6.59245242455
//0x4384  :3.7578578578000004
//0x4e32:  24.773499145767882
  
//0x4798  :7.59245242455
//0x4184  :2.7578578578000004
//0x4d3c:  20.938904579017883
  
//0x484c  :8.59245242455
//0x3f08  :1.7578578578000004
//0x4b8d:  15.104310012267883
  
//0x48cc  :9.59245242455
//0x3a10  :0.7578578578000004
//0x4745:  7.269715445517883
  
//0x494c  :10.59245242455
//0xb3c0  :-0.24214214219999963
//0xc121:  -2.564879121232117
  
//0x49cc  :11.59245242455
//0xbcf8  :-1.2421421421999996
//0xcb33:  -14.399473687982116
  
//0x4a4c  :12.59245242455
//0xc07c  :-2.2421421421999996
//0xcf0f:  -28.234068254732115

//32'h3E4CCCCD=0.2,32'h4047AE14=3.12,32'h4084CCCD=4.15
//计算结果应该是0.2*3.12+4.15=4.774=32'h4098C49C
wire 					result_tvalid;
wire			[15:0]		result_tdata;
wire						a_tready;
wire						b_tready;
floating_multiply floating_multiply (
	.aclk(aclk),                                  // input wire aclk
	.s_axis_a_tvalid(1'b1),            			// input wire s_axis_a_tvalid
	.s_axis_a_tready(a_tready),            // output wire s_axis_a_tready
	.s_axis_a_tdata(s_axis_a_tdata),              // input wire [15 : 0] s_axis_a_tdata
	.s_axis_b_tvalid(1'b1),            			// input wire s_axis_b_tvalid
	.s_axis_b_tready(b_tready),            // output wire s_axis_b_tready
	.s_axis_b_tdata(s_axis_b_tdata),              // input wire [15 : 0] s_axis_b_tdata
	.m_axis_result_tvalid(result_tvalid),  // output wire m_axis_result_tvalid
	.m_axis_result_tready(result_tready),  // input wire m_axis_result_tready
	.m_axis_result_tdata(result_tdata)    // output wire [15 : 0] m_axis_result_tdata
);

endmodule
 
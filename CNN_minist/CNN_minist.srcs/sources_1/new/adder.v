`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/23 17:31:51
// Design Name: 
// Module Name: adder
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


module adder(
//	input	clk_5x,
//	output	[31: 0]	sum
    	);
    	reg 		clk_5x;
	reg 	[15 : 0]	a_tdata;
	reg 	[15 : 0]	b_tdata;
    	wire		s_axis_a_tready;
	wire		s_axis_b_tready;
	wire		result_tvalid;
	wire		result_tdata;
	
	
	initial begin
					clk_5x = 1'b0;
				#50 	clk_5x = ~clk_5x;
		forever #10 	clk_5x = ~clk_5x;
	end
    	
	initial begin
			a_tdata = 16'h0000;	b_tdata = 16'h0000;
		#20 	a_tdata = 16'h4865;	b_tdata = 16'h6245;
		#20 	a_tdata = 16'he625;	b_tdata = 16'h5a62;
		#20 	a_tdata = 16'h4e96;	b_tdata = 16'ha620;
		#20 	a_tdata = 16'h0;	b_tdata = 16'h0;
		#20 	a_tdata = 16'h0;	b_tdata = 16'h0;
		#20 	a_tdata = 16'h0;	b_tdata = 16'h0;
	end
    	
    	floating_adder your_instance_name (
		.aclk(clk_5x),                                  // input wire aclk
		
		.s_axis_a_tvalid(1'b1),            // input wire s_axis_a_tvalid
		.s_axis_a_tready(s_axis_a_tready),            // output wire s_axis_a_tready
		.s_axis_a_tdata(a_tdata),              // input wire [15 : 0] s_axis_a_tdata
		
		.s_axis_b_tvalid(1'b1),            // input wire s_axis_b_tvalid
		.s_axis_b_tready(s_axis_b_tready),            // output wire s_axis_b_tready
		.s_axis_b_tdata(b_tdata),              // input wire [15 : 0] s_axis_b_tdata
		
		.m_axis_result_tvalid(result_tvalid),  // output wire m_axis_result_tvalid
		.m_axis_result_tdata(result_tdata)    // output wire [15 : 0] m_axis_result_tdata
    	);
    	
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/09 12:16:55
// Design Name: 
// Module Name: fifo_1000
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


module fifo_1000(
	input 			clk,
	input			rst_n,
	input	[31:0]	data_in,
	input			wr_en,
	input			rd_en,
	output			prog_full,
	output			out_en,
	output	[31:0]	data_out
    );
    
     wire				full,empty,rd_en_r;
	reg 				rd_en_r2;
   	reg [11:0]		cnt_data;
	reg [11:0]		cnt_data_r;
	reg [11:0]		cnt_addr;
   	wire				flag_full;
   	
    fifo_generator_1000 fifo_generator_1000_u (
      .clk(clk),              // input wire clk
      .srst(!rst_n),            // input wire srst
      .din(data_in),              // input wire [31 : 0] din
      .wr_en(wr_en),          // input wire wr_en
      .rd_en(rd_en_r),          // input wire rd_en
      .dout(data_out),            // output wire [31 : 0] dout
      .full(full),            // output wire full
      .empty(empty),          // output wire empty
      .prog_full(prog_full)  // output wire prog_full
    );
    
   	
	assign flag_full = (prog_full) ? 1'b0:flag_full;
   	
    	always@(posedge clk or negedge rst_n)begin
    		if(!rst_n)
    			cnt_data <= 12'd0;
		else	if(cnt_data == 12'd1000)
			cnt_data <= cnt_data;
    		else	if(wr_en)
    			cnt_data <= cnt_data + 1'd1;
    	end
    	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			cnt_data_r <= 12'd0;
		else
			cnt_data_r <= cnt_data;
	end
    	
    	assign rd_en_r = (cnt_data_r == 12'd1000 && !empty)? 1'd1:1'd0;
    	
    
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			rd_en_r2 <= 1'd0;
		else
			rd_en_r2 <= rd_en_r;
	end
	
	assign out_en = rd_en_r2;
    
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			cnt_addr <= 12'd0;
		else if(cnt_addr == 12'd999)
			cnt_addr <= 12'd0;
		else if(rd_en)
			cnt_addr <= cnt_addr+1'd1;
	end
    
endmodule

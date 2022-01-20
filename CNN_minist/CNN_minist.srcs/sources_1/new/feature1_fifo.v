`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/26 14:36:24
// Design Name: 
// Module Name: feature1_fifo
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


module feature1_fifo(
	input 			rst_n,
	input 			clk,
	input 			wr_en,
	input  [32*6-1:0] 	in_data,
	input			tx_ready,
	output 			rd_en,
	output			prog_full,
	output  [32*6-1:0] 	out_data
    );
    
    	
//    	wire				full,empty,wr_rst_busy,rd_rst_busy,prog_full_r;
//    	wire		[32*6-1:0] 	out_data_r;
    	
//    	fifo_generator_0 fifo_u0 (
//    	      .rst(!rst_n),                  // input wire rst
//    	      .wr_clk(clk),            // input wire wr_clk
//    	      .rd_clk(clk),            // input wire rd_clk
//    	      .din(in_data),                  // input wire [31 : 0] din
//    	      .wr_en(wr_en),              // input wire wr_en
//    	      .rd_en(rd_en),              // input wire rd_en
//    	      .dout(out_data_r),                // output wire [31 : 0] dout
//    	      .full(full),                // output wire full
//    	      .empty(empty),              // output wire empty
//    	      .prog_full(prog_full_r),      // output wire prog_full
//    	      .wr_rst_busy(wr_rst_busy),  // output wire wr_rst_busy
//    	      .rd_rst_busy(rd_rst_busy)  // output wire rd_rst_busy
//    	    );    
    	reg		[9:0]		cnt_addra,cnt_addrb;
    	wire		[32*6-1:0] 	out_data_ram;
    	reg 					ram_empty;
    	reg					rd_en_r,rd_en_r2;
    	    	
    	
    	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			ram_empty <= 1'b0;
		else if(wr_en && cnt_addra == 10'd11)
			ram_empty <= 1'b1;
		else
			ram_empty <= 1'b0;
	end
    	
    	
    	always@(posedge clk or negedge rst_n)begin
    		if(!rst_n)
    			cnt_addra <= 10'b0;
		else if(tx_ready)
			cnt_addra <= 10'b0;
		else if(cnt_addra == 10'd145)
			cnt_addra <= 10'b0;
    		else if(wr_en)
    			cnt_addra <= cnt_addra + 1'b1;
    	end
    	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			cnt_addrb <= 10'b0;
		else if(tx_ready)
			cnt_addrb <= 10'b0;
		else if(cnt_addrb == 10'd145)
			cnt_addrb <= cnt_addrb;
		else if(rd_en_r)
			cnt_addrb <= cnt_addrb + 1'b1;
	end
	
    	assign prog_full = (cnt_addra == 10'd144)? 1'b1:1'b0;
    	
    	feature_ram feature_ram_u (
    	      .clka(clk),    // input wire clka
    	      .ena(wr_en),      // input wire ena
    	      .wea(1'd1),      // input wire [0 : 0] wea
    	      .addra(cnt_addra),  // input wire [7 : 0] addra
    	      .dina(in_data),    // input wire [191 : 0] dina
    	      .clkb(clk),    // input wire clkb
    	      .enb(rd_en_r),      // input wire enb
    	      .addrb(cnt_addrb),  // input wire [7 : 0] addrb
    	      .doutb(out_data_ram)  // output wire [191 : 0] doutb
    	    );
    	    
    	assign out_data  = out_data_ram;
    	
    	
    	assign rd_en = rd_en_r2;
    	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			rd_en_r2 <= 1'b0;
		else
			rd_en_r2 <= rd_en_r;
	end
    	
    	always@(posedge clk or negedge rst_n)begin
    		if(!rst_n)
    			rd_en_r <= 1'b0;
    		else if(tx_ready)
    			rd_en_r <= 1'b1;
    		else if(cnt_addrb == 10'd144)
    			rd_en_r <= 1'b0;
    		else
    			rd_en_r <= rd_en_r;
    	end
    	
    	
    	
    	//assign prog_full = empty? 1'b0:prog_full_r;
    	
endmodule

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


module feature1_ram(
	input 			rst_n,
	input 			clk,
	input 			wr_en,
	input  [32*6-1:0] 	in_data,
	input			tx_ready,
	output 			rd_en,
	output			prog_full,
	output  [32*6-1:0] 	out_data
    );
    
    	
    	reg		[9:0]		cnt_addra,cnt_addrb;
    	reg		[32*6-1:0] 	out_data_r;
	wire		[31:0]		out_conv1	[0:5];
    	reg 					ram_empty;
    	reg					rd_en_r,rd_en_r2,rd_en_r3;
    	    	
    	
    	always@(posedge clk or negedge rst_n)begin
    		if(!rst_n)
    			out_data_r <= 192'd0;
    		else if(rd_en_r3)
			out_data_r <= {out_conv1[5],out_conv1[4],out_conv1[3],out_conv1[2],out_conv1[1],out_conv1[0]};
    	end
    	
    	assign out_data = out_data_r;
	assign rd_en = rd_en_r3;
    	
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
    	      .doutb({out_conv1[5],out_conv1[4],out_conv1[3],out_conv1[2],out_conv1[1],out_conv1[0]})  // output wire [191 : 0] doutb
    	    );
    	    
    	
    	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			rd_en_r2 <= 1'b0;
			rd_en_r3 <= 1'b0;
		end
		else begin
			rd_en_r2 <= rd_en_r;
			rd_en_r3 <= rd_en_r2;
		end
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
    	
endmodule

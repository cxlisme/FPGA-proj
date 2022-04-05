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


module conv1_weight
#(parameter photo_high = 7'd28,
parameter photo_widht = 7'd28,
parameter kernel_size = 4'd5,
parameter parameter_w = kernel_size * kernel_size * 6,//六个卷积核
parameter weight_widht = 6'd17,
parameter pix_widht = 6'd16)
(
	input           				clk,
	input           				rst_n,
	input           				vaild,
	output           				c1_w_en,
	output [weight_widht*6-1 : 0] 	c1_w
    );
    
    ///////////////////////////////////////////////////////////////
    /////////////////权值的读取////////////////////////////////////
    /////////////////权值也是有限的，在linebuffer准备的时候就读取出来放入乘法器中
    ///////////////////////////////////////////////////////////////
    
	wire 	[weight_widht-1 : 0] 		w_dout;
	wire	 	[weight_widht-1 : 0] 		weight[0:parameter_w-1];
	wire		[7 : 0] 					addra_w;
	reg 		[7:0]					cnt_addra;
	wire								en;
	reg								weight_flag;
	reg	 	[weight_widht-1 : 0] 		Multiply_weight[0:5];
	reg		[5:0]					cnt_weight25;   
	
	assign  en = (weight_flag && (cnt_addra<8'd150))?1'b1:1'b0;
	
	always@(*)begin
		if(!rst_n)
			weight_flag <= 1'd0;
		else if(vaild)
			weight_flag <= 1'd1;
	end
			
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			cnt_addra <= 7'd0;
		else if(cnt_addra == 8'd150)
			cnt_addra <= cnt_addra;
		else if(weight_flag)
			cnt_addra <= cnt_addra + 1'd1;
		else
			cnt_addra <= cnt_addra;
	end
	
	assign addra_w = cnt_addra; 
    		
    	//权值的读取
    	W_conv1 W1 (
    		.clka(clk),    // input wire clka
    		.ena(en),      // input wire ena
    		.addra(addra_w),  // input wire [7 : 0] addra
    		.douta(w_dout)  // output wire [15 : 0] douta
    	);
    	
    	//weight,
    	genvar w_i;
    	generate 
    		for(w_i=0;w_i<parameter_w;w_i=w_i+1)
    		begin:weight_i
    			assign weight[w_i] = (weight_flag && (addra_w-1)==w_i) ? w_dout: weight[w_i];
    		end
    	endgenerate
	
	assign  c1_w_en = (weight_flag && (cnt_addra==8'd150) && (cnt_weight25 < 6'd25))? 1'b1:1'b0;
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)		  
			cnt_weight25 <= 6'd0;
		else if(cnt_weight25 == 6'd25)
			cnt_weight25 <= cnt_weight25;
		else if(c1_w_en)
			cnt_weight25 <= cnt_weight25 + 1'b1;
	end
	
	//将权值通过六个变量依次输出到Multiply_adder中
	genvar m_w;
	generate 
		for(m_w=0; m_w< 6; m_w=m_w+1)
		begin:Multiply_weight_n
			always@(posedge clk or negedge rst_n)begin
				if(!rst_n)			
					Multiply_weight[m_w] <= 16'd0;
				else if(c1_w_en)
					Multiply_weight[m_w] <= weight[m_w*25+cnt_weight25];
			end
		end
	endgenerate
	
	assign c1_w = {Multiply_weight[5],Multiply_weight[4],Multiply_weight[3],Multiply_weight[2],Multiply_weight[1],Multiply_weight[0]};

endmodule

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


module conv2_weight
#(parameter photo_high = 7'd12,
parameter photo_widht = 7'd12,
parameter kernel_size = 4'd3,
parameter kernel_num1 = 4'd6,
parameter kernel_num2 = 4'd10,
parameter weight_num = 10'd54,//六个卷积核
parameter weight_widht = 6'd17)
(
	input           						clk,
	input           						rst_n,
	input           						vaild,
	output           						c2_w_en,
	output [weight_widht*kernel_num2-1 : 0] 	c2_w
    );
    
    ///////////////////////////////////////////////////////////////
    /////////////////权值的读取////////////////////////////////////
    /////////////////权值也是有限的，在linebuffer准备的时候就读取出来放入乘法器中
    ///////////////////////////////////////////////////////////////

	wire 	[weight_widht-1 : 0] 		w_dout;
	wire	 	[weight_widht-1 : 0] 		weight[0:weight_num-1];
	wire		[11:0] 					addra_w;
	wire								en;
	reg 		[11:0]					cnt_addra;
	reg								weight_flat;
	reg		[3:0]					rd_vaild;//
	reg		[3:0]					rd_vaild_r;//
	
	reg	 	[weight_widht-1 : 0] 		Multiply_weight[0:kernel_num1-1];
	reg		[5:0]					cnt_weight;   
		
	always@(posedge vaild or negedge rst_n)begin
		if(!rst_n)
			rd_vaild <= 4'b0;
		else	if(vaild)
			rd_vaild <= rd_vaild + 1'b1;
	end

	
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			rd_vaild_r <= 4'b0;
		else
			rd_vaild_r <= rd_vaild;
	end
	
	assign  en = ((rd_vaild<4'd11) && weight_flat && (cnt_addra<weight_num))?1'b1:1'b0;
	
	always@(*)begin
		if(!rst_n)
			weight_flat = 1'd0;
		else if(vaild || !c2_w_en)
			weight_flat = ~weight_flat;
		
	end
			
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			cnt_addra <= 11'd0;
		else if(rd_vaild_r<rd_vaild)//(cnt_addra == weight_num)
			cnt_addra <= 11'd0;
		else if(weight_flat)
			cnt_addra <= cnt_addra + 1'd1;
		else
			cnt_addra <= cnt_addra;
	end
	assign addra_w = cnt_addra+(rd_vaild-1)*weight_num; 
	
    	//权值的读取
    	W_conv2 W2 (
    		.clka(clk),    // input wire clka
    		.ena(en),      // input wire ena
    		.addra(addra_w),  // input wire [7 : 0] addra
    		.douta(w_dout)  // output wire [15 : 0] douta
    	);
    	
    	
    	//weight,
    	genvar w_i;
    	generate 
    		for(w_i=0;w_i<weight_num;w_i=w_i+1)
    		begin:weight_i
    			assign weight[w_i] = (weight_flat && (cnt_addra-1)==w_i) ? w_dout: weight[w_i];
    		end
    	endgenerate
    	
    	//接下来将权值通过六个变量依次输出到Multiply_adder中
	assign  c2_w_en = ((rd_vaild<4'd11) && weight_flat && (cnt_addra>=weight_num) && (cnt_weight < kernel_size*kernel_size))? 1'b1:1'b0;
	
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)		  
			cnt_weight <= 6'd0;
		else if(rd_vaild_r<rd_vaild)//(cnt_addra == weight_num)
			cnt_weight <= 6'd0;
		else if(c2_w_en)
			cnt_weight <= cnt_weight + 1'b1;
	end
	
	
	genvar m_w;
	generate 
		for(m_w=0; m_w<kernel_num2; m_w=m_w+1)
		begin:Multiply_weight_n
			
			always@(posedge clk or negedge rst_n)begin
				if(!rst_n)
					Multiply_weight[m_w] <= 17'd0;
				else if(c2_w_en)
					Multiply_weight[m_w] <= weight[m_w*kernel_size*kernel_size+cnt_weight];
			end
		end
	endgenerate
	
	assign c2_w = {Multiply_weight[5],Multiply_weight[4],Multiply_weight[3],Multiply_weight[2],Multiply_weight[1],Multiply_weight[0]};

endmodule

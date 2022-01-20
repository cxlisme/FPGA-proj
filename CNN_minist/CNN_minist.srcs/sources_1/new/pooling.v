`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/08/02 15:56:29
// Design Name: 
// Module Name: pooling
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



module pooling
#(parameter photo_high = 7'd24,
parameter photo_widht = 7'd24,
parameter kernel_size = 4'd5,
parameter parameter_w = kernel_size * kernel_size * 6,//六个卷积核
parameter weight_widht = 6'd17,
parameter feature_widht = 7'd32,
parameter pix_widht = 6'd16)
(
	input           			clk,
	input           			rst_n,
	input [feature_widht*6-1:0]  	in_data,
	input           			in_start,
	input           			in_last,
	input           			in_vaild,
	output[feature_widht*6-1:0]  	out_data,
	output					out_vaild
    );
    
    	//////////////////////////////
    	//////buffer//////////////////
    	//////////////////////////////
    	reg [feature_widht*6-1: 0] 	buffer_1[0:photo_widht-1];
    	reg [feature_widht*6-1: 0] 	buffer_2[0:photo_widht-1];
    	//in_vaild延迟一拍
	reg			in_vaild_r;
	reg			in_last_r;
	///////cnt_rows计算第多少列-
	reg [11: 0] 	cnt_rows;
	///////cnt_cols计算第多少列
	reg [11: 0] 	cnt_cols;
    	
	//例化六个max算法
	wire		[feature_widht-1:0]		pooling_data0 [0:5];	//6层，每层4个比较，取最大值
	wire		[feature_widht-1:0]		pooling_data1 [0:5];	//6层，每层4个比较，取最大值
	wire		[feature_widht-1:0]		pooling_data2 [0:5];	//6层，每层4个比较，取最大值
	wire		[feature_widht-1:0]		pooling_data3 [0:5];	//6层，每层4个比较，取最大值
	wire		[feature_widht-1:0]		pooling_cop1[0:5];		//6层，每层4个比较，取最大值
	wire		[feature_widht-1:0]		pooling_cop2[0:5];		//6层，每层4个比较，取最大值
	wire		[feature_widht-1:0]		pooling_max [0:5];		//6层，每层4个比较，取最大值
		
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			in_vaild_r <= 1'b0;
			in_last_r <= 1'b0;
		end
		else begin
			in_vaild_r <= in_vaild;
			in_last_r <= in_last;
		end
	end
		
	always@(posedge in_vaild_r or negedge rst_n)begin
		if(!rst_n)
			cnt_rows <= 1'b0;
		else
			cnt_rows <= cnt_rows + 1'b1;
	end
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)      			
			cnt_cols <= 1'b0;
		else if(in_last_r)
			cnt_cols <= 1'b0;
		else if(in_vaild_r)
			cnt_cols <= cnt_cols + 1'b1;
		else
			cnt_cols <= cnt_cols;
	end
    	
	//数据输入到buffer中
	//data_r1，flag_num>=kernel_size-1时，进行数据更替
	genvar i;
	generate 
		for(i=0;i<photo_widht;i=i+1)
		begin:buffer_n
			always@(posedge clk or negedge rst_n)begin
				if(!rst_n)begin
					buffer_1[i] <= 0;
					buffer_2[i] <= 0;
				end
				else if(in_last_r)begin
					buffer_1[i] <= buffer_2[i];
				end
				else if(in_vaild_r && i==cnt_cols)begin
					buffer_2[i] <= in_data;
				end
			end
		end
	endgenerate
    	
    	
    	genvar j;
    	generate 
    		for(j=0;j<6;j=j+1)
    		begin:pooling_n
    			assign pooling_data0[j] = (cnt_cols>1'b0&& !cnt_cols[0])? buffer_1[cnt_cols-2][32*(j+1)-1:32*j]:32'd0;
			assign pooling_data1[j] = (cnt_cols>1'b0&& !cnt_cols[0])? buffer_1[cnt_cols-1][32*(j+1)-1:32*j]:32'd0;
			assign pooling_data2[j] = (cnt_cols>1'b0&& !cnt_cols[0])? buffer_2[cnt_cols-2][32*(j+1)-1:32*j]:32'd0;
			assign pooling_data3[j] = (cnt_cols>1'b0&& !cnt_cols[0])? buffer_2[cnt_cols-1][32*(j+1)-1:32*j]:32'd0;
    		end
    	endgenerate
    	
    	genvar cop1;
    	generate 
    		for(cop1=0;cop1<6;cop1=cop1+1)
    		begin:cop1_n
    			assign pooling_cop1[cop1] = (pooling_data0[cop1]>pooling_data1[cop1])? pooling_data0[cop1]:pooling_data1[cop1];
    		end
    	endgenerate
    	
    	genvar cop2;
    	generate 
    		for(cop2=0;cop2<6;cop2=cop2+1)
    		begin:cop2_n
    			assign pooling_cop2[cop2] = (pooling_data2[cop2]>pooling_data3[cop2])? pooling_data2[cop2]:pooling_data3[cop2];
    		end
    	endgenerate
    	
	genvar p_max;
	generate 
		for(p_max=0;p_max<6;p_max=p_max+1)
		begin:max_n
			assign pooling_max [p_max] = (pooling_cop1[p_max]>pooling_cop2[p_max])? pooling_cop1[p_max]:pooling_cop2[p_max];
		end
	endgenerate
	
	assign out_data = out_vaild? {pooling_max[5],pooling_max[4],pooling_max[3],pooling_max[2],pooling_max[1],pooling_max[0]}:out_data;
	
	assign out_vaild = (cnt_cols>1'b0 && !cnt_cols[0] && !cnt_rows[0])? 1'b1:1'b0;
	
endmodule

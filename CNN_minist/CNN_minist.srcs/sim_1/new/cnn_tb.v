`timescale 1ns / 1ps

module cnn_tb();
	parameter RGB_BIT = 5'd16;
	reg   				clk;
	reg   				rst_n;
	reg  [RGB_BIT-1:0]		data_in;
	reg   				vaild;
	reg   				vaild2;
	reg   				last	;
     wire	 [31:0]			data_out;
     
cnn cnn(
	.clk			(clk),
	.rst_n		(rst_n),
	.vaild		(vaild),
	.vaild2		(vaild2),
	.input_end	(last),
	.data_out      (data_out)
	);

initial begin
				clk = 1'b0;
	forever #10 	clk = ~clk;
end


initial begin			
			rst_n = 0;	vaild = 0;	last = 0;
	#30		rst_n = 1;	vaild = 0;	last = 0;
	#1000	rst_n = 1;	vaild = 1;	last = 0;	vaild2=1;
	forever	begin
		#850		rst_n = 1;	vaild = 1;	last = 1;
		#20		rst_n = 1;	vaild = 0;	last = 0;
		#200		rst_n = 1;	vaild = 1;	last = 0;
	end
end
endmodule

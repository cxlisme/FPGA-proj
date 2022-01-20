`timescale 1ns / 1ps

module conv_2d_tb();
	parameter RGB_BIT = 5'd9;
	reg   				clk;		
	reg   				clk_3x;		
	reg   				rst_n;
	reg  [RGB_BIT-1:0]		data_in;
	reg   				vaild;
	reg   				last	;
     wire	 [31:0]			data_out;
     
conv_2d conv_2d(
	.clk			(clk			),
	.clk_3x		(clk_3x		),
	.rst_n		(rst_n		),
	.data_in		(data_in		),
	.vaild		(vaild		),
	.last		(last		),
	.data_out		(data_out		)
	);

initial begin
				clk = 1'b0;
	forever #15 	clk = ~clk;
end

initial begin
				clk_3x = 1'b0;
	forever #5 	clk_3x = ~clk_3x;
end

initial begin			
			rst_n = 0;	data_in=0;	vaild = 0;	last = 0;
	#45		rst_n = 1;	data_in=10;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=20;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=30;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=40;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=50;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=60;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=70;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=80;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=90;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=50;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=40;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=60;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=40;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=60;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=10;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=80;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=50;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=110;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=10;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=20;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=220;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=40;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=60;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=160;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=70;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=80;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=90;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=15;	vaild = 1;	last = 1;
	#30		rst_n = 1;	data_in=60;	vaild = 0;	last = 0;
	#30		rst_n = 1;	data_in=215;	vaild = 0;	last = 0;
	#30		rst_n = 1;	data_in=10;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=120;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=30;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=40;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=508;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=60;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=70;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=85;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=90;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=10;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=28;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=37;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=40;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=55;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=60;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=72;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=80;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=90;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=12;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=20;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=30;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=40;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=55;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=60;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=70;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=88;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=96;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=10;	vaild = 1;	last = 1;
	#30		rst_n = 1;	data_in=66;	vaild = 0;	last = 0;
	#30		rst_n = 1;	data_in=0;	vaild = 0;	last = 0;
	#30		rst_n = 1;	data_in=10;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=22;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=30;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=40;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=55;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=60;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=75;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=80;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=90;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=10;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=20;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=30;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=49;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=50;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=60;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=73;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=80;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=90;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=16;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=20;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=37;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=40;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=50;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=68;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=76;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=80;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=95;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=10;	vaild = 1;	last = 1;
	#30		rst_n = 1;	data_in=67;	vaild = 0;	last = 0;
	#30		rst_n = 1;	data_in=156;	vaild = 0;	last = 0;
	#30		rst_n = 1;	data_in=10;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=24;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=30;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=40;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=58;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=66;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=73;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=88;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=94;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=12;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=28;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=37;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=47;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=59;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=165;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=170;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=80;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=190;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=180;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=206;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=35;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=48;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=56;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=66;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=70;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=86;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=98;	vaild = 1;	last = 0;
	#30		rst_n = 1;	data_in=17;	vaild = 1;	last = 1;
	#30		rst_n = 1;	data_in=64;	vaild = 0;	last = 0;
	#30		rst_n = 1;	data_in=0;	vaild = 0;	last = 0;
	#30		rst_n = 1;	data_in=0;	vaild = 0;	last = 0;
end
endmodule

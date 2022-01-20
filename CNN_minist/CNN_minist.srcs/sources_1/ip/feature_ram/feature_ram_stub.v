// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Jan  5 20:53:06 2022
// Host        : WIN-V2UN7O1DS1C running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/DATA/vivado_project/0TEST/minist_cnn/minist_cnn/minist_cnn.srcs/sources_1/ip/feature_ram/feature_ram_stub.v
// Design      : feature_ram
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *)
module feature_ram(clka, ena, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[7:0],dina[191:0],clkb,enb,addrb[7:0],doutb[191:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [7:0]addra;
  input [191:0]dina;
  input clkb;
  input enb;
  input [7:0]addrb;
  output [191:0]doutb;
endmodule

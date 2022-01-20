// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Jan 12 15:28:58 2022
// Host        : WIN-V2UN7O1DS1C running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/DATA/vivado_project/0TEST/minist_cnn/minist_cnn/minist_cnn.srcs/sources_1/ip/W_fc2/W_fc2_sim_netlist.v
// Design      : W_fc2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "W_fc2,blk_mem_gen_v8_4_2,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module W_fc2
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [16:0]douta;

  wire [10:0]addra;
  wire clka;
  wire [16:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [16:0]NLW_U0_doutb_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [16:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.45635 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "W_fc2.mem" *) 
  (* C_INIT_FILE_NAME = "W_fc2.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2000" *) 
  (* C_READ_DEPTH_B = "2000" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "17" *) 
  (* C_READ_WIDTH_B = "17" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "2000" *) 
  (* C_WRITE_DEPTH_B = "2000" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "17" *) 
  (* C_WRITE_WIDTH_B = "17" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  W_fc2_blk_mem_gen_v8_4_2 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[16:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[16:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module W_fc2_blk_mem_gen_generic_cstr
   (douta,
    clka,
    ena,
    addra);
  output [16:0]douta;
  input clka;
  input ena;
  input [10:0]addra;

  wire [10:0]addra;
  wire clka;
  wire [16:0]douta;
  wire ena;

  W_fc2_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module W_fc2_blk_mem_gen_prim_width
   (douta,
    clka,
    ena,
    addra);
  output [16:0]douta;
  input clka;
  input ena;
  input [10:0]addra;

  wire [10:0]addra;
  wire clka;
  wire [16:0]douta;
  wire ena;

  W_fc2_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module W_fc2_blk_mem_gen_prim_wrapper_init
   (douta,
    clka,
    ena,
    addra);
  output [16:0]douta;
  input clka;
  input ena;
  input [10:0]addra;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_70 ;
  wire [10:0]addra;
  wire clka;
  wire [16:0]douta;
  wire ena;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:16]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:2]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h5005515115045051014000444055440545504514010011001410105105511115),
    .INITP_01(256'h0555015410455054541551551041155450104010001400410544044111140404),
    .INITP_02(256'h5004044000110000055405055400045041105045114141455011014451514151),
    .INITP_03(256'h5005155101111050551511151410541541515144541545144500504511010505),
    .INITP_04(256'h5554451451415515110111011541440154444111410551100000001454501541),
    .INITP_05(256'h0401541115150051145410001455045510450010144051104104440000044550),
    .INITP_06(256'h0504551551555405540014540145111045050101010110450041005510541104),
    .INITP_07(256'h4015151150105415055404550444000151140401540140000041454005544505),
    .INITP_08(256'h1415515041501045150041001441514051450115101001444514000505054554),
    .INITP_09(256'h0415114504451150544151011414155550405400405055111014045400151144),
    .INITP_0A(256'h1511404440055154411111150101444444401414545510501514501515505414),
    .INITP_0B(256'h1510444111041105541540014514010455515151454440401145051514115441),
    .INITP_0C(256'h5440414440555440515145050015114055540041541144011101114515055044),
    .INITP_0D(256'h4501440010000415115004011500015015504001545501405411404141401411),
    .INITP_0E(256'h5010041050111005111501541544501100051000510444105144405011541144),
    .INITP_0F(256'h0000000000000000000000000441505011014010404155150404540515150410),
    .INIT_00(256'h093C85F007998EC60E398A66909185F8865403E18A290C368CB68B6D843E080C),
    .INIT_01(256'h8237050B03BA8F968FB210558A8200C903BC91128BC388CC102E8CB7011D0644),
    .INIT_02(256'h87B98B48051C8CE7042880C687B787238558052C89591080068B0558069D854D),
    .INIT_03(256'h05AA020887309102866302308AF5020C98DE845E02FF852D0886853986F80B3F),
    .INIT_04(256'h0667032181D9803408639598036106A589A40434029E88FB017A070D03700650),
    .INIT_05(256'h891989F981608769814A84DA820304D9850503AE090382C882D00E5307FC09AD),
    .INIT_06(256'h8FFF887304B8889C0ACE85B984D409FA8DE800048F9C90BB06DF0A208A8D8A0D),
    .INIT_07(256'h083E063501C4843F91830F8988C70C5D03EC84DE06560EE3014582290F168676),
    .INIT_08(256'h017A0603060A065F0A64803406FB0AF0900B03240A6604D884B506BF8267840C),
    .INIT_09(256'h8F190869887484D201F002E2098007378AC205D70AE80B77926B077F0ADE8961),
    .INIT_0A(256'h884E85350CEF0D2A8E1289C091F10770066A8205061690DD0736034B0BDE875D),
    .INIT_0B(256'h02CF86298BB58F7D81128424849A06678DF785EF83360BE687C0064E03020362),
    .INIT_0C(256'h92038877053F8AEA865A071101C58991818E85808B2A8A0401BF8D8F8F2E87AC),
    .INIT_0D(256'h00AF8468017B890C80B105C2089C0AFF0311020F8CD384A901B40EA681E287B1),
    .INIT_0E(256'h88B4042983620F2E09AD86E48E5E03868AAF8A8F8AE30EC10E3F07968BED8764),
    .INIT_0F(256'h0BB58CDF813A8C7408340CB2844E009B0B4484AB82E404920FA7070786468AFF),
    .INIT_10(256'h8478054091AE02AF901F001084660A6B85720C5A833787DE01178003876F0996),
    .INIT_11(256'h0080025109E8068F04D9088E031286D30571867A81088C03075201AA0EBA8C6C),
    .INIT_12(256'h01CB0A000811036202AC8E0289E18BA00627800384FD862F84A706C90674833B),
    .INIT_13(256'h005C129A87750937884084A7804A87E0080385B0048F0662916386D582CC8080),
    .INIT_14(256'h903A8EAF803E041A01C48D6904AE0533129F03E7862091A90A170F9988670970),
    .INIT_15(256'h0AFF00A10A658BFB83CC07BE8E6C0914056B01308D208736896B8990847A02C0),
    .INIT_16(256'h0BD5819580B407EE0AFF8D6B043F8117028D0C8E06D981470E2503A08BC78869),
    .INIT_17(256'h03379190064403E00B8F854F87438F15854C812F822784880B0606DE09A68CD9),
    .INIT_18(256'h8C49848810618978844585AA0D58824208BA8C1401DD02AA0268807C8C3F87CB),
    .INIT_19(256'h0BB788A483BE07F48B54945A01F7064A897389300DBE8B6607AA87CC81B602DF),
    .INIT_1A(256'h028682978EEA07C495340F29054E0D3780C909F401BE8A2C8F8E073C81F384BB),
    .INIT_1B(256'h0DA788FF821E0DC798F2020300D908AF06EB83420E660A7380EC0862016604CE),
    .INIT_1C(256'h032B0731062986560A3501CD8FF5080E99F5868910148C7D062090B207B10491),
    .INIT_1D(256'h045801C00E508848039D80DE97F1012C8EE68095827B935801B6058309E98013),
    .INIT_1E(256'h0C35807B86940205891B0BFA08528F3883AF062A0A910AFF08D50C9F010D074E),
    .INIT_1F(256'h0802063D06EC8D74872B84D08EFF874904D709B3865A8EBCA22104A808570566),
    .INIT_20(256'h96EB8853868187C802E88A330A3F931B819B0C230DB90B9E001A8CFC90240B16),
    .INIT_21(256'h03FE87E603A1851288FE85348EB782058D9702790A269194871981E692E381BB),
    .INIT_22(256'h8F898701102382908FC806480D6A835487100C290646075486A50BB4092E8C9D),
    .INIT_23(256'h82B902A109FC828303700019082A05B582080894040C80B70905028E808701A5),
    .INIT_24(256'h8C0381948AF806E591A0092D8F5800A291ED897F02D307D080E38EFC87EC80F8),
    .INIT_25(256'h061704EA821184F60455940907C308970C9B85EA8A750998935E035A0DD08462),
    .INIT_26(256'h01C408880CE68D4395308A140A410573022E83F00A9406B50571919C916D8190),
    .INIT_27(256'h882D81580162805B8B5182298DAA826200868E5382DC0AB59BED8B8401ED89D1),
    .INIT_28(256'h0AA58FAF91AA051B804102BB0C928F6183120DE7073690820170072C8C25881D),
    .INIT_29(256'h866D003485550D70085083F102E20634898603AE057109F00751054F06DB993F),
    .INIT_2A(256'h089691A0810F87010659889B0163028707A6803100B388D7949B906A83060983),
    .INIT_2B(256'h89CC0A0F070C800691D801CE05E3809E0BC589E9816781780ADF809906518947),
    .INIT_2C(256'h839D99348CD78D3B886D8FA701F6861105F6088401F78343063904CC08CA862B),
    .INIT_2D(256'h0E4604CF836380ED06A3044980288644840306DC843905B300370AE3007290C7),
    .INIT_2E(256'h83CA892B8CC8899B0AD6017C068B936701B709B5848309D20B8F83F88F3507ED),
    .INIT_2F(256'h820286F40755800D87AB080D8C1D06B9891300C0940B07D2962F84D7052E05EB),
    .INIT_30(256'h125F001C833305AF030F83F385EB06568219059F091C0C670B170527813E824A),
    .INIT_31(256'h80BA870505B688008AE704AC85140AFD086A087886E980B7887F038609B30876),
    .INIT_32(256'h03A006659132851D8A498D0E02D5844980D500AF05A082288F9F0539072F9075),
    .INIT_33(256'h092A09C1044604E70DCF8ED283E1091285F78A2986B088C99C0A867386028B8D),
    .INIT_34(256'h016789E2877C0CE90E3C802407D105670A1B014B95588DC8874B82F601DE9431),
    .INIT_35(256'h03CB086E848A8A28896487F009480DEF08DB07CD1025033390EF098D891F8A85),
    .INIT_36(256'h9342033C0162817603720B0A84F00B8D05F281DD07B0940487CF07188A828898),
    .INIT_37(256'h8F5A083384B2806087C58DF005C2866406C7944A08B7070487EA8D7901A502E3),
    .INIT_38(256'h01878C2287CD07CE846E84C589500B4105AD872C04FE87BD064D82090B290EC4),
    .INIT_39(256'h8B70867089380C6B0E069212008705F785A6138C07A08882831080D783BB085C),
    .INIT_3A(256'h027A82D40864828E8430815905D48AC386490D8F8056098A8309037F1041010E),
    .INIT_3B(256'h866184670BB5063C0FC506148A069026065904488466916B800F9C2882540107),
    .INIT_3C(256'h03ED02178E2590F6800D8D32904B02E60D2D936A8F5C048E05AD09FF015D0CC5),
    .INIT_3D(256'h895D869208D88CA20CA585B609AA07DD0EFF804884130B0F847F01EF0524911B),
    .INIT_3E(256'h8CA681ED0A1C047C88DC0B8E0667016C8A0086F38850077F885A0DBE00F88BC8),
    .INIT_3F(256'h81BF83BF03AE0CC28628865C87CA095D05E3847F02120475096B915E8867822E),
    .INIT_40(256'h8A8380748A3C93498052099F02BF085205F9093D0548022008568C780C5F91FC),
    .INIT_41(256'h0CF302720FEE08AC092C05D2817F087E90CC859F016705990486061680DE83D3),
    .INIT_42(256'h83CD04D880FD0F0C02E80123024A8D7C09509919043480DA0304030B83748D73),
    .INIT_43(256'h994904698D9C964F82530EAD8E5B03A1939D037B904C07D206FC03EE0C2982B0),
    .INIT_44(256'h84F2028E0A2A05098454805E8BC1899A826A07C48700870C06418B2B8BD1089E),
    .INIT_45(256'h079C00F7059C00278194868E8BCD05BF03D081D702CE08DD80A58685836B8F4D),
    .INIT_46(256'h06B184EE095C09500199058A9657027D8E660475010384DE0524828C8C6F895B),
    .INIT_47(256'h8AAD03F4879A80ED0B0B834888DF091A80A6958A89EF822188E38D8901DD0288),
    .INIT_48(256'h814B91E40145090A91910CAF84C807108BB60B8D84A4894380800B2A82420395),
    .INIT_49(256'h900889C5821D8F1F8B720B7107DD081F85DD86F289BD81200CD60D808751903F),
    .INIT_4A(256'h0BED07EB0A7E095C0C4F880D92D18653022907E8054A80C70916872808120A5F),
    .INIT_4B(256'h08908535896A066B843B0D3B0EB48204863282D2103A8820891B86AA821E83E0),
    .INIT_4C(256'h08ED020E05BA8ACC82C1932B86A5942F03AD8C75814B0C75873198C482D60A40),
    .INIT_4D(256'h8F6090EB86C584430A81828299710BB49027853F06D18002024580E304F30153),
    .INIT_4E(256'h070E05B089138049028184BE8CBE95C6885D001004318133091681E205FA048C),
    .INIT_4F(256'h8E9E80C192C50A6F852F85958B7603B20BA203D009BE091F09C002668EF405BE),
    .INIT_50(256'h8D89003F877E01D08C2E0B940919051A00760962955402F80AFE85E9908A0264),
    .INIT_51(256'h97DB824D07E48D050468016F0952884D089A902682328CD28C568D7C828603B3),
    .INIT_52(256'h0EFF06600186039086C40DF20826071E81E68A9503808233837E0BE30AD48B95),
    .INIT_53(256'h033C80AE057785F88C0D85FE81E00A938DFC8C7C898703BD06BE070E8E0602EB),
    .INIT_54(256'h87F58C420C6D8354033F00BD04D68D34068B03560AC702978B4A959506660F15),
    .INIT_55(256'h859D011C8B6B03AF91918330823A06C30CCF0DD901068002880500220C400867),
    .INIT_56(256'h09C409968F0392F80E310C1581638E14916C8EE3079F8BE30A5004D288B98403),
    .INIT_57(256'h069D825284B309D00B5F811E0631049003ED07D18BB604A408D4050908758BBA),
    .INIT_58(256'h84DE07DD8AA20772819901A48D7C87490AB9862906D186A504408CD6059B04D4),
    .INIT_59(256'h800000310D0A0E109A188E778F4F05008D1206878CC805AE8D270A8302F80372),
    .INIT_5A(256'h8C3E08F486C1876E83920B6A02448D4D0DA70706806F890C10C084030C37824E),
    .INIT_5B(256'h06CE003D813D83A48EF50041885B8E43061C097988FE838081BE05D5048F9227),
    .INIT_5C(256'h0DF288DA0AEF05C8885800CC090A90CF84A202280B458ED70D0408B30C598D95),
    .INIT_5D(256'h894909B40C6201BC92B78408834A8A75813F89BF031B830605E28D5807790DE8),
    .INIT_5E(256'h809582CC9025008D88398A82961A93D4080D8A84885D097807CE07DE034D0945),
    .INIT_5F(256'h871F06E888FA873605B682DB9806870D0AA0820A830702DD060994B005DA935F),
    .INIT_60(256'h021B959C0A068B210B450E368A3888E303AB0B45850207A902C10A590B278C2A),
    .INIT_61(256'h9D5C0AF680D0065F04D989D39FE882880458039B090706D08AEF039D00478255),
    .INIT_62(256'h059D0AF9854B02EA0A3D837A85178564835805F98656966080C090710F6706E4),
    .INIT_63(256'h81DE87DE096781D2091C825F0D7C09EB881C0896819984358A4F86FE89310AB0),
    .INIT_64(256'h83D0835B010B88E19345840601BE0648061F8584970C82E7899E93610169041F),
    .INIT_65(256'h83D0855605AC90FC049103A00BC40022051800718BBB810B0CD7067509A187F6),
    .INIT_66(256'h97410618852707D7859C0289081C93C10C55859A013A8F058B280A13827D8507),
    .INIT_67(256'h026F049C899C09DE084D8309031C07750984043F91D785B389EF929386E40D1E),
    .INIT_68(256'h817B05CD0C5D08C38CDF138E8100898A80D2027A0C6181F80B9805C681890053),
    .INIT_69(256'h06D308AB0270020402F0036880B709B0891C8CF5886E87F600A5850A814D81AB),
    .INIT_6A(256'h81550CB289760BAE07D303C6008080D2079884168C6B04B18BD2032C01E28841),
    .INIT_6B(256'h975407BE004C86E500CA8DDC814203A102159FE304430C6580B20ACC11780A98),
    .INIT_6C(256'h011E8507058F899F080D8E8409E08661095781190C7A832101F289CF0FC703C4),
    .INIT_6D(256'h03F58F558232872F84670B7104A9851B07A401EA8CE7075380668143063006A9),
    .INIT_6E(256'h014705A40A8B08258B7100D80A5D83F18BA48BCC859B077A815F885C898C8042),
    .INIT_6F(256'h0CDF052C03E8013303180BC30812814487E704EB063E806C8FA00913802A05A7),
    .INIT_70(256'h099D0302941F03040AD8053707F7881C044207328C4F014A92FC020888F80DAD),
    .INIT_71(256'h85B00D0C0DD604210EDA060888268BA598D8839D06A80BD00BAC196F0715083C),
    .INIT_72(256'h86090584041D865B0CF083450B808ED18AEF88E4057C98158D7A939E0D0B0A60),
    .INIT_73(256'h021106B883F1081E80E40892975E8D9809F00957843A8DE5981601070AA80B2C),
    .INIT_74(256'h807302EA0285809B02FB87938C83025A85C881D00C5A874B8E2A07CD81EA00BF),
    .INIT_75(256'h84128C5C810D04488F1A0CA3813387AD026901BB8910055A855085A300270571),
    .INIT_76(256'h82E580C88A9E81CB1A6706448DBD8BB2887309E986F403A2890E003B934686F3),
    .INIT_77(256'h06430B77088E898782D40BA50F1A0AB30B5484D282E083D709CA03AC06428003),
    .INIT_78(256'h82D807998B71803705F807E60E3F03DA0B0D01F100870CC081EA869A051C0A48),
    .INIT_79(256'h911006C582AB83AA038B86A1856902C282CA0C93084A89E9845D0C518DE30866),
    .INIT_7A(256'h925A0DCE8E6907228F9B8DD4011304510E2E059498FB80C806758F2E02B400B4),
    .INIT_7B(256'h09D100E9881103D803F906BF81AA851606E7872504F4801B0BA504C3958C82BF),
    .INIT_7C(256'h0300817C84D60934851A87869C0B086D8B238A38090A07E707C589AA01188A1E),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:16],douta[16:9],douta[7:0]}),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:2],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_70 ,douta[8]}),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module W_fc2_blk_mem_gen_top
   (douta,
    clka,
    ena,
    addra);
  output [16:0]douta;
  input clka;
  input ena;
  input [10:0]addra;

  wire [10:0]addra;
  wire clka;
  wire [16:0]douta;
  wire ena;

  W_fc2_blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* C_ADDRA_WIDTH = "11" *) (* C_ADDRB_WIDTH = "11" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "0" *) 
(* C_COUNT_36K_BRAM = "1" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.45635 mW" *) 
(* C_FAMILY = "artix7" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "W_fc2.mem" *) 
(* C_INIT_FILE_NAME = "W_fc2.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "3" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "2000" *) (* C_READ_DEPTH_B = "2000" *) (* C_READ_LATENCY_A = "1" *) 
(* C_READ_LATENCY_B = "1" *) (* C_READ_WIDTH_A = "17" *) (* C_READ_WIDTH_B = "17" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "0" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "2000" *) 
(* C_WRITE_DEPTH_B = "2000" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "17" *) (* C_WRITE_WIDTH_B = "17" *) (* C_XDEVICEFAMILY = "artix7" *) 
(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2" *) (* downgradeipidentifiedwarnings = "yes" *) 
module W_fc2_blk_mem_gen_v8_4_2
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [10:0]addra;
  input [16:0]dina;
  output [16:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [10:0]addrb;
  input [16:0]dinb;
  output [16:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [10:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [16:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [16:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [10:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [10:0]addra;
  wire clka;
  wire [16:0]douta;
  wire ena;

  assign dbiterr = \<const0> ;
  assign doutb[16] = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[10] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[10] = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  W_fc2_blk_mem_gen_v8_4_2_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_2_synth" *) 
module W_fc2_blk_mem_gen_v8_4_2_synth
   (douta,
    clka,
    ena,
    addra);
  output [16:0]douta;
  input clka;
  input ena;
  input [10:0]addra;

  wire [10:0]addra;
  wire clka;
  wire [16:0]douta;
  wire ena;

  W_fc2_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

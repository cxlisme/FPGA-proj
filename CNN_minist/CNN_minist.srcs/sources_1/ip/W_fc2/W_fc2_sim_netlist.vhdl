-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Wed Jan 12 15:28:58 2022
-- Host        : WIN-V2UN7O1DS1C running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/DATA/vivado_project/0TEST/minist_cnn/minist_cnn/minist_cnn.srcs/sources_1/ip/W_fc2/W_fc2_sim_netlist.vhdl
-- Design      : W_fc2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tsbg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity W_fc2_blk_mem_gen_prim_wrapper_init is
  port (
    douta : out STD_LOGIC_VECTOR ( 16 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of W_fc2_blk_mem_gen_prim_wrapper_init : entity is "blk_mem_gen_prim_wrapper_init";
end W_fc2_blk_mem_gen_prim_wrapper_init;

architecture STRUCTURE of W_fc2_blk_mem_gen_prim_wrapper_init is
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_70\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute box_type : string;
  attribute box_type of \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram\ : label is "PRIMITIVE";
begin
\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram\: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"5005515115045051014000444055440545504514010011001410105105511115",
      INITP_01 => X"0555015410455054541551551041155450104010001400410544044111140404",
      INITP_02 => X"5004044000110000055405055400045041105045114141455011014451514151",
      INITP_03 => X"5005155101111050551511151410541541515144541545144500504511010505",
      INITP_04 => X"5554451451415515110111011541440154444111410551100000001454501541",
      INITP_05 => X"0401541115150051145410001455045510450010144051104104440000044550",
      INITP_06 => X"0504551551555405540014540145111045050101010110450041005510541104",
      INITP_07 => X"4015151150105415055404550444000151140401540140000041454005544505",
      INITP_08 => X"1415515041501045150041001441514051450115101001444514000505054554",
      INITP_09 => X"0415114504451150544151011414155550405400405055111014045400151144",
      INITP_0A => X"1511404440055154411111150101444444401414545510501514501515505414",
      INITP_0B => X"1510444111041105541540014514010455515151454440401145051514115441",
      INITP_0C => X"5440414440555440515145050015114055540041541144011101114515055044",
      INITP_0D => X"4501440010000415115004011500015015504001545501405411404141401411",
      INITP_0E => X"5010041050111005111501541544501100051000510444105144405011541144",
      INITP_0F => X"0000000000000000000000000441505011014010404155150404540515150410",
      INIT_00 => X"093C85F007998EC60E398A66909185F8865403E18A290C368CB68B6D843E080C",
      INIT_01 => X"8237050B03BA8F968FB210558A8200C903BC91128BC388CC102E8CB7011D0644",
      INIT_02 => X"87B98B48051C8CE7042880C687B787238558052C89591080068B0558069D854D",
      INIT_03 => X"05AA020887309102866302308AF5020C98DE845E02FF852D0886853986F80B3F",
      INIT_04 => X"0667032181D9803408639598036106A589A40434029E88FB017A070D03700650",
      INIT_05 => X"891989F981608769814A84DA820304D9850503AE090382C882D00E5307FC09AD",
      INIT_06 => X"8FFF887304B8889C0ACE85B984D409FA8DE800048F9C90BB06DF0A208A8D8A0D",
      INIT_07 => X"083E063501C4843F91830F8988C70C5D03EC84DE06560EE3014582290F168676",
      INIT_08 => X"017A0603060A065F0A64803406FB0AF0900B03240A6604D884B506BF8267840C",
      INIT_09 => X"8F190869887484D201F002E2098007378AC205D70AE80B77926B077F0ADE8961",
      INIT_0A => X"884E85350CEF0D2A8E1289C091F10770066A8205061690DD0736034B0BDE875D",
      INIT_0B => X"02CF86298BB58F7D81128424849A06678DF785EF83360BE687C0064E03020362",
      INIT_0C => X"92038877053F8AEA865A071101C58991818E85808B2A8A0401BF8D8F8F2E87AC",
      INIT_0D => X"00AF8468017B890C80B105C2089C0AFF0311020F8CD384A901B40EA681E287B1",
      INIT_0E => X"88B4042983620F2E09AD86E48E5E03868AAF8A8F8AE30EC10E3F07968BED8764",
      INIT_0F => X"0BB58CDF813A8C7408340CB2844E009B0B4484AB82E404920FA7070786468AFF",
      INIT_10 => X"8478054091AE02AF901F001084660A6B85720C5A833787DE01178003876F0996",
      INIT_11 => X"0080025109E8068F04D9088E031286D30571867A81088C03075201AA0EBA8C6C",
      INIT_12 => X"01CB0A000811036202AC8E0289E18BA00627800384FD862F84A706C90674833B",
      INIT_13 => X"005C129A87750937884084A7804A87E0080385B0048F0662916386D582CC8080",
      INIT_14 => X"903A8EAF803E041A01C48D6904AE0533129F03E7862091A90A170F9988670970",
      INIT_15 => X"0AFF00A10A658BFB83CC07BE8E6C0914056B01308D208736896B8990847A02C0",
      INIT_16 => X"0BD5819580B407EE0AFF8D6B043F8117028D0C8E06D981470E2503A08BC78869",
      INIT_17 => X"03379190064403E00B8F854F87438F15854C812F822784880B0606DE09A68CD9",
      INIT_18 => X"8C49848810618978844585AA0D58824208BA8C1401DD02AA0268807C8C3F87CB",
      INIT_19 => X"0BB788A483BE07F48B54945A01F7064A897389300DBE8B6607AA87CC81B602DF",
      INIT_1A => X"028682978EEA07C495340F29054E0D3780C909F401BE8A2C8F8E073C81F384BB",
      INIT_1B => X"0DA788FF821E0DC798F2020300D908AF06EB83420E660A7380EC0862016604CE",
      INIT_1C => X"032B0731062986560A3501CD8FF5080E99F5868910148C7D062090B207B10491",
      INIT_1D => X"045801C00E508848039D80DE97F1012C8EE68095827B935801B6058309E98013",
      INIT_1E => X"0C35807B86940205891B0BFA08528F3883AF062A0A910AFF08D50C9F010D074E",
      INIT_1F => X"0802063D06EC8D74872B84D08EFF874904D709B3865A8EBCA22104A808570566",
      INIT_20 => X"96EB8853868187C802E88A330A3F931B819B0C230DB90B9E001A8CFC90240B16",
      INIT_21 => X"03FE87E603A1851288FE85348EB782058D9702790A269194871981E692E381BB",
      INIT_22 => X"8F898701102382908FC806480D6A835487100C290646075486A50BB4092E8C9D",
      INIT_23 => X"82B902A109FC828303700019082A05B582080894040C80B70905028E808701A5",
      INIT_24 => X"8C0381948AF806E591A0092D8F5800A291ED897F02D307D080E38EFC87EC80F8",
      INIT_25 => X"061704EA821184F60455940907C308970C9B85EA8A750998935E035A0DD08462",
      INIT_26 => X"01C408880CE68D4395308A140A410573022E83F00A9406B50571919C916D8190",
      INIT_27 => X"882D81580162805B8B5182298DAA826200868E5382DC0AB59BED8B8401ED89D1",
      INIT_28 => X"0AA58FAF91AA051B804102BB0C928F6183120DE7073690820170072C8C25881D",
      INIT_29 => X"866D003485550D70085083F102E20634898603AE057109F00751054F06DB993F",
      INIT_2A => X"089691A0810F87010659889B0163028707A6803100B388D7949B906A83060983",
      INIT_2B => X"89CC0A0F070C800691D801CE05E3809E0BC589E9816781780ADF809906518947",
      INIT_2C => X"839D99348CD78D3B886D8FA701F6861105F6088401F78343063904CC08CA862B",
      INIT_2D => X"0E4604CF836380ED06A3044980288644840306DC843905B300370AE3007290C7",
      INIT_2E => X"83CA892B8CC8899B0AD6017C068B936701B709B5848309D20B8F83F88F3507ED",
      INIT_2F => X"820286F40755800D87AB080D8C1D06B9891300C0940B07D2962F84D7052E05EB",
      INIT_30 => X"125F001C833305AF030F83F385EB06568219059F091C0C670B170527813E824A",
      INIT_31 => X"80BA870505B688008AE704AC85140AFD086A087886E980B7887F038609B30876",
      INIT_32 => X"03A006659132851D8A498D0E02D5844980D500AF05A082288F9F0539072F9075",
      INIT_33 => X"092A09C1044604E70DCF8ED283E1091285F78A2986B088C99C0A867386028B8D",
      INIT_34 => X"016789E2877C0CE90E3C802407D105670A1B014B95588DC8874B82F601DE9431",
      INIT_35 => X"03CB086E848A8A28896487F009480DEF08DB07CD1025033390EF098D891F8A85",
      INIT_36 => X"9342033C0162817603720B0A84F00B8D05F281DD07B0940487CF07188A828898",
      INIT_37 => X"8F5A083384B2806087C58DF005C2866406C7944A08B7070487EA8D7901A502E3",
      INIT_38 => X"01878C2287CD07CE846E84C589500B4105AD872C04FE87BD064D82090B290EC4",
      INIT_39 => X"8B70867089380C6B0E069212008705F785A6138C07A08882831080D783BB085C",
      INIT_3A => X"027A82D40864828E8430815905D48AC386490D8F8056098A8309037F1041010E",
      INIT_3B => X"866184670BB5063C0FC506148A069026065904488466916B800F9C2882540107",
      INIT_3C => X"03ED02178E2590F6800D8D32904B02E60D2D936A8F5C048E05AD09FF015D0CC5",
      INIT_3D => X"895D869208D88CA20CA585B609AA07DD0EFF804884130B0F847F01EF0524911B",
      INIT_3E => X"8CA681ED0A1C047C88DC0B8E0667016C8A0086F38850077F885A0DBE00F88BC8",
      INIT_3F => X"81BF83BF03AE0CC28628865C87CA095D05E3847F02120475096B915E8867822E",
      INIT_40 => X"8A8380748A3C93498052099F02BF085205F9093D0548022008568C780C5F91FC",
      INIT_41 => X"0CF302720FEE08AC092C05D2817F087E90CC859F016705990486061680DE83D3",
      INIT_42 => X"83CD04D880FD0F0C02E80123024A8D7C09509919043480DA0304030B83748D73",
      INIT_43 => X"994904698D9C964F82530EAD8E5B03A1939D037B904C07D206FC03EE0C2982B0",
      INIT_44 => X"84F2028E0A2A05098454805E8BC1899A826A07C48700870C06418B2B8BD1089E",
      INIT_45 => X"079C00F7059C00278194868E8BCD05BF03D081D702CE08DD80A58685836B8F4D",
      INIT_46 => X"06B184EE095C09500199058A9657027D8E660475010384DE0524828C8C6F895B",
      INIT_47 => X"8AAD03F4879A80ED0B0B834888DF091A80A6958A89EF822188E38D8901DD0288",
      INIT_48 => X"814B91E40145090A91910CAF84C807108BB60B8D84A4894380800B2A82420395",
      INIT_49 => X"900889C5821D8F1F8B720B7107DD081F85DD86F289BD81200CD60D808751903F",
      INIT_4A => X"0BED07EB0A7E095C0C4F880D92D18653022907E8054A80C70916872808120A5F",
      INIT_4B => X"08908535896A066B843B0D3B0EB48204863282D2103A8820891B86AA821E83E0",
      INIT_4C => X"08ED020E05BA8ACC82C1932B86A5942F03AD8C75814B0C75873198C482D60A40",
      INIT_4D => X"8F6090EB86C584430A81828299710BB49027853F06D18002024580E304F30153",
      INIT_4E => X"070E05B089138049028184BE8CBE95C6885D001004318133091681E205FA048C",
      INIT_4F => X"8E9E80C192C50A6F852F85958B7603B20BA203D009BE091F09C002668EF405BE",
      INIT_50 => X"8D89003F877E01D08C2E0B940919051A00760962955402F80AFE85E9908A0264",
      INIT_51 => X"97DB824D07E48D050468016F0952884D089A902682328CD28C568D7C828603B3",
      INIT_52 => X"0EFF06600186039086C40DF20826071E81E68A9503808233837E0BE30AD48B95",
      INIT_53 => X"033C80AE057785F88C0D85FE81E00A938DFC8C7C898703BD06BE070E8E0602EB",
      INIT_54 => X"87F58C420C6D8354033F00BD04D68D34068B03560AC702978B4A959506660F15",
      INIT_55 => X"859D011C8B6B03AF91918330823A06C30CCF0DD901068002880500220C400867",
      INIT_56 => X"09C409968F0392F80E310C1581638E14916C8EE3079F8BE30A5004D288B98403",
      INIT_57 => X"069D825284B309D00B5F811E0631049003ED07D18BB604A408D4050908758BBA",
      INIT_58 => X"84DE07DD8AA20772819901A48D7C87490AB9862906D186A504408CD6059B04D4",
      INIT_59 => X"800000310D0A0E109A188E778F4F05008D1206878CC805AE8D270A8302F80372",
      INIT_5A => X"8C3E08F486C1876E83920B6A02448D4D0DA70706806F890C10C084030C37824E",
      INIT_5B => X"06CE003D813D83A48EF50041885B8E43061C097988FE838081BE05D5048F9227",
      INIT_5C => X"0DF288DA0AEF05C8885800CC090A90CF84A202280B458ED70D0408B30C598D95",
      INIT_5D => X"894909B40C6201BC92B78408834A8A75813F89BF031B830605E28D5807790DE8",
      INIT_5E => X"809582CC9025008D88398A82961A93D4080D8A84885D097807CE07DE034D0945",
      INIT_5F => X"871F06E888FA873605B682DB9806870D0AA0820A830702DD060994B005DA935F",
      INIT_60 => X"021B959C0A068B210B450E368A3888E303AB0B45850207A902C10A590B278C2A",
      INIT_61 => X"9D5C0AF680D0065F04D989D39FE882880458039B090706D08AEF039D00478255",
      INIT_62 => X"059D0AF9854B02EA0A3D837A85178564835805F98656966080C090710F6706E4",
      INIT_63 => X"81DE87DE096781D2091C825F0D7C09EB881C0896819984358A4F86FE89310AB0",
      INIT_64 => X"83D0835B010B88E19345840601BE0648061F8584970C82E7899E93610169041F",
      INIT_65 => X"83D0855605AC90FC049103A00BC40022051800718BBB810B0CD7067509A187F6",
      INIT_66 => X"97410618852707D7859C0289081C93C10C55859A013A8F058B280A13827D8507",
      INIT_67 => X"026F049C899C09DE084D8309031C07750984043F91D785B389EF929386E40D1E",
      INIT_68 => X"817B05CD0C5D08C38CDF138E8100898A80D2027A0C6181F80B9805C681890053",
      INIT_69 => X"06D308AB0270020402F0036880B709B0891C8CF5886E87F600A5850A814D81AB",
      INIT_6A => X"81550CB289760BAE07D303C6008080D2079884168C6B04B18BD2032C01E28841",
      INIT_6B => X"975407BE004C86E500CA8DDC814203A102159FE304430C6580B20ACC11780A98",
      INIT_6C => X"011E8507058F899F080D8E8409E08661095781190C7A832101F289CF0FC703C4",
      INIT_6D => X"03F58F558232872F84670B7104A9851B07A401EA8CE7075380668143063006A9",
      INIT_6E => X"014705A40A8B08258B7100D80A5D83F18BA48BCC859B077A815F885C898C8042",
      INIT_6F => X"0CDF052C03E8013303180BC30812814487E704EB063E806C8FA00913802A05A7",
      INIT_70 => X"099D0302941F03040AD8053707F7881C044207328C4F014A92FC020888F80DAD",
      INIT_71 => X"85B00D0C0DD604210EDA060888268BA598D8839D06A80BD00BAC196F0715083C",
      INIT_72 => X"86090584041D865B0CF083450B808ED18AEF88E4057C98158D7A939E0D0B0A60",
      INIT_73 => X"021106B883F1081E80E40892975E8D9809F00957843A8DE5981601070AA80B2C",
      INIT_74 => X"807302EA0285809B02FB87938C83025A85C881D00C5A874B8E2A07CD81EA00BF",
      INIT_75 => X"84128C5C810D04488F1A0CA3813387AD026901BB8910055A855085A300270571",
      INIT_76 => X"82E580C88A9E81CB1A6706448DBD8BB2887309E986F403A2890E003B934686F3",
      INIT_77 => X"06430B77088E898782D40BA50F1A0AB30B5484D282E083D709CA03AC06428003",
      INIT_78 => X"82D807998B71803705F807E60E3F03DA0B0D01F100870CC081EA869A051C0A48",
      INIT_79 => X"911006C582AB83AA038B86A1856902C282CA0C93084A89E9845D0C518DE30866",
      INIT_7A => X"925A0DCE8E6907228F9B8DD4011304510E2E059498FB80C806758F2E02B400B4",
      INIT_7B => X"09D100E9881103D803F906BF81AA851606E7872504F4801B0BA504C3958C82BF",
      INIT_7C => X"0300817C84D60934851A87869C0B086D8B238A38090A07E707C589AA01188A1E",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      IS_CLKARDCLK_INVERTED => '0',
      IS_CLKBWRCLK_INVERTED => '0',
      IS_ENARDEN_INVERTED => '0',
      IS_ENBWREN_INVERTED => '0',
      IS_RSTRAMARSTRAM_INVERTED => '0',
      IS_RSTRAMB_INVERTED => '0',
      IS_RSTREGARSTREG_INVERTED => '0',
      IS_RSTREGB_INVERTED => '0',
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 4) => addra(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"1111",
      ADDRBWRADDR(15 downto 0) => B"0000000000000000",
      CASCADEINA => '0',
      CASCADEINB => '0',
      CASCADEOUTA => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED\,
      CASCADEOUTB => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED\,
      DIADI(31 downto 0) => B"00000000000000000000000000000000",
      DIBDI(31 downto 0) => B"00000000000000000000000000000000",
      DIPADIP(3 downto 0) => B"0000",
      DIPBDIP(3 downto 0) => B"0000",
      DOADO(31 downto 16) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED\(31 downto 16),
      DOADO(15 downto 8) => douta(16 downto 9),
      DOADO(7 downto 0) => douta(7 downto 0),
      DOBDO(31 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED\(31 downto 0),
      DOPADOP(3 downto 2) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED\(3 downto 2),
      DOPADOP(1) => \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_70\,
      DOPADOP(0) => douta(8),
      DOPBDOP(3 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED\(7 downto 0),
      ENARDEN => ena,
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED\,
      WEA(3 downto 0) => B"0000",
      WEBWE(7 downto 0) => B"00000000"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity W_fc2_blk_mem_gen_prim_width is
  port (
    douta : out STD_LOGIC_VECTOR ( 16 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of W_fc2_blk_mem_gen_prim_width : entity is "blk_mem_gen_prim_width";
end W_fc2_blk_mem_gen_prim_width;

architecture STRUCTURE of W_fc2_blk_mem_gen_prim_width is
begin
\prim_init.ram\: entity work.W_fc2_blk_mem_gen_prim_wrapper_init
     port map (
      addra(10 downto 0) => addra(10 downto 0),
      clka => clka,
      douta(16 downto 0) => douta(16 downto 0),
      ena => ena
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity W_fc2_blk_mem_gen_generic_cstr is
  port (
    douta : out STD_LOGIC_VECTOR ( 16 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of W_fc2_blk_mem_gen_generic_cstr : entity is "blk_mem_gen_generic_cstr";
end W_fc2_blk_mem_gen_generic_cstr;

architecture STRUCTURE of W_fc2_blk_mem_gen_generic_cstr is
begin
\ramloop[0].ram.r\: entity work.W_fc2_blk_mem_gen_prim_width
     port map (
      addra(10 downto 0) => addra(10 downto 0),
      clka => clka,
      douta(16 downto 0) => douta(16 downto 0),
      ena => ena
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity W_fc2_blk_mem_gen_top is
  port (
    douta : out STD_LOGIC_VECTOR ( 16 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of W_fc2_blk_mem_gen_top : entity is "blk_mem_gen_top";
end W_fc2_blk_mem_gen_top;

architecture STRUCTURE of W_fc2_blk_mem_gen_top is
begin
\valid.cstr\: entity work.W_fc2_blk_mem_gen_generic_cstr
     port map (
      addra(10 downto 0) => addra(10 downto 0),
      clka => clka,
      douta(16 downto 0) => douta(16 downto 0),
      ena => ena
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity W_fc2_blk_mem_gen_v8_4_2_synth is
  port (
    douta : out STD_LOGIC_VECTOR ( 16 downto 0 );
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of W_fc2_blk_mem_gen_v8_4_2_synth : entity is "blk_mem_gen_v8_4_2_synth";
end W_fc2_blk_mem_gen_v8_4_2_synth;

architecture STRUCTURE of W_fc2_blk_mem_gen_v8_4_2_synth is
begin
\gnbram.gnativebmg.native_blk_mem_gen\: entity work.W_fc2_blk_mem_gen_top
     port map (
      addra(10 downto 0) => addra(10 downto 0),
      clka => clka,
      douta(16 downto 0) => douta(16 downto 0),
      ena => ena
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity W_fc2_blk_mem_gen_v8_4_2 is
  port (
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 10 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 16 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 16 downto 0 );
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 10 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 16 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 16 downto 0 );
    injectsbiterr : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    eccpipece : in STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    rdaddrecc : out STD_LOGIC_VECTOR ( 10 downto 0 );
    sleep : in STD_LOGIC;
    deepsleep : in STD_LOGIC;
    shutdown : in STD_LOGIC;
    rsta_busy : out STD_LOGIC;
    rstb_busy : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 16 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 16 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_injectsbiterr : in STD_LOGIC;
    s_axi_injectdbiterr : in STD_LOGIC;
    s_axi_sbiterr : out STD_LOGIC;
    s_axi_dbiterr : out STD_LOGIC;
    s_axi_rdaddrecc : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of W_fc2_blk_mem_gen_v8_4_2 : entity is 11;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of W_fc2_blk_mem_gen_v8_4_2 : entity is 11;
  attribute C_ALGORITHM : integer;
  attribute C_ALGORITHM of W_fc2_blk_mem_gen_v8_4_2 : entity is 1;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of W_fc2_blk_mem_gen_v8_4_2 : entity is 4;
  attribute C_AXI_SLAVE_TYPE : integer;
  attribute C_AXI_SLAVE_TYPE of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of W_fc2_blk_mem_gen_v8_4_2 : entity is 1;
  attribute C_BYTE_SIZE : integer;
  attribute C_BYTE_SIZE of W_fc2_blk_mem_gen_v8_4_2 : entity is 9;
  attribute C_COMMON_CLK : integer;
  attribute C_COMMON_CLK of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_COUNT_18K_BRAM : string;
  attribute C_COUNT_18K_BRAM of W_fc2_blk_mem_gen_v8_4_2 : entity is "0";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of W_fc2_blk_mem_gen_v8_4_2 : entity is "1";
  attribute C_CTRL_ECC_ALGO : string;
  attribute C_CTRL_ECC_ALGO of W_fc2_blk_mem_gen_v8_4_2 : entity is "NONE";
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of W_fc2_blk_mem_gen_v8_4_2 : entity is "0";
  attribute C_DISABLE_WARN_BHV_COLL : integer;
  attribute C_DISABLE_WARN_BHV_COLL of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_DISABLE_WARN_BHV_RANGE : integer;
  attribute C_DISABLE_WARN_BHV_RANGE of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of W_fc2_blk_mem_gen_v8_4_2 : entity is "./";
  attribute C_ENABLE_32BIT_ADDRESS : integer;
  attribute C_ENABLE_32BIT_ADDRESS of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_EN_DEEPSLEEP_PIN : integer;
  attribute C_EN_DEEPSLEEP_PIN of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_EN_ECC_PIPE : integer;
  attribute C_EN_ECC_PIPE of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_EN_RDADDRA_CHG : integer;
  attribute C_EN_RDADDRA_CHG of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_EN_RDADDRB_CHG : integer;
  attribute C_EN_RDADDRB_CHG of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_EN_SHUTDOWN_PIN : integer;
  attribute C_EN_SHUTDOWN_PIN of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_EN_SLEEP_PIN : integer;
  attribute C_EN_SLEEP_PIN of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_EST_POWER_SUMMARY : string;
  attribute C_EST_POWER_SUMMARY of W_fc2_blk_mem_gen_v8_4_2 : entity is "Estimated Power for IP     :     2.45635 mW";
  attribute C_FAMILY : string;
  attribute C_FAMILY of W_fc2_blk_mem_gen_v8_4_2 : entity is "artix7";
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_HAS_ENA : integer;
  attribute C_HAS_ENA of W_fc2_blk_mem_gen_v8_4_2 : entity is 1;
  attribute C_HAS_ENB : integer;
  attribute C_HAS_ENB of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_HAS_INJECTERR : integer;
  attribute C_HAS_INJECTERR of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_A : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_A of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_B : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_B of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_A : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_A of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_B : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_B of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_HAS_REGCEA : integer;
  attribute C_HAS_REGCEA of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_HAS_REGCEB : integer;
  attribute C_HAS_REGCEB of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_HAS_RSTA : integer;
  attribute C_HAS_RSTA of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_HAS_RSTB : integer;
  attribute C_HAS_RSTB of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_HAS_SOFTECC_INPUT_REGS_A : integer;
  attribute C_HAS_SOFTECC_INPUT_REGS_A of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B : integer;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_INITA_VAL : string;
  attribute C_INITA_VAL of W_fc2_blk_mem_gen_v8_4_2 : entity is "0";
  attribute C_INITB_VAL : string;
  attribute C_INITB_VAL of W_fc2_blk_mem_gen_v8_4_2 : entity is "0";
  attribute C_INIT_FILE : string;
  attribute C_INIT_FILE of W_fc2_blk_mem_gen_v8_4_2 : entity is "W_fc2.mem";
  attribute C_INIT_FILE_NAME : string;
  attribute C_INIT_FILE_NAME of W_fc2_blk_mem_gen_v8_4_2 : entity is "W_fc2.mif";
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_LOAD_INIT_FILE : integer;
  attribute C_LOAD_INIT_FILE of W_fc2_blk_mem_gen_v8_4_2 : entity is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of W_fc2_blk_mem_gen_v8_4_2 : entity is 3;
  attribute C_MUX_PIPELINE_STAGES : integer;
  attribute C_MUX_PIPELINE_STAGES of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_PRIM_TYPE : integer;
  attribute C_PRIM_TYPE of W_fc2_blk_mem_gen_v8_4_2 : entity is 1;
  attribute C_READ_DEPTH_A : integer;
  attribute C_READ_DEPTH_A of W_fc2_blk_mem_gen_v8_4_2 : entity is 2000;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of W_fc2_blk_mem_gen_v8_4_2 : entity is 2000;
  attribute C_READ_LATENCY_A : integer;
  attribute C_READ_LATENCY_A of W_fc2_blk_mem_gen_v8_4_2 : entity is 1;
  attribute C_READ_LATENCY_B : integer;
  attribute C_READ_LATENCY_B of W_fc2_blk_mem_gen_v8_4_2 : entity is 1;
  attribute C_READ_WIDTH_A : integer;
  attribute C_READ_WIDTH_A of W_fc2_blk_mem_gen_v8_4_2 : entity is 17;
  attribute C_READ_WIDTH_B : integer;
  attribute C_READ_WIDTH_B of W_fc2_blk_mem_gen_v8_4_2 : entity is 17;
  attribute C_RSTRAM_A : integer;
  attribute C_RSTRAM_A of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_RSTRAM_B : integer;
  attribute C_RSTRAM_B of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_RST_PRIORITY_A : string;
  attribute C_RST_PRIORITY_A of W_fc2_blk_mem_gen_v8_4_2 : entity is "CE";
  attribute C_RST_PRIORITY_B : string;
  attribute C_RST_PRIORITY_B of W_fc2_blk_mem_gen_v8_4_2 : entity is "CE";
  attribute C_SIM_COLLISION_CHECK : string;
  attribute C_SIM_COLLISION_CHECK of W_fc2_blk_mem_gen_v8_4_2 : entity is "ALL";
  attribute C_USE_BRAM_BLOCK : integer;
  attribute C_USE_BRAM_BLOCK of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_USE_BYTE_WEA : integer;
  attribute C_USE_BYTE_WEA of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_USE_BYTE_WEB : integer;
  attribute C_USE_BYTE_WEB of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_USE_DEFAULT_DATA : integer;
  attribute C_USE_DEFAULT_DATA of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_USE_SOFTECC : integer;
  attribute C_USE_SOFTECC of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_USE_URAM : integer;
  attribute C_USE_URAM of W_fc2_blk_mem_gen_v8_4_2 : entity is 0;
  attribute C_WEA_WIDTH : integer;
  attribute C_WEA_WIDTH of W_fc2_blk_mem_gen_v8_4_2 : entity is 1;
  attribute C_WEB_WIDTH : integer;
  attribute C_WEB_WIDTH of W_fc2_blk_mem_gen_v8_4_2 : entity is 1;
  attribute C_WRITE_DEPTH_A : integer;
  attribute C_WRITE_DEPTH_A of W_fc2_blk_mem_gen_v8_4_2 : entity is 2000;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of W_fc2_blk_mem_gen_v8_4_2 : entity is 2000;
  attribute C_WRITE_MODE_A : string;
  attribute C_WRITE_MODE_A of W_fc2_blk_mem_gen_v8_4_2 : entity is "WRITE_FIRST";
  attribute C_WRITE_MODE_B : string;
  attribute C_WRITE_MODE_B of W_fc2_blk_mem_gen_v8_4_2 : entity is "WRITE_FIRST";
  attribute C_WRITE_WIDTH_A : integer;
  attribute C_WRITE_WIDTH_A of W_fc2_blk_mem_gen_v8_4_2 : entity is 17;
  attribute C_WRITE_WIDTH_B : integer;
  attribute C_WRITE_WIDTH_B of W_fc2_blk_mem_gen_v8_4_2 : entity is 17;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of W_fc2_blk_mem_gen_v8_4_2 : entity is "artix7";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of W_fc2_blk_mem_gen_v8_4_2 : entity is "blk_mem_gen_v8_4_2";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of W_fc2_blk_mem_gen_v8_4_2 : entity is "yes";
end W_fc2_blk_mem_gen_v8_4_2;

architecture STRUCTURE of W_fc2_blk_mem_gen_v8_4_2 is
  signal \<const0>\ : STD_LOGIC;
begin
  dbiterr <= \<const0>\;
  doutb(16) <= \<const0>\;
  doutb(15) <= \<const0>\;
  doutb(14) <= \<const0>\;
  doutb(13) <= \<const0>\;
  doutb(12) <= \<const0>\;
  doutb(11) <= \<const0>\;
  doutb(10) <= \<const0>\;
  doutb(9) <= \<const0>\;
  doutb(8) <= \<const0>\;
  doutb(7) <= \<const0>\;
  doutb(6) <= \<const0>\;
  doutb(5) <= \<const0>\;
  doutb(4) <= \<const0>\;
  doutb(3) <= \<const0>\;
  doutb(2) <= \<const0>\;
  doutb(1) <= \<const0>\;
  doutb(0) <= \<const0>\;
  rdaddrecc(10) <= \<const0>\;
  rdaddrecc(9) <= \<const0>\;
  rdaddrecc(8) <= \<const0>\;
  rdaddrecc(7) <= \<const0>\;
  rdaddrecc(6) <= \<const0>\;
  rdaddrecc(5) <= \<const0>\;
  rdaddrecc(4) <= \<const0>\;
  rdaddrecc(3) <= \<const0>\;
  rdaddrecc(2) <= \<const0>\;
  rdaddrecc(1) <= \<const0>\;
  rdaddrecc(0) <= \<const0>\;
  rsta_busy <= \<const0>\;
  rstb_busy <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bid(3) <= \<const0>\;
  s_axi_bid(2) <= \<const0>\;
  s_axi_bid(1) <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_dbiterr <= \<const0>\;
  s_axi_rdaddrecc(10) <= \<const0>\;
  s_axi_rdaddrecc(9) <= \<const0>\;
  s_axi_rdaddrecc(8) <= \<const0>\;
  s_axi_rdaddrecc(7) <= \<const0>\;
  s_axi_rdaddrecc(6) <= \<const0>\;
  s_axi_rdaddrecc(5) <= \<const0>\;
  s_axi_rdaddrecc(4) <= \<const0>\;
  s_axi_rdaddrecc(3) <= \<const0>\;
  s_axi_rdaddrecc(2) <= \<const0>\;
  s_axi_rdaddrecc(1) <= \<const0>\;
  s_axi_rdaddrecc(0) <= \<const0>\;
  s_axi_rdata(16) <= \<const0>\;
  s_axi_rdata(15) <= \<const0>\;
  s_axi_rdata(14) <= \<const0>\;
  s_axi_rdata(13) <= \<const0>\;
  s_axi_rdata(12) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rid(3) <= \<const0>\;
  s_axi_rid(2) <= \<const0>\;
  s_axi_rid(1) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_sbiterr <= \<const0>\;
  s_axi_wready <= \<const0>\;
  sbiterr <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst_blk_mem_gen: entity work.W_fc2_blk_mem_gen_v8_4_2_synth
     port map (
      addra(10 downto 0) => addra(10 downto 0),
      clka => clka,
      douta(16 downto 0) => douta(16 downto 0),
      ena => ena
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity W_fc2 is
  port (
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 10 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 16 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of W_fc2 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of W_fc2 : entity is "W_fc2,blk_mem_gen_v8_4_2,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of W_fc2 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of W_fc2 : entity is "blk_mem_gen_v8_4_2,Vivado 2018.3";
end W_fc2;

architecture STRUCTURE of W_fc2 is
  signal NLW_U0_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rsta_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rstb_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_doutb_UNCONNECTED : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal NLW_U0_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of U0 : label is 11;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of U0 : label is 11;
  attribute C_ALGORITHM : integer;
  attribute C_ALGORITHM of U0 : label is 1;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of U0 : label is 4;
  attribute C_AXI_SLAVE_TYPE : integer;
  attribute C_AXI_SLAVE_TYPE of U0 : label is 0;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of U0 : label is 1;
  attribute C_BYTE_SIZE : integer;
  attribute C_BYTE_SIZE of U0 : label is 9;
  attribute C_COMMON_CLK : integer;
  attribute C_COMMON_CLK of U0 : label is 0;
  attribute C_COUNT_18K_BRAM : string;
  attribute C_COUNT_18K_BRAM of U0 : label is "0";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of U0 : label is "1";
  attribute C_CTRL_ECC_ALGO : string;
  attribute C_CTRL_ECC_ALGO of U0 : label is "NONE";
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of U0 : label is "0";
  attribute C_DISABLE_WARN_BHV_COLL : integer;
  attribute C_DISABLE_WARN_BHV_COLL of U0 : label is 0;
  attribute C_DISABLE_WARN_BHV_RANGE : integer;
  attribute C_DISABLE_WARN_BHV_RANGE of U0 : label is 0;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of U0 : label is "./";
  attribute C_ENABLE_32BIT_ADDRESS : integer;
  attribute C_ENABLE_32BIT_ADDRESS of U0 : label is 0;
  attribute C_EN_DEEPSLEEP_PIN : integer;
  attribute C_EN_DEEPSLEEP_PIN of U0 : label is 0;
  attribute C_EN_ECC_PIPE : integer;
  attribute C_EN_ECC_PIPE of U0 : label is 0;
  attribute C_EN_RDADDRA_CHG : integer;
  attribute C_EN_RDADDRA_CHG of U0 : label is 0;
  attribute C_EN_RDADDRB_CHG : integer;
  attribute C_EN_RDADDRB_CHG of U0 : label is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of U0 : label is 0;
  attribute C_EN_SHUTDOWN_PIN : integer;
  attribute C_EN_SHUTDOWN_PIN of U0 : label is 0;
  attribute C_EN_SLEEP_PIN : integer;
  attribute C_EN_SLEEP_PIN of U0 : label is 0;
  attribute C_EST_POWER_SUMMARY : string;
  attribute C_EST_POWER_SUMMARY of U0 : label is "Estimated Power for IP     :     2.45635 mW";
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "artix7";
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of U0 : label is 0;
  attribute C_HAS_ENA : integer;
  attribute C_HAS_ENA of U0 : label is 1;
  attribute C_HAS_ENB : integer;
  attribute C_HAS_ENB of U0 : label is 0;
  attribute C_HAS_INJECTERR : integer;
  attribute C_HAS_INJECTERR of U0 : label is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_A : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_A of U0 : label is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_B : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_A : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_A of U0 : label is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_B : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_HAS_REGCEA : integer;
  attribute C_HAS_REGCEA of U0 : label is 0;
  attribute C_HAS_REGCEB : integer;
  attribute C_HAS_REGCEB of U0 : label is 0;
  attribute C_HAS_RSTA : integer;
  attribute C_HAS_RSTA of U0 : label is 0;
  attribute C_HAS_RSTB : integer;
  attribute C_HAS_RSTB of U0 : label is 0;
  attribute C_HAS_SOFTECC_INPUT_REGS_A : integer;
  attribute C_HAS_SOFTECC_INPUT_REGS_A of U0 : label is 0;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B : integer;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_INITA_VAL : string;
  attribute C_INITA_VAL of U0 : label is "0";
  attribute C_INITB_VAL : string;
  attribute C_INITB_VAL of U0 : label is "0";
  attribute C_INIT_FILE : string;
  attribute C_INIT_FILE of U0 : label is "W_fc2.mem";
  attribute C_INIT_FILE_NAME : string;
  attribute C_INIT_FILE_NAME of U0 : label is "W_fc2.mif";
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of U0 : label is 0;
  attribute C_LOAD_INIT_FILE : integer;
  attribute C_LOAD_INIT_FILE of U0 : label is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 3;
  attribute C_MUX_PIPELINE_STAGES : integer;
  attribute C_MUX_PIPELINE_STAGES of U0 : label is 0;
  attribute C_PRIM_TYPE : integer;
  attribute C_PRIM_TYPE of U0 : label is 1;
  attribute C_READ_DEPTH_A : integer;
  attribute C_READ_DEPTH_A of U0 : label is 2000;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of U0 : label is 2000;
  attribute C_READ_LATENCY_A : integer;
  attribute C_READ_LATENCY_A of U0 : label is 1;
  attribute C_READ_LATENCY_B : integer;
  attribute C_READ_LATENCY_B of U0 : label is 1;
  attribute C_READ_WIDTH_A : integer;
  attribute C_READ_WIDTH_A of U0 : label is 17;
  attribute C_READ_WIDTH_B : integer;
  attribute C_READ_WIDTH_B of U0 : label is 17;
  attribute C_RSTRAM_A : integer;
  attribute C_RSTRAM_A of U0 : label is 0;
  attribute C_RSTRAM_B : integer;
  attribute C_RSTRAM_B of U0 : label is 0;
  attribute C_RST_PRIORITY_A : string;
  attribute C_RST_PRIORITY_A of U0 : label is "CE";
  attribute C_RST_PRIORITY_B : string;
  attribute C_RST_PRIORITY_B of U0 : label is "CE";
  attribute C_SIM_COLLISION_CHECK : string;
  attribute C_SIM_COLLISION_CHECK of U0 : label is "ALL";
  attribute C_USE_BRAM_BLOCK : integer;
  attribute C_USE_BRAM_BLOCK of U0 : label is 0;
  attribute C_USE_BYTE_WEA : integer;
  attribute C_USE_BYTE_WEA of U0 : label is 0;
  attribute C_USE_BYTE_WEB : integer;
  attribute C_USE_BYTE_WEB of U0 : label is 0;
  attribute C_USE_DEFAULT_DATA : integer;
  attribute C_USE_DEFAULT_DATA of U0 : label is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of U0 : label is 0;
  attribute C_USE_SOFTECC : integer;
  attribute C_USE_SOFTECC of U0 : label is 0;
  attribute C_USE_URAM : integer;
  attribute C_USE_URAM of U0 : label is 0;
  attribute C_WEA_WIDTH : integer;
  attribute C_WEA_WIDTH of U0 : label is 1;
  attribute C_WEB_WIDTH : integer;
  attribute C_WEB_WIDTH of U0 : label is 1;
  attribute C_WRITE_DEPTH_A : integer;
  attribute C_WRITE_DEPTH_A of U0 : label is 2000;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of U0 : label is 2000;
  attribute C_WRITE_MODE_A : string;
  attribute C_WRITE_MODE_A of U0 : label is "WRITE_FIRST";
  attribute C_WRITE_MODE_B : string;
  attribute C_WRITE_MODE_B of U0 : label is "WRITE_FIRST";
  attribute C_WRITE_WIDTH_A : integer;
  attribute C_WRITE_WIDTH_A of U0 : label is 17;
  attribute C_WRITE_WIDTH_B : integer;
  attribute C_WRITE_WIDTH_B of U0 : label is 17;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of U0 : label is "artix7";
  attribute downgradeipidentifiedwarnings of U0 : label is "yes";
  attribute x_interface_info : string;
  attribute x_interface_info of clka : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clka : signal is "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute x_interface_info of ena : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA EN";
  attribute x_interface_info of addra : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR";
  attribute x_interface_info of douta : signal is "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT";
begin
U0: entity work.W_fc2_blk_mem_gen_v8_4_2
     port map (
      addra(10 downto 0) => addra(10 downto 0),
      addrb(10 downto 0) => B"00000000000",
      clka => clka,
      clkb => '0',
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      deepsleep => '0',
      dina(16 downto 0) => B"00000000000000000",
      dinb(16 downto 0) => B"00000000000000000",
      douta(16 downto 0) => douta(16 downto 0),
      doutb(16 downto 0) => NLW_U0_doutb_UNCONNECTED(16 downto 0),
      eccpipece => '0',
      ena => ena,
      enb => '0',
      injectdbiterr => '0',
      injectsbiterr => '0',
      rdaddrecc(10 downto 0) => NLW_U0_rdaddrecc_UNCONNECTED(10 downto 0),
      regcea => '0',
      regceb => '0',
      rsta => '0',
      rsta_busy => NLW_U0_rsta_busy_UNCONNECTED,
      rstb => '0',
      rstb_busy => NLW_U0_rstb_busy_UNCONNECTED,
      s_aclk => '0',
      s_aresetn => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_arid(3 downto 0) => B"0000",
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arready => NLW_U0_s_axi_arready_UNCONNECTED,
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awid(3 downto 0) => B"0000",
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awready => NLW_U0_s_axi_awready_UNCONNECTED,
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awvalid => '0',
      s_axi_bid(3 downto 0) => NLW_U0_s_axi_bid_UNCONNECTED(3 downto 0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_U0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_bvalid => NLW_U0_s_axi_bvalid_UNCONNECTED,
      s_axi_dbiterr => NLW_U0_s_axi_dbiterr_UNCONNECTED,
      s_axi_injectdbiterr => '0',
      s_axi_injectsbiterr => '0',
      s_axi_rdaddrecc(10 downto 0) => NLW_U0_s_axi_rdaddrecc_UNCONNECTED(10 downto 0),
      s_axi_rdata(16 downto 0) => NLW_U0_s_axi_rdata_UNCONNECTED(16 downto 0),
      s_axi_rid(3 downto 0) => NLW_U0_s_axi_rid_UNCONNECTED(3 downto 0),
      s_axi_rlast => NLW_U0_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_U0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_rvalid => NLW_U0_s_axi_rvalid_UNCONNECTED,
      s_axi_sbiterr => NLW_U0_s_axi_sbiterr_UNCONNECTED,
      s_axi_wdata(16 downto 0) => B"00000000000000000",
      s_axi_wlast => '0',
      s_axi_wready => NLW_U0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(0) => '0',
      s_axi_wvalid => '0',
      sbiterr => NLW_U0_sbiterr_UNCONNECTED,
      shutdown => '0',
      sleep => '0',
      wea(0) => '0',
      web(0) => '0'
    );
end STRUCTURE;

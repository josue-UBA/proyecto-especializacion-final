// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Jun 25 01:55:17 2022
// Host        : DESKTOP-IMKM6G2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/josue/Desktop/asd/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_red_0_2/design_1_red_0_2_sim_netlist.v
// Design      : design_1_red_0_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_red_0_2,red,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "red,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module design_1_red_0_2
   (s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWADDR" *) input [3:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARADDR" *) input [3:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_axi_rready;

  wire \<const0> ;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_red_0_2_red inst
       (.s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[3:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[3:2]),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "axi_4_lite" *) 
module design_1_red_0_2_axi_4_lite
   (s00_axi_awready,
    SR,
    s00_axi_wready,
    s00_axi_arready,
    s00_axi_bvalid,
    s00_axi_rvalid,
    Q,
    \slv_reg0_reg[31]_0 ,
    s00_axi_rdata,
    s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_bready,
    s00_axi_arvalid,
    s00_axi_rready,
    s00_axi_awaddr,
    s00_axi_wdata,
    s00_axi_araddr,
    D,
    s00_axi_wstrb);
  output s00_axi_awready;
  output [0:0]SR;
  output s00_axi_wready;
  output s00_axi_arready;
  output s00_axi_bvalid;
  output s00_axi_rvalid;
  output [2:0]Q;
  output [31:0]\slv_reg0_reg[31]_0 ;
  output [31:0]s00_axi_rdata;
  input s00_axi_aclk;
  input s00_axi_aresetn;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_bready;
  input s00_axi_arvalid;
  input s00_axi_rready;
  input [1:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input [31:0]D;
  input [3:0]s00_axi_wstrb;

  wire [31:0]D;
  wire [2:0]Q;
  wire [0:0]SR;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire [3:2]axi_araddr;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready0;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire axi_awready0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire [1:0]p_0_in;
  wire [31:7]p_1_in;
  wire [31:0]reg_data_out;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire \slv_reg0[15]_i_1_n_0 ;
  wire \slv_reg0[23]_i_1_n_0 ;
  wire \slv_reg0[31]_i_1_n_0 ;
  wire \slv_reg0[7]_i_1_n_0 ;
  wire [31:0]\slv_reg0_reg[31]_0 ;
  wire \slv_reg1_reg_n_0_[10] ;
  wire \slv_reg1_reg_n_0_[11] ;
  wire \slv_reg1_reg_n_0_[12] ;
  wire \slv_reg1_reg_n_0_[13] ;
  wire \slv_reg1_reg_n_0_[14] ;
  wire \slv_reg1_reg_n_0_[15] ;
  wire \slv_reg1_reg_n_0_[16] ;
  wire \slv_reg1_reg_n_0_[17] ;
  wire \slv_reg1_reg_n_0_[18] ;
  wire \slv_reg1_reg_n_0_[19] ;
  wire \slv_reg1_reg_n_0_[20] ;
  wire \slv_reg1_reg_n_0_[21] ;
  wire \slv_reg1_reg_n_0_[22] ;
  wire \slv_reg1_reg_n_0_[23] ;
  wire \slv_reg1_reg_n_0_[24] ;
  wire \slv_reg1_reg_n_0_[25] ;
  wire \slv_reg1_reg_n_0_[26] ;
  wire \slv_reg1_reg_n_0_[27] ;
  wire \slv_reg1_reg_n_0_[28] ;
  wire \slv_reg1_reg_n_0_[29] ;
  wire \slv_reg1_reg_n_0_[30] ;
  wire \slv_reg1_reg_n_0_[31] ;
  wire \slv_reg1_reg_n_0_[3] ;
  wire \slv_reg1_reg_n_0_[4] ;
  wire \slv_reg1_reg_n_0_[5] ;
  wire \slv_reg1_reg_n_0_[6] ;
  wire \slv_reg1_reg_n_0_[7] ;
  wire \slv_reg1_reg_n_0_[8] ;
  wire \slv_reg1_reg_n_0_[9] ;
  wire [31:0]slv_reg2;
  wire \slv_reg2[15]_i_1_n_0 ;
  wire \slv_reg2[23]_i_1_n_0 ;
  wire \slv_reg2[31]_i_1_n_0 ;
  wire \slv_reg2[7]_i_1_n_0 ;
  wire [31:0]slv_reg3;
  wire slv_reg_rden__0;
  wire slv_reg_wren__0;

  LUT6 #(
    .INIT(64'hF7FFC4CCC4CCC4CC)) 
    aw_en_i_1
       (.I0(s00_axi_awvalid),
        .I1(aw_en_reg_n_0),
        .I2(s00_axi_awready),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(SR));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_arready),
        .I3(axi_araddr[2]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_axi_araddr[1]),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_arready),
        .I3(axi_araddr[3]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(axi_araddr[2]),
        .R(SR));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(axi_araddr[3]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_arready),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(s00_axi_arready),
        .R(SR));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[2]_i_1 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awready),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_awvalid),
        .I5(p_0_in[0]),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awready),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_awvalid),
        .I5(p_0_in[1]),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(p_0_in[0]),
        .R(SR));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(p_0_in[1]),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(SR));
  LUT4 #(
    .INIT(16'h2000)) 
    axi_awready_i_2
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_awready),
        .I2(aw_en_reg_n_0),
        .I3(s00_axi_awvalid),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(s00_axi_awready),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awready),
        .I3(s00_axi_wready),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(SR));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[0]_i_1 
       (.I0(Q[0]),
        .I1(\slv_reg0_reg[31]_0 [0]),
        .I2(slv_reg3[0]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[0]),
        .O(reg_data_out[0]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[10]_i_1 
       (.I0(\slv_reg1_reg_n_0_[10] ),
        .I1(\slv_reg0_reg[31]_0 [10]),
        .I2(slv_reg3[10]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[10]),
        .O(reg_data_out[10]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[11]_i_1 
       (.I0(\slv_reg1_reg_n_0_[11] ),
        .I1(\slv_reg0_reg[31]_0 [11]),
        .I2(slv_reg3[11]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[11]),
        .O(reg_data_out[11]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[12]_i_1 
       (.I0(\slv_reg1_reg_n_0_[12] ),
        .I1(\slv_reg0_reg[31]_0 [12]),
        .I2(slv_reg3[12]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[12]),
        .O(reg_data_out[12]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[13]_i_1 
       (.I0(\slv_reg1_reg_n_0_[13] ),
        .I1(\slv_reg0_reg[31]_0 [13]),
        .I2(slv_reg3[13]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[13]),
        .O(reg_data_out[13]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[14]_i_1 
       (.I0(\slv_reg1_reg_n_0_[14] ),
        .I1(\slv_reg0_reg[31]_0 [14]),
        .I2(slv_reg3[14]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[14]),
        .O(reg_data_out[14]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[15]_i_1 
       (.I0(\slv_reg1_reg_n_0_[15] ),
        .I1(\slv_reg0_reg[31]_0 [15]),
        .I2(slv_reg3[15]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[15]),
        .O(reg_data_out[15]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[16]_i_1 
       (.I0(\slv_reg1_reg_n_0_[16] ),
        .I1(\slv_reg0_reg[31]_0 [16]),
        .I2(slv_reg3[16]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[16]),
        .O(reg_data_out[16]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[17]_i_1 
       (.I0(\slv_reg1_reg_n_0_[17] ),
        .I1(\slv_reg0_reg[31]_0 [17]),
        .I2(slv_reg3[17]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[17]),
        .O(reg_data_out[17]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[18]_i_1 
       (.I0(\slv_reg1_reg_n_0_[18] ),
        .I1(\slv_reg0_reg[31]_0 [18]),
        .I2(slv_reg3[18]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[18]),
        .O(reg_data_out[18]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[19]_i_1 
       (.I0(\slv_reg1_reg_n_0_[19] ),
        .I1(\slv_reg0_reg[31]_0 [19]),
        .I2(slv_reg3[19]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[19]),
        .O(reg_data_out[19]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[1]_i_1 
       (.I0(Q[1]),
        .I1(\slv_reg0_reg[31]_0 [1]),
        .I2(slv_reg3[1]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[1]),
        .O(reg_data_out[1]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[20]_i_1 
       (.I0(\slv_reg1_reg_n_0_[20] ),
        .I1(\slv_reg0_reg[31]_0 [20]),
        .I2(slv_reg3[20]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[20]),
        .O(reg_data_out[20]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[21]_i_1 
       (.I0(\slv_reg1_reg_n_0_[21] ),
        .I1(\slv_reg0_reg[31]_0 [21]),
        .I2(slv_reg3[21]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[21]),
        .O(reg_data_out[21]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[22]_i_1 
       (.I0(\slv_reg1_reg_n_0_[22] ),
        .I1(\slv_reg0_reg[31]_0 [22]),
        .I2(slv_reg3[22]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[22]),
        .O(reg_data_out[22]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[23]_i_1 
       (.I0(\slv_reg1_reg_n_0_[23] ),
        .I1(\slv_reg0_reg[31]_0 [23]),
        .I2(slv_reg3[23]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[23]),
        .O(reg_data_out[23]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[24]_i_1 
       (.I0(\slv_reg1_reg_n_0_[24] ),
        .I1(\slv_reg0_reg[31]_0 [24]),
        .I2(slv_reg3[24]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[24]),
        .O(reg_data_out[24]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[25]_i_1 
       (.I0(\slv_reg1_reg_n_0_[25] ),
        .I1(\slv_reg0_reg[31]_0 [25]),
        .I2(slv_reg3[25]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[25]),
        .O(reg_data_out[25]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[26]_i_1 
       (.I0(\slv_reg1_reg_n_0_[26] ),
        .I1(\slv_reg0_reg[31]_0 [26]),
        .I2(slv_reg3[26]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[26]),
        .O(reg_data_out[26]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[27]_i_1 
       (.I0(\slv_reg1_reg_n_0_[27] ),
        .I1(\slv_reg0_reg[31]_0 [27]),
        .I2(slv_reg3[27]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[27]),
        .O(reg_data_out[27]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[28]_i_1 
       (.I0(\slv_reg1_reg_n_0_[28] ),
        .I1(\slv_reg0_reg[31]_0 [28]),
        .I2(slv_reg3[28]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[28]),
        .O(reg_data_out[28]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[29]_i_1 
       (.I0(\slv_reg1_reg_n_0_[29] ),
        .I1(\slv_reg0_reg[31]_0 [29]),
        .I2(slv_reg3[29]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[29]),
        .O(reg_data_out[29]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[2]_i_1 
       (.I0(Q[2]),
        .I1(\slv_reg0_reg[31]_0 [2]),
        .I2(slv_reg3[2]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[2]),
        .O(reg_data_out[2]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[30]_i_1 
       (.I0(\slv_reg1_reg_n_0_[30] ),
        .I1(\slv_reg0_reg[31]_0 [30]),
        .I2(slv_reg3[30]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[30]),
        .O(reg_data_out[30]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[31]_i_1 
       (.I0(\slv_reg1_reg_n_0_[31] ),
        .I1(\slv_reg0_reg[31]_0 [31]),
        .I2(slv_reg3[31]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[31]),
        .O(reg_data_out[31]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[3]_i_1 
       (.I0(\slv_reg1_reg_n_0_[3] ),
        .I1(\slv_reg0_reg[31]_0 [3]),
        .I2(slv_reg3[3]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[3]),
        .O(reg_data_out[3]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[4]_i_1 
       (.I0(\slv_reg1_reg_n_0_[4] ),
        .I1(\slv_reg0_reg[31]_0 [4]),
        .I2(slv_reg3[4]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[4]),
        .O(reg_data_out[4]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[5]_i_1 
       (.I0(\slv_reg1_reg_n_0_[5] ),
        .I1(\slv_reg0_reg[31]_0 [5]),
        .I2(slv_reg3[5]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[5]),
        .O(reg_data_out[5]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[6]_i_1 
       (.I0(\slv_reg1_reg_n_0_[6] ),
        .I1(\slv_reg0_reg[31]_0 [6]),
        .I2(slv_reg3[6]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[6]),
        .O(reg_data_out[6]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[7]_i_1 
       (.I0(\slv_reg1_reg_n_0_[7] ),
        .I1(\slv_reg0_reg[31]_0 [7]),
        .I2(slv_reg3[7]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[7]),
        .O(reg_data_out[7]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[8]_i_1 
       (.I0(\slv_reg1_reg_n_0_[8] ),
        .I1(\slv_reg0_reg[31]_0 [8]),
        .I2(slv_reg3[8]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[8]),
        .O(reg_data_out[8]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[9]_i_1 
       (.I0(\slv_reg1_reg_n_0_[9] ),
        .I1(\slv_reg0_reg[31]_0 [9]),
        .I2(slv_reg3[9]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[9]),
        .O(reg_data_out[9]));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(SR));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[10]),
        .R(SR));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(SR));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(SR));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[13]),
        .Q(s00_axi_rdata[13]),
        .R(SR));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[14]),
        .Q(s00_axi_rdata[14]),
        .R(SR));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[15]),
        .Q(s00_axi_rdata[15]),
        .R(SR));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[16]),
        .R(SR));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[17]),
        .Q(s00_axi_rdata[17]),
        .R(SR));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[18]),
        .Q(s00_axi_rdata[18]),
        .R(SR));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[19]),
        .Q(s00_axi_rdata[19]),
        .R(SR));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(SR));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[20]),
        .Q(s00_axi_rdata[20]),
        .R(SR));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[21]),
        .Q(s00_axi_rdata[21]),
        .R(SR));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[22]),
        .Q(s00_axi_rdata[22]),
        .R(SR));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[23]),
        .Q(s00_axi_rdata[23]),
        .R(SR));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[24]),
        .Q(s00_axi_rdata[24]),
        .R(SR));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[25]),
        .Q(s00_axi_rdata[25]),
        .R(SR));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[26]),
        .Q(s00_axi_rdata[26]),
        .R(SR));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[27]),
        .Q(s00_axi_rdata[27]),
        .R(SR));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[28]),
        .Q(s00_axi_rdata[28]),
        .R(SR));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[29]),
        .Q(s00_axi_rdata[29]),
        .R(SR));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(SR));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[30]),
        .Q(s00_axi_rdata[30]),
        .R(SR));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[31]),
        .R(SR));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(SR));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(SR));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(SR));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(SR));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[7]),
        .Q(s00_axi_rdata[7]),
        .R(SR));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[8]),
        .Q(s00_axi_rdata[8]),
        .R(SR));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[9]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(s00_axi_arready),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    axi_wready_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_wready),
        .I3(aw_en_reg_n_0),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(s00_axi_wready),
        .R(SR));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[1]),
        .O(\slv_reg0[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[2]),
        .O(\slv_reg0[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[3]),
        .O(\slv_reg0[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[0]),
        .O(\slv_reg0[7]_i_1_n_0 ));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\slv_reg0_reg[31]_0 [0]),
        .R(SR));
  FDRE \slv_reg0_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg0_reg[31]_0 [10]),
        .R(SR));
  FDRE \slv_reg0_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg0_reg[31]_0 [11]),
        .R(SR));
  FDRE \slv_reg0_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg0_reg[31]_0 [12]),
        .R(SR));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg0_reg[31]_0 [13]),
        .R(SR));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg0_reg[31]_0 [14]),
        .R(SR));
  FDRE \slv_reg0_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg0_reg[31]_0 [15]),
        .R(SR));
  FDRE \slv_reg0_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg0_reg[31]_0 [16]),
        .R(SR));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg0_reg[31]_0 [17]),
        .R(SR));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg0_reg[31]_0 [18]),
        .R(SR));
  FDRE \slv_reg0_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg0_reg[31]_0 [19]),
        .R(SR));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg0_reg[31]_0 [1]),
        .R(SR));
  FDRE \slv_reg0_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg0_reg[31]_0 [20]),
        .R(SR));
  FDRE \slv_reg0_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg0_reg[31]_0 [21]),
        .R(SR));
  FDRE \slv_reg0_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg0_reg[31]_0 [22]),
        .R(SR));
  FDRE \slv_reg0_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg0_reg[31]_0 [23]),
        .R(SR));
  FDRE \slv_reg0_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg0_reg[31]_0 [24]),
        .R(SR));
  FDRE \slv_reg0_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg0_reg[31]_0 [25]),
        .R(SR));
  FDRE \slv_reg0_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg0_reg[31]_0 [26]),
        .R(SR));
  FDRE \slv_reg0_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg0_reg[31]_0 [27]),
        .R(SR));
  FDRE \slv_reg0_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg0_reg[31]_0 [28]),
        .R(SR));
  FDRE \slv_reg0_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg0_reg[31]_0 [29]),
        .R(SR));
  FDRE \slv_reg0_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg0_reg[31]_0 [2]),
        .R(SR));
  FDRE \slv_reg0_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg0_reg[31]_0 [30]),
        .R(SR));
  FDRE \slv_reg0_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg0_reg[31]_0 [31]),
        .R(SR));
  FDRE \slv_reg0_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg0_reg[31]_0 [3]),
        .R(SR));
  FDRE \slv_reg0_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\slv_reg0_reg[31]_0 [4]),
        .R(SR));
  FDRE \slv_reg0_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg0_reg[31]_0 [5]),
        .R(SR));
  FDRE \slv_reg0_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg0_reg[31]_0 [6]),
        .R(SR));
  FDRE \slv_reg0_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg0_reg[31]_0 [7]),
        .R(SR));
  FDRE \slv_reg0_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg0_reg[31]_0 [8]),
        .R(SR));
  FDRE \slv_reg0_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg0[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg0_reg[31]_0 [9]),
        .R(SR));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[15]));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[23]));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[3]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg1[31]_i_2 
       (.I0(s00_axi_wready),
        .I1(s00_axi_awready),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .O(slv_reg_wren__0));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg1[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[0]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(p_1_in[7]));
  FDRE \slv_reg1_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE \slv_reg1_reg[10] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg1_reg_n_0_[10] ),
        .R(SR));
  FDRE \slv_reg1_reg[11] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg1_reg_n_0_[11] ),
        .R(SR));
  FDRE \slv_reg1_reg[12] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg1_reg_n_0_[12] ),
        .R(SR));
  FDRE \slv_reg1_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg1_reg_n_0_[13] ),
        .R(SR));
  FDRE \slv_reg1_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg1_reg_n_0_[14] ),
        .R(SR));
  FDRE \slv_reg1_reg[15] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg1_reg_n_0_[15] ),
        .R(SR));
  FDRE \slv_reg1_reg[16] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg1_reg_n_0_[16] ),
        .R(SR));
  FDRE \slv_reg1_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg1_reg_n_0_[17] ),
        .R(SR));
  FDRE \slv_reg1_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg1_reg_n_0_[18] ),
        .R(SR));
  FDRE \slv_reg1_reg[19] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg1_reg_n_0_[19] ),
        .R(SR));
  FDRE \slv_reg1_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE \slv_reg1_reg[20] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg1_reg_n_0_[20] ),
        .R(SR));
  FDRE \slv_reg1_reg[21] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg1_reg_n_0_[21] ),
        .R(SR));
  FDRE \slv_reg1_reg[22] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg1_reg_n_0_[22] ),
        .R(SR));
  FDRE \slv_reg1_reg[23] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg1_reg_n_0_[23] ),
        .R(SR));
  FDRE \slv_reg1_reg[24] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg1_reg_n_0_[24] ),
        .R(SR));
  FDRE \slv_reg1_reg[25] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg1_reg_n_0_[25] ),
        .R(SR));
  FDRE \slv_reg1_reg[26] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg1_reg_n_0_[26] ),
        .R(SR));
  FDRE \slv_reg1_reg[27] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg1_reg_n_0_[27] ),
        .R(SR));
  FDRE \slv_reg1_reg[28] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg1_reg_n_0_[28] ),
        .R(SR));
  FDRE \slv_reg1_reg[29] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg1_reg_n_0_[29] ),
        .R(SR));
  FDRE \slv_reg1_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE \slv_reg1_reg[30] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg1_reg_n_0_[30] ),
        .R(SR));
  FDRE \slv_reg1_reg[31] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg1_reg_n_0_[31] ),
        .R(SR));
  FDRE \slv_reg1_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg1_reg_n_0_[3] ),
        .R(SR));
  FDRE \slv_reg1_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[4]),
        .Q(\slv_reg1_reg_n_0_[4] ),
        .R(SR));
  FDRE \slv_reg1_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg1_reg_n_0_[5] ),
        .R(SR));
  FDRE \slv_reg1_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg1_reg_n_0_[6] ),
        .R(SR));
  FDRE \slv_reg1_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg1_reg_n_0_[7] ),
        .R(SR));
  FDRE \slv_reg1_reg[8] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg1_reg_n_0_[8] ),
        .R(SR));
  FDRE \slv_reg1_reg[9] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg1_reg_n_0_[9] ),
        .R(SR));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[1]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[2]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[3]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[0]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[7]_i_1_n_0 ));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg2[0]),
        .R(SR));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg2[10]),
        .R(SR));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg2[11]),
        .R(SR));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg2[12]),
        .R(SR));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg2[13]),
        .R(SR));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg2[14]),
        .R(SR));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg2[15]),
        .R(SR));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg2[16]),
        .R(SR));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg2[17]),
        .R(SR));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg2[18]),
        .R(SR));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg2[19]),
        .R(SR));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg2[1]),
        .R(SR));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg2[20]),
        .R(SR));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg2[21]),
        .R(SR));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg2[22]),
        .R(SR));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg2[23]),
        .R(SR));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg2[24]),
        .R(SR));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg2[25]),
        .R(SR));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg2[26]),
        .R(SR));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg2[27]),
        .R(SR));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg2[28]),
        .R(SR));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg2[29]),
        .R(SR));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg2[2]),
        .R(SR));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg2[30]),
        .R(SR));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg2[31]),
        .R(SR));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg2[3]),
        .R(SR));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg2[4]),
        .R(SR));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg2[5]),
        .R(SR));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg2[6]),
        .R(SR));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg2[7]),
        .R(SR));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg2[8]),
        .R(SR));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg2[9]),
        .R(SR));
  FDRE \slv_reg3_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[0]),
        .Q(slv_reg3[0]),
        .R(SR));
  FDRE \slv_reg3_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[10]),
        .Q(slv_reg3[10]),
        .R(SR));
  FDRE \slv_reg3_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[11]),
        .Q(slv_reg3[11]),
        .R(SR));
  FDRE \slv_reg3_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[12]),
        .Q(slv_reg3[12]),
        .R(SR));
  FDRE \slv_reg3_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[13]),
        .Q(slv_reg3[13]),
        .R(SR));
  FDRE \slv_reg3_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[14]),
        .Q(slv_reg3[14]),
        .R(SR));
  FDRE \slv_reg3_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[15]),
        .Q(slv_reg3[15]),
        .R(SR));
  FDRE \slv_reg3_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[16]),
        .Q(slv_reg3[16]),
        .R(SR));
  FDRE \slv_reg3_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[17]),
        .Q(slv_reg3[17]),
        .R(SR));
  FDRE \slv_reg3_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[18]),
        .Q(slv_reg3[18]),
        .R(SR));
  FDRE \slv_reg3_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[19]),
        .Q(slv_reg3[19]),
        .R(SR));
  FDRE \slv_reg3_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[1]),
        .Q(slv_reg3[1]),
        .R(SR));
  FDRE \slv_reg3_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[20]),
        .Q(slv_reg3[20]),
        .R(SR));
  FDRE \slv_reg3_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[21]),
        .Q(slv_reg3[21]),
        .R(SR));
  FDRE \slv_reg3_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[22]),
        .Q(slv_reg3[22]),
        .R(SR));
  FDRE \slv_reg3_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[23]),
        .Q(slv_reg3[23]),
        .R(SR));
  FDRE \slv_reg3_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[24]),
        .Q(slv_reg3[24]),
        .R(SR));
  FDRE \slv_reg3_reg[25] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[25]),
        .Q(slv_reg3[25]),
        .R(SR));
  FDRE \slv_reg3_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[26]),
        .Q(slv_reg3[26]),
        .R(SR));
  FDRE \slv_reg3_reg[27] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[27]),
        .Q(slv_reg3[27]),
        .R(SR));
  FDRE \slv_reg3_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[28]),
        .Q(slv_reg3[28]),
        .R(SR));
  FDRE \slv_reg3_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[29]),
        .Q(slv_reg3[29]),
        .R(SR));
  FDRE \slv_reg3_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[2]),
        .Q(slv_reg3[2]),
        .R(SR));
  FDRE \slv_reg3_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[30]),
        .Q(slv_reg3[30]),
        .R(SR));
  FDRE \slv_reg3_reg[31] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[31]),
        .Q(slv_reg3[31]),
        .R(SR));
  FDRE \slv_reg3_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[3]),
        .Q(slv_reg3[3]),
        .R(SR));
  FDRE \slv_reg3_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[4]),
        .Q(slv_reg3[4]),
        .R(SR));
  FDRE \slv_reg3_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[5]),
        .Q(slv_reg3[5]),
        .R(SR));
  FDRE \slv_reg3_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[6]),
        .Q(slv_reg3[6]),
        .R(SR));
  FDRE \slv_reg3_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[7]),
        .Q(slv_reg3[7]),
        .R(SR));
  FDRE \slv_reg3_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[8]),
        .Q(slv_reg3[8]),
        .R(SR));
  FDRE \slv_reg3_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[9]),
        .Q(slv_reg3[9]),
        .R(SR));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_rvalid),
        .I2(s00_axi_arready),
        .O(slv_reg_rden__0));
endmodule

(* ORIG_REF_NAME = "deco" *) 
module design_1_red_0_2_deco
   (out,
    Q);
  output [3:0]out;
  input [2:0]Q;

  wire [2:0]Q;
  wire [3:0]out;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \n11[30]_i_1 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[1]),
        .O(out[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \n12[30]_i_1 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[0]),
        .O(out[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \n13[30]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(out[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \n14[31]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(out[3]));
endmodule

(* ORIG_REF_NAME = "memoria" *) 
module design_1_red_0_2_memoria
   (\n12_reg[27]_0 ,
    SR,
    out,
    D,
    s00_axi_aclk);
  output [31:0]\n12_reg[27]_0 ;
  input [0:0]SR;
  input [3:0]out;
  input [31:0]D;
  input s00_axi_aclk;

  wire [31:0]D;
  wire [0:0]SR;
  wire [31:0]\n12_reg[27]_0 ;
  wire \n12_reg_n_0_[30] ;
  wire [31:0]n14;
  wire [31:1]n210__0;
  wire n210_carry__0_i_1_n_0;
  wire n210_carry__0_i_2_n_0;
  wire n210_carry__0_i_3_n_0;
  wire n210_carry__0_i_4_n_0;
  wire n210_carry__0_n_0;
  wire n210_carry__0_n_1;
  wire n210_carry__0_n_2;
  wire n210_carry__0_n_3;
  wire n210_carry__1_i_1_n_0;
  wire n210_carry__1_i_2_n_0;
  wire n210_carry__1_i_3_n_0;
  wire n210_carry__1_i_4_n_0;
  wire n210_carry__1_n_0;
  wire n210_carry__1_n_1;
  wire n210_carry__1_n_2;
  wire n210_carry__1_n_3;
  wire n210_carry__2_i_1_n_0;
  wire n210_carry__2_i_2_n_0;
  wire n210_carry__2_i_3_n_0;
  wire n210_carry__2_i_4_n_0;
  wire n210_carry__2_n_0;
  wire n210_carry__2_n_1;
  wire n210_carry__2_n_2;
  wire n210_carry__2_n_3;
  wire n210_carry__3_i_1_n_0;
  wire n210_carry__3_i_2_n_0;
  wire n210_carry__3_i_3_n_0;
  wire n210_carry__3_i_4_n_0;
  wire n210_carry__3_n_0;
  wire n210_carry__3_n_1;
  wire n210_carry__3_n_2;
  wire n210_carry__3_n_3;
  wire n210_carry__4_i_1_n_0;
  wire n210_carry__4_i_2_n_0;
  wire n210_carry__4_i_3_n_0;
  wire n210_carry__4_i_4_n_0;
  wire n210_carry__4_n_0;
  wire n210_carry__4_n_1;
  wire n210_carry__4_n_2;
  wire n210_carry__4_n_3;
  wire n210_carry__5_i_1_n_0;
  wire n210_carry__5_i_2_n_0;
  wire n210_carry__5_i_3_n_0;
  wire n210_carry__5_i_4_n_0;
  wire n210_carry__5_n_0;
  wire n210_carry__5_n_1;
  wire n210_carry__5_n_2;
  wire n210_carry__5_n_3;
  wire n210_carry__6_i_1_n_0;
  wire n210_carry__6_i_2_n_0;
  wire n210_carry__6_i_3_n_0;
  wire n210_carry__6_i_4_n_0;
  wire n210_carry__6_n_1;
  wire n210_carry__6_n_2;
  wire n210_carry__6_n_3;
  wire n210_carry_i_1_n_0;
  wire n210_carry_i_2_n_0;
  wire n210_carry_i_3_n_0;
  wire n210_carry_n_0;
  wire n210_carry_n_1;
  wire n210_carry_n_2;
  wire n210_carry_n_3;
  wire [31:1]n2111_in;
  wire n211_carry__0_i_1_n_0;
  wire n211_carry__0_i_2_n_0;
  wire n211_carry__0_i_3_n_0;
  wire n211_carry__0_i_4_n_0;
  wire n211_carry__0_n_0;
  wire n211_carry__0_n_1;
  wire n211_carry__0_n_2;
  wire n211_carry__0_n_3;
  wire n211_carry__1_i_1_n_0;
  wire n211_carry__1_i_2_n_0;
  wire n211_carry__1_i_3_n_0;
  wire n211_carry__1_i_4_n_0;
  wire n211_carry__1_n_0;
  wire n211_carry__1_n_1;
  wire n211_carry__1_n_2;
  wire n211_carry__1_n_3;
  wire n211_carry__2_i_1_n_0;
  wire n211_carry__2_i_2_n_0;
  wire n211_carry__2_i_3_n_0;
  wire n211_carry__2_i_4_n_0;
  wire n211_carry__2_n_0;
  wire n211_carry__2_n_1;
  wire n211_carry__2_n_2;
  wire n211_carry__2_n_3;
  wire n211_carry__3_i_1_n_0;
  wire n211_carry__3_i_2_n_0;
  wire n211_carry__3_i_3_n_0;
  wire n211_carry__3_i_4_n_0;
  wire n211_carry__3_n_0;
  wire n211_carry__3_n_1;
  wire n211_carry__3_n_2;
  wire n211_carry__3_n_3;
  wire n211_carry__4_i_1_n_0;
  wire n211_carry__4_i_2_n_0;
  wire n211_carry__4_i_3_n_0;
  wire n211_carry__4_i_4_n_0;
  wire n211_carry__4_n_0;
  wire n211_carry__4_n_1;
  wire n211_carry__4_n_2;
  wire n211_carry__4_n_3;
  wire n211_carry__5_i_1_n_0;
  wire n211_carry__5_i_2_n_0;
  wire n211_carry__5_i_3_n_0;
  wire n211_carry__5_i_4_n_0;
  wire n211_carry__5_n_0;
  wire n211_carry__5_n_1;
  wire n211_carry__5_n_2;
  wire n211_carry__5_n_3;
  wire n211_carry__6_i_1_n_0;
  wire n211_carry__6_i_2_n_0;
  wire n211_carry__6_i_3_n_0;
  wire n211_carry__6_n_2;
  wire n211_carry__6_n_3;
  wire n211_carry_i_1_n_0;
  wire n211_carry_i_2_n_0;
  wire n211_carry_i_3_n_0;
  wire n211_carry_n_0;
  wire n211_carry_n_1;
  wire n211_carry_n_2;
  wire n211_carry_n_3;
  wire [31:1]n22;
  wire [31:1]n220;
  wire [31:2]n221;
  wire [31:1]n2210_in;
  wire n22__1_carry__0_i_1_n_0;
  wire n22__1_carry__0_i_2_n_0;
  wire n22__1_carry__0_i_3_n_0;
  wire n22__1_carry__0_i_4_n_0;
  wire n22__1_carry__0_i_5_n_0;
  wire n22__1_carry__0_i_6_n_0;
  wire n22__1_carry__0_i_7_n_0;
  wire n22__1_carry__0_i_8_n_0;
  wire n22__1_carry__0_n_0;
  wire n22__1_carry__0_n_1;
  wire n22__1_carry__0_n_2;
  wire n22__1_carry__0_n_3;
  wire n22__1_carry__1_i_1_n_0;
  wire n22__1_carry__1_i_2_n_0;
  wire n22__1_carry__1_i_3_n_0;
  wire n22__1_carry__1_i_4_n_0;
  wire n22__1_carry__1_i_5_n_0;
  wire n22__1_carry__1_i_6_n_0;
  wire n22__1_carry__1_i_7_n_0;
  wire n22__1_carry__1_i_8_n_0;
  wire n22__1_carry__1_n_0;
  wire n22__1_carry__1_n_1;
  wire n22__1_carry__1_n_2;
  wire n22__1_carry__1_n_3;
  wire n22__1_carry__2_i_1_n_0;
  wire n22__1_carry__2_i_2_n_0;
  wire n22__1_carry__2_i_3_n_0;
  wire n22__1_carry__2_i_4_n_0;
  wire n22__1_carry__2_i_5_n_0;
  wire n22__1_carry__2_i_6_n_0;
  wire n22__1_carry__2_i_7_n_0;
  wire n22__1_carry__2_i_8_n_0;
  wire n22__1_carry__2_n_0;
  wire n22__1_carry__2_n_1;
  wire n22__1_carry__2_n_2;
  wire n22__1_carry__2_n_3;
  wire n22__1_carry__3_i_1_n_0;
  wire n22__1_carry__3_i_2_n_0;
  wire n22__1_carry__3_i_3_n_0;
  wire n22__1_carry__3_i_4_n_0;
  wire n22__1_carry__3_i_5_n_0;
  wire n22__1_carry__3_i_6_n_0;
  wire n22__1_carry__3_i_7_n_0;
  wire n22__1_carry__3_i_8_n_0;
  wire n22__1_carry__3_n_0;
  wire n22__1_carry__3_n_1;
  wire n22__1_carry__3_n_2;
  wire n22__1_carry__3_n_3;
  wire n22__1_carry__4_i_1_n_0;
  wire n22__1_carry__4_i_2_n_0;
  wire n22__1_carry__4_i_3_n_0;
  wire n22__1_carry__4_i_4_n_0;
  wire n22__1_carry__4_i_5_n_0;
  wire n22__1_carry__4_i_6_n_0;
  wire n22__1_carry__4_i_7_n_0;
  wire n22__1_carry__4_i_8_n_0;
  wire n22__1_carry__4_n_0;
  wire n22__1_carry__4_n_1;
  wire n22__1_carry__4_n_2;
  wire n22__1_carry__4_n_3;
  wire n22__1_carry__5_i_1_n_0;
  wire n22__1_carry__5_i_2_n_0;
  wire n22__1_carry__5_i_3_n_0;
  wire n22__1_carry__5_i_4_n_0;
  wire n22__1_carry__5_i_5_n_0;
  wire n22__1_carry__5_i_6_n_0;
  wire n22__1_carry__5_i_7_n_0;
  wire n22__1_carry__5_i_8_n_0;
  wire n22__1_carry__5_n_0;
  wire n22__1_carry__5_n_1;
  wire n22__1_carry__5_n_2;
  wire n22__1_carry__5_n_3;
  wire n22__1_carry__6_i_1_n_0;
  wire n22__1_carry__6_i_2_n_0;
  wire n22__1_carry__6_i_3_n_0;
  wire n22__1_carry__6_i_4_n_0;
  wire n22__1_carry__6_i_5_n_0;
  wire n22__1_carry__6_i_6_n_0;
  wire n22__1_carry__6_i_7_n_0;
  wire n22__1_carry__6_n_1;
  wire n22__1_carry__6_n_2;
  wire n22__1_carry__6_n_3;
  wire n22__1_carry_i_1_n_0;
  wire n22__1_carry_i_2_n_0;
  wire n22__1_carry_i_3_n_0;
  wire n22__1_carry_i_4_n_0;
  wire n22__1_carry_n_0;
  wire n22__1_carry_n_1;
  wire n22__1_carry_n_2;
  wire n22__1_carry_n_3;
  wire [31:1]n310;
  wire n310_carry__0_i_1_n_0;
  wire n310_carry__0_i_2_n_0;
  wire n310_carry__0_i_3_n_0;
  wire n310_carry__0_i_4_n_0;
  wire n310_carry__0_n_0;
  wire n310_carry__0_n_1;
  wire n310_carry__0_n_2;
  wire n310_carry__0_n_3;
  wire n310_carry__1_i_1_n_0;
  wire n310_carry__1_i_2_n_0;
  wire n310_carry__1_i_3_n_0;
  wire n310_carry__1_i_4_n_0;
  wire n310_carry__1_n_0;
  wire n310_carry__1_n_1;
  wire n310_carry__1_n_2;
  wire n310_carry__1_n_3;
  wire n310_carry__2_i_1_n_0;
  wire n310_carry__2_i_2_n_0;
  wire n310_carry__2_i_3_n_0;
  wire n310_carry__2_i_4_n_0;
  wire n310_carry__2_n_0;
  wire n310_carry__2_n_1;
  wire n310_carry__2_n_2;
  wire n310_carry__2_n_3;
  wire n310_carry__3_i_1_n_0;
  wire n310_carry__3_i_2_n_0;
  wire n310_carry__3_i_3_n_0;
  wire n310_carry__3_i_4_n_0;
  wire n310_carry__3_n_0;
  wire n310_carry__3_n_1;
  wire n310_carry__3_n_2;
  wire n310_carry__3_n_3;
  wire n310_carry__4_i_1_n_0;
  wire n310_carry__4_i_2_n_0;
  wire n310_carry__4_i_3_n_0;
  wire n310_carry__4_i_4_n_0;
  wire n310_carry__4_n_0;
  wire n310_carry__4_n_1;
  wire n310_carry__4_n_2;
  wire n310_carry__4_n_3;
  wire n310_carry__5_i_1_n_0;
  wire n310_carry__5_i_2_n_0;
  wire n310_carry__5_i_3_n_0;
  wire n310_carry__5_i_4_n_0;
  wire n310_carry__5_n_0;
  wire n310_carry__5_n_1;
  wire n310_carry__5_n_2;
  wire n310_carry__5_n_3;
  wire n310_carry__6_i_1_n_0;
  wire n310_carry__6_i_2_n_0;
  wire n310_carry__6_i_3_n_0;
  wire n310_carry__6_i_4_n_0;
  wire n310_carry__6_n_1;
  wire n310_carry__6_n_2;
  wire n310_carry__6_n_3;
  wire n310_carry_i_1_n_0;
  wire n310_carry_i_2_n_0;
  wire n310_carry_i_3_n_0;
  wire n310_carry_n_0;
  wire n310_carry_n_1;
  wire n310_carry_n_2;
  wire n310_carry_n_3;
  wire n31__0_carry__0_i_10_n_0;
  wire n31__0_carry__0_i_11_n_0;
  wire n31__0_carry__0_i_12_n_0;
  wire n31__0_carry__0_i_1_n_0;
  wire n31__0_carry__0_i_2_n_0;
  wire n31__0_carry__0_i_3_n_0;
  wire n31__0_carry__0_i_4_n_0;
  wire n31__0_carry__0_i_5_n_0;
  wire n31__0_carry__0_i_6_n_0;
  wire n31__0_carry__0_i_7_n_0;
  wire n31__0_carry__0_i_8_n_0;
  wire n31__0_carry__0_i_9_n_0;
  wire n31__0_carry__0_n_0;
  wire n31__0_carry__0_n_1;
  wire n31__0_carry__0_n_2;
  wire n31__0_carry__0_n_3;
  wire n31__0_carry__1_i_10_n_0;
  wire n31__0_carry__1_i_11_n_0;
  wire n31__0_carry__1_i_12_n_0;
  wire n31__0_carry__1_i_1_n_0;
  wire n31__0_carry__1_i_2_n_0;
  wire n31__0_carry__1_i_3_n_0;
  wire n31__0_carry__1_i_4_n_0;
  wire n31__0_carry__1_i_5_n_0;
  wire n31__0_carry__1_i_6_n_0;
  wire n31__0_carry__1_i_7_n_0;
  wire n31__0_carry__1_i_8_n_0;
  wire n31__0_carry__1_i_9_n_0;
  wire n31__0_carry__1_n_0;
  wire n31__0_carry__1_n_1;
  wire n31__0_carry__1_n_2;
  wire n31__0_carry__1_n_3;
  wire n31__0_carry__2_i_10_n_0;
  wire n31__0_carry__2_i_11_n_0;
  wire n31__0_carry__2_i_12_n_0;
  wire n31__0_carry__2_i_1_n_0;
  wire n31__0_carry__2_i_2_n_0;
  wire n31__0_carry__2_i_3_n_0;
  wire n31__0_carry__2_i_4_n_0;
  wire n31__0_carry__2_i_5_n_0;
  wire n31__0_carry__2_i_6_n_0;
  wire n31__0_carry__2_i_7_n_0;
  wire n31__0_carry__2_i_8_n_0;
  wire n31__0_carry__2_i_9_n_0;
  wire n31__0_carry__2_n_0;
  wire n31__0_carry__2_n_1;
  wire n31__0_carry__2_n_2;
  wire n31__0_carry__2_n_3;
  wire n31__0_carry__3_i_10_n_0;
  wire n31__0_carry__3_i_11_n_0;
  wire n31__0_carry__3_i_12_n_0;
  wire n31__0_carry__3_i_1_n_0;
  wire n31__0_carry__3_i_2_n_0;
  wire n31__0_carry__3_i_3_n_0;
  wire n31__0_carry__3_i_4_n_0;
  wire n31__0_carry__3_i_5_n_0;
  wire n31__0_carry__3_i_6_n_0;
  wire n31__0_carry__3_i_7_n_0;
  wire n31__0_carry__3_i_8_n_0;
  wire n31__0_carry__3_i_9_n_0;
  wire n31__0_carry__3_n_0;
  wire n31__0_carry__3_n_1;
  wire n31__0_carry__3_n_2;
  wire n31__0_carry__3_n_3;
  wire n31__0_carry__4_i_10_n_0;
  wire n31__0_carry__4_i_11_n_0;
  wire n31__0_carry__4_i_12_n_0;
  wire n31__0_carry__4_i_1_n_0;
  wire n31__0_carry__4_i_2_n_0;
  wire n31__0_carry__4_i_3_n_0;
  wire n31__0_carry__4_i_4_n_0;
  wire n31__0_carry__4_i_5_n_0;
  wire n31__0_carry__4_i_6_n_0;
  wire n31__0_carry__4_i_7_n_0;
  wire n31__0_carry__4_i_8_n_0;
  wire n31__0_carry__4_i_9_n_0;
  wire n31__0_carry__4_n_0;
  wire n31__0_carry__4_n_1;
  wire n31__0_carry__4_n_2;
  wire n31__0_carry__4_n_3;
  wire n31__0_carry__5_i_10_n_0;
  wire n31__0_carry__5_i_11_n_0;
  wire n31__0_carry__5_i_12_n_0;
  wire n31__0_carry__5_i_1_n_0;
  wire n31__0_carry__5_i_2_n_0;
  wire n31__0_carry__5_i_3_n_0;
  wire n31__0_carry__5_i_4_n_0;
  wire n31__0_carry__5_i_5_n_0;
  wire n31__0_carry__5_i_6_n_0;
  wire n31__0_carry__5_i_7_n_0;
  wire n31__0_carry__5_i_8_n_0;
  wire n31__0_carry__5_i_9_n_0;
  wire n31__0_carry__5_n_0;
  wire n31__0_carry__5_n_1;
  wire n31__0_carry__5_n_2;
  wire n31__0_carry__5_n_3;
  wire n31__0_carry__6_i_1_n_0;
  wire n31__0_carry__6_i_2_n_0;
  wire n31__0_carry__6_i_3_n_0;
  wire n31__0_carry__6_i_4_n_0;
  wire n31__0_carry__6_i_5_n_0;
  wire n31__0_carry__6_i_6_n_0;
  wire n31__0_carry__6_i_7_n_0;
  wire n31__0_carry__6_i_8_n_0;
  wire n31__0_carry__6_i_9_n_0;
  wire n31__0_carry__6_n_2;
  wire n31__0_carry__6_n_3;
  wire n31__0_carry_i_10_n_0;
  wire n31__0_carry_i_1_n_0;
  wire n31__0_carry_i_2_n_0;
  wire n31__0_carry_i_3_n_0;
  wire n31__0_carry_i_4_n_0;
  wire n31__0_carry_i_5_n_0;
  wire n31__0_carry_i_6_n_0;
  wire n31__0_carry_i_7_n_0;
  wire n31__0_carry_i_8_n_0;
  wire n31__0_carry_i_9_n_0;
  wire n31__0_carry_n_0;
  wire n31__0_carry_n_1;
  wire n31__0_carry_n_2;
  wire n31__0_carry_n_3;
  wire [3:0]out;
  wire s00_axi_aclk;
  wire [3:3]NLW_n210_carry__6_CO_UNCONNECTED;
  wire [3:2]NLW_n211_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_n211_carry__6_O_UNCONNECTED;
  wire [0:0]NLW_n22__1_carry_O_UNCONNECTED;
  wire [3:3]NLW_n22__1_carry__6_CO_UNCONNECTED;
  wire [0:0]NLW_n310_carry_O_UNCONNECTED;
  wire [3:3]NLW_n310_carry__6_CO_UNCONNECTED;
  wire [3:2]NLW_n31__0_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_n31__0_carry__6_O_UNCONNECTED;

  FDRE \n11_reg[0] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[0]),
        .Q(n2210_in[1]),
        .R(SR));
  FDRE \n11_reg[10] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[10]),
        .Q(n2210_in[11]),
        .R(SR));
  FDRE \n11_reg[11] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[11]),
        .Q(n2210_in[12]),
        .R(SR));
  FDRE \n11_reg[12] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[12]),
        .Q(n2210_in[13]),
        .R(SR));
  FDRE \n11_reg[13] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[13]),
        .Q(n2210_in[14]),
        .R(SR));
  FDRE \n11_reg[14] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[14]),
        .Q(n2210_in[15]),
        .R(SR));
  FDRE \n11_reg[15] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[15]),
        .Q(n2210_in[16]),
        .R(SR));
  FDRE \n11_reg[16] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[16]),
        .Q(n2210_in[17]),
        .R(SR));
  FDRE \n11_reg[17] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[17]),
        .Q(n2210_in[18]),
        .R(SR));
  FDRE \n11_reg[18] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[18]),
        .Q(n2210_in[19]),
        .R(SR));
  FDRE \n11_reg[19] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[19]),
        .Q(n2210_in[20]),
        .R(SR));
  FDRE \n11_reg[1] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[1]),
        .Q(n2210_in[2]),
        .R(SR));
  FDRE \n11_reg[20] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[20]),
        .Q(n2210_in[21]),
        .R(SR));
  FDRE \n11_reg[21] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[21]),
        .Q(n2210_in[22]),
        .R(SR));
  FDRE \n11_reg[22] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[22]),
        .Q(n2210_in[23]),
        .R(SR));
  FDRE \n11_reg[23] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[23]),
        .Q(n2210_in[24]),
        .R(SR));
  FDRE \n11_reg[24] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[24]),
        .Q(n2210_in[25]),
        .R(SR));
  FDRE \n11_reg[25] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[25]),
        .Q(n2210_in[26]),
        .R(SR));
  FDRE \n11_reg[26] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[26]),
        .Q(n2210_in[27]),
        .R(SR));
  FDRE \n11_reg[27] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[27]),
        .Q(n2210_in[28]),
        .R(SR));
  FDRE \n11_reg[28] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[28]),
        .Q(n2210_in[29]),
        .R(SR));
  FDRE \n11_reg[29] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[29]),
        .Q(n2210_in[30]),
        .R(SR));
  FDRE \n11_reg[2] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[2]),
        .Q(n2210_in[3]),
        .R(SR));
  FDRE \n11_reg[30] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[30]),
        .Q(n2210_in[31]),
        .R(SR));
  FDRE \n11_reg[3] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[3]),
        .Q(n2210_in[4]),
        .R(SR));
  FDRE \n11_reg[4] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[4]),
        .Q(n2210_in[5]),
        .R(SR));
  FDRE \n11_reg[5] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[5]),
        .Q(n2210_in[6]),
        .R(SR));
  FDRE \n11_reg[6] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[6]),
        .Q(n2210_in[7]),
        .R(SR));
  FDRE \n11_reg[7] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[7]),
        .Q(n2210_in[8]),
        .R(SR));
  FDRE \n11_reg[8] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[8]),
        .Q(n2210_in[9]),
        .R(SR));
  FDRE \n11_reg[9] 
       (.C(s00_axi_aclk),
        .CE(out[0]),
        .D(D[9]),
        .Q(n2210_in[10]),
        .R(SR));
  FDRE \n12_reg[0] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[0]),
        .Q(n221[2]),
        .R(SR));
  FDRE \n12_reg[10] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[10]),
        .Q(n221[12]),
        .R(SR));
  FDRE \n12_reg[11] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[11]),
        .Q(n221[13]),
        .R(SR));
  FDRE \n12_reg[12] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[12]),
        .Q(n221[14]),
        .R(SR));
  FDRE \n12_reg[13] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[13]),
        .Q(n221[15]),
        .R(SR));
  FDRE \n12_reg[14] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[14]),
        .Q(n221[16]),
        .R(SR));
  FDRE \n12_reg[15] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[15]),
        .Q(n221[17]),
        .R(SR));
  FDRE \n12_reg[16] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[16]),
        .Q(n221[18]),
        .R(SR));
  FDRE \n12_reg[17] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[17]),
        .Q(n221[19]),
        .R(SR));
  FDRE \n12_reg[18] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[18]),
        .Q(n221[20]),
        .R(SR));
  FDRE \n12_reg[19] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[19]),
        .Q(n221[21]),
        .R(SR));
  FDRE \n12_reg[1] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[1]),
        .Q(n221[3]),
        .R(SR));
  FDRE \n12_reg[20] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[20]),
        .Q(n221[22]),
        .R(SR));
  FDRE \n12_reg[21] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[21]),
        .Q(n221[23]),
        .R(SR));
  FDRE \n12_reg[22] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[22]),
        .Q(n221[24]),
        .R(SR));
  FDRE \n12_reg[23] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[23]),
        .Q(n221[25]),
        .R(SR));
  FDRE \n12_reg[24] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[24]),
        .Q(n221[26]),
        .R(SR));
  FDRE \n12_reg[25] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[25]),
        .Q(n221[27]),
        .R(SR));
  FDRE \n12_reg[26] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[26]),
        .Q(n221[28]),
        .R(SR));
  FDRE \n12_reg[27] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[27]),
        .Q(n221[29]),
        .R(SR));
  FDRE \n12_reg[28] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[28]),
        .Q(n221[30]),
        .R(SR));
  FDRE \n12_reg[29] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[29]),
        .Q(n221[31]),
        .R(SR));
  FDRE \n12_reg[2] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[2]),
        .Q(n221[4]),
        .R(SR));
  FDRE \n12_reg[30] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[30]),
        .Q(\n12_reg_n_0_[30] ),
        .R(SR));
  FDRE \n12_reg[3] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[3]),
        .Q(n221[5]),
        .R(SR));
  FDRE \n12_reg[4] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[4]),
        .Q(n221[6]),
        .R(SR));
  FDRE \n12_reg[5] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[5]),
        .Q(n221[7]),
        .R(SR));
  FDRE \n12_reg[6] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[6]),
        .Q(n221[8]),
        .R(SR));
  FDRE \n12_reg[7] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[7]),
        .Q(n221[9]),
        .R(SR));
  FDRE \n12_reg[8] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[8]),
        .Q(n221[10]),
        .R(SR));
  FDRE \n12_reg[9] 
       (.C(s00_axi_aclk),
        .CE(out[1]),
        .D(D[9]),
        .Q(n221[11]),
        .R(SR));
  FDRE \n13_reg[0] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[0]),
        .Q(n220[1]),
        .R(SR));
  FDRE \n13_reg[10] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[10]),
        .Q(n220[11]),
        .R(SR));
  FDRE \n13_reg[11] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[11]),
        .Q(n220[12]),
        .R(SR));
  FDRE \n13_reg[12] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[12]),
        .Q(n220[13]),
        .R(SR));
  FDRE \n13_reg[13] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[13]),
        .Q(n220[14]),
        .R(SR));
  FDRE \n13_reg[14] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[14]),
        .Q(n220[15]),
        .R(SR));
  FDRE \n13_reg[15] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[15]),
        .Q(n220[16]),
        .R(SR));
  FDRE \n13_reg[16] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[16]),
        .Q(n220[17]),
        .R(SR));
  FDRE \n13_reg[17] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[17]),
        .Q(n220[18]),
        .R(SR));
  FDRE \n13_reg[18] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[18]),
        .Q(n220[19]),
        .R(SR));
  FDRE \n13_reg[19] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[19]),
        .Q(n220[20]),
        .R(SR));
  FDRE \n13_reg[1] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[1]),
        .Q(n220[2]),
        .R(SR));
  FDRE \n13_reg[20] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[20]),
        .Q(n220[21]),
        .R(SR));
  FDRE \n13_reg[21] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[21]),
        .Q(n220[22]),
        .R(SR));
  FDRE \n13_reg[22] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[22]),
        .Q(n220[23]),
        .R(SR));
  FDRE \n13_reg[23] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[23]),
        .Q(n220[24]),
        .R(SR));
  FDRE \n13_reg[24] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[24]),
        .Q(n220[25]),
        .R(SR));
  FDRE \n13_reg[25] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[25]),
        .Q(n220[26]),
        .R(SR));
  FDRE \n13_reg[26] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[26]),
        .Q(n220[27]),
        .R(SR));
  FDRE \n13_reg[27] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[27]),
        .Q(n220[28]),
        .R(SR));
  FDRE \n13_reg[28] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[28]),
        .Q(n220[29]),
        .R(SR));
  FDRE \n13_reg[29] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[29]),
        .Q(n220[30]),
        .R(SR));
  FDRE \n13_reg[2] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[2]),
        .Q(n220[3]),
        .R(SR));
  FDRE \n13_reg[30] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[30]),
        .Q(n220[31]),
        .R(SR));
  FDRE \n13_reg[3] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[3]),
        .Q(n220[4]),
        .R(SR));
  FDRE \n13_reg[4] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[4]),
        .Q(n220[5]),
        .R(SR));
  FDRE \n13_reg[5] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[5]),
        .Q(n220[6]),
        .R(SR));
  FDRE \n13_reg[6] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[6]),
        .Q(n220[7]),
        .R(SR));
  FDRE \n13_reg[7] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[7]),
        .Q(n220[8]),
        .R(SR));
  FDRE \n13_reg[8] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[8]),
        .Q(n220[9]),
        .R(SR));
  FDRE \n13_reg[9] 
       (.C(s00_axi_aclk),
        .CE(out[2]),
        .D(D[9]),
        .Q(n220[10]),
        .R(SR));
  FDRE \n14_reg[0] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[0]),
        .Q(n14[0]),
        .R(SR));
  FDRE \n14_reg[10] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[10]),
        .Q(n14[10]),
        .R(SR));
  FDRE \n14_reg[11] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[11]),
        .Q(n14[11]),
        .R(SR));
  FDRE \n14_reg[12] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[12]),
        .Q(n14[12]),
        .R(SR));
  FDRE \n14_reg[13] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[13]),
        .Q(n14[13]),
        .R(SR));
  FDRE \n14_reg[14] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[14]),
        .Q(n14[14]),
        .R(SR));
  FDRE \n14_reg[15] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[15]),
        .Q(n14[15]),
        .R(SR));
  FDRE \n14_reg[16] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[16]),
        .Q(n14[16]),
        .R(SR));
  FDRE \n14_reg[17] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[17]),
        .Q(n14[17]),
        .R(SR));
  FDRE \n14_reg[18] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[18]),
        .Q(n14[18]),
        .R(SR));
  FDRE \n14_reg[19] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[19]),
        .Q(n14[19]),
        .R(SR));
  FDRE \n14_reg[1] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[1]),
        .Q(n14[1]),
        .R(SR));
  FDRE \n14_reg[20] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[20]),
        .Q(n14[20]),
        .R(SR));
  FDRE \n14_reg[21] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[21]),
        .Q(n14[21]),
        .R(SR));
  FDRE \n14_reg[22] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[22]),
        .Q(n14[22]),
        .R(SR));
  FDRE \n14_reg[23] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[23]),
        .Q(n14[23]),
        .R(SR));
  FDRE \n14_reg[24] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[24]),
        .Q(n14[24]),
        .R(SR));
  FDRE \n14_reg[25] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[25]),
        .Q(n14[25]),
        .R(SR));
  FDRE \n14_reg[26] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[26]),
        .Q(n14[26]),
        .R(SR));
  FDRE \n14_reg[27] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[27]),
        .Q(n14[27]),
        .R(SR));
  FDRE \n14_reg[28] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[28]),
        .Q(n14[28]),
        .R(SR));
  FDRE \n14_reg[29] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[29]),
        .Q(n14[29]),
        .R(SR));
  FDRE \n14_reg[2] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[2]),
        .Q(n14[2]),
        .R(SR));
  FDRE \n14_reg[30] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[30]),
        .Q(n14[30]),
        .R(SR));
  FDRE \n14_reg[31] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[31]),
        .Q(n14[31]),
        .R(SR));
  FDRE \n14_reg[3] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[3]),
        .Q(n14[3]),
        .R(SR));
  FDRE \n14_reg[4] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[4]),
        .Q(n14[4]),
        .R(SR));
  FDRE \n14_reg[5] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[5]),
        .Q(n14[5]),
        .R(SR));
  FDRE \n14_reg[6] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[6]),
        .Q(n14[6]),
        .R(SR));
  FDRE \n14_reg[7] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[7]),
        .Q(n14[7]),
        .R(SR));
  FDRE \n14_reg[8] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[8]),
        .Q(n14[8]),
        .R(SR));
  FDRE \n14_reg[9] 
       (.C(s00_axi_aclk),
        .CE(out[3]),
        .D(D[9]),
        .Q(n14[9]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n210_carry
       (.CI(1'b0),
        .CO({n210_carry_n_0,n210_carry_n_1,n210_carry_n_2,n210_carry_n_3}),
        .CYINIT(1'b0),
        .DI({n14[1:0],1'b0,1'b1}),
        .O({n210__0[3:1],\n12_reg[27]_0 [0]}),
        .S({n210_carry_i_1_n_0,n210_carry_i_2_n_0,n210_carry_i_3_n_0,n14[0]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n210_carry__0
       (.CI(n210_carry_n_0),
        .CO({n210_carry__0_n_0,n210_carry__0_n_1,n210_carry__0_n_2,n210_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(n14[5:2]),
        .O(n210__0[7:4]),
        .S({n210_carry__0_i_1_n_0,n210_carry__0_i_2_n_0,n210_carry__0_i_3_n_0,n210_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__0_i_1
       (.I0(n14[5]),
        .I1(n14[7]),
        .O(n210_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__0_i_2
       (.I0(n14[4]),
        .I1(n14[6]),
        .O(n210_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__0_i_3
       (.I0(n14[3]),
        .I1(n14[5]),
        .O(n210_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__0_i_4
       (.I0(n14[2]),
        .I1(n14[4]),
        .O(n210_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n210_carry__1
       (.CI(n210_carry__0_n_0),
        .CO({n210_carry__1_n_0,n210_carry__1_n_1,n210_carry__1_n_2,n210_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(n14[9:6]),
        .O(n210__0[11:8]),
        .S({n210_carry__1_i_1_n_0,n210_carry__1_i_2_n_0,n210_carry__1_i_3_n_0,n210_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__1_i_1
       (.I0(n14[9]),
        .I1(n14[11]),
        .O(n210_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__1_i_2
       (.I0(n14[8]),
        .I1(n14[10]),
        .O(n210_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__1_i_3
       (.I0(n14[7]),
        .I1(n14[9]),
        .O(n210_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__1_i_4
       (.I0(n14[6]),
        .I1(n14[8]),
        .O(n210_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n210_carry__2
       (.CI(n210_carry__1_n_0),
        .CO({n210_carry__2_n_0,n210_carry__2_n_1,n210_carry__2_n_2,n210_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(n14[13:10]),
        .O(n210__0[15:12]),
        .S({n210_carry__2_i_1_n_0,n210_carry__2_i_2_n_0,n210_carry__2_i_3_n_0,n210_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__2_i_1
       (.I0(n14[13]),
        .I1(n14[15]),
        .O(n210_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__2_i_2
       (.I0(n14[12]),
        .I1(n14[14]),
        .O(n210_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__2_i_3
       (.I0(n14[11]),
        .I1(n14[13]),
        .O(n210_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__2_i_4
       (.I0(n14[10]),
        .I1(n14[12]),
        .O(n210_carry__2_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n210_carry__3
       (.CI(n210_carry__2_n_0),
        .CO({n210_carry__3_n_0,n210_carry__3_n_1,n210_carry__3_n_2,n210_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(n14[17:14]),
        .O(n210__0[19:16]),
        .S({n210_carry__3_i_1_n_0,n210_carry__3_i_2_n_0,n210_carry__3_i_3_n_0,n210_carry__3_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__3_i_1
       (.I0(n14[17]),
        .I1(n14[19]),
        .O(n210_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__3_i_2
       (.I0(n14[16]),
        .I1(n14[18]),
        .O(n210_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__3_i_3
       (.I0(n14[15]),
        .I1(n14[17]),
        .O(n210_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__3_i_4
       (.I0(n14[14]),
        .I1(n14[16]),
        .O(n210_carry__3_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n210_carry__4
       (.CI(n210_carry__3_n_0),
        .CO({n210_carry__4_n_0,n210_carry__4_n_1,n210_carry__4_n_2,n210_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(n14[21:18]),
        .O(n210__0[23:20]),
        .S({n210_carry__4_i_1_n_0,n210_carry__4_i_2_n_0,n210_carry__4_i_3_n_0,n210_carry__4_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__4_i_1
       (.I0(n14[21]),
        .I1(n14[23]),
        .O(n210_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__4_i_2
       (.I0(n14[20]),
        .I1(n14[22]),
        .O(n210_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__4_i_3
       (.I0(n14[19]),
        .I1(n14[21]),
        .O(n210_carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__4_i_4
       (.I0(n14[18]),
        .I1(n14[20]),
        .O(n210_carry__4_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n210_carry__5
       (.CI(n210_carry__4_n_0),
        .CO({n210_carry__5_n_0,n210_carry__5_n_1,n210_carry__5_n_2,n210_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI(n14[25:22]),
        .O(n210__0[27:24]),
        .S({n210_carry__5_i_1_n_0,n210_carry__5_i_2_n_0,n210_carry__5_i_3_n_0,n210_carry__5_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__5_i_1
       (.I0(n14[25]),
        .I1(n14[27]),
        .O(n210_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__5_i_2
       (.I0(n14[24]),
        .I1(n14[26]),
        .O(n210_carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__5_i_3
       (.I0(n14[23]),
        .I1(n14[25]),
        .O(n210_carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__5_i_4
       (.I0(n14[22]),
        .I1(n14[24]),
        .O(n210_carry__5_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n210_carry__6
       (.CI(n210_carry__5_n_0),
        .CO({NLW_n210_carry__6_CO_UNCONNECTED[3],n210_carry__6_n_1,n210_carry__6_n_2,n210_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,n14[28:26]}),
        .O(n210__0[31:28]),
        .S({n210_carry__6_i_1_n_0,n210_carry__6_i_2_n_0,n210_carry__6_i_3_n_0,n210_carry__6_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__6_i_1
       (.I0(n14[29]),
        .I1(n14[31]),
        .O(n210_carry__6_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__6_i_2
       (.I0(n14[28]),
        .I1(n14[30]),
        .O(n210_carry__6_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__6_i_3
       (.I0(n14[27]),
        .I1(n14[29]),
        .O(n210_carry__6_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry__6_i_4
       (.I0(n14[26]),
        .I1(n14[28]),
        .O(n210_carry__6_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry_i_1
       (.I0(n14[1]),
        .I1(n14[3]),
        .O(n210_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n210_carry_i_2
       (.I0(n14[0]),
        .I1(n14[2]),
        .O(n210_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    n210_carry_i_3
       (.I0(n14[1]),
        .O(n210_carry_i_3_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n211_carry
       (.CI(1'b0),
        .CO({n211_carry_n_0,n211_carry_n_1,n211_carry_n_2,n211_carry_n_3}),
        .CYINIT(1'b0),
        .DI({n2210_in[2:1],1'b0,1'b1}),
        .O(n2111_in[4:1]),
        .S({n211_carry_i_1_n_0,n211_carry_i_2_n_0,n211_carry_i_3_n_0,n2210_in[1]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n211_carry__0
       (.CI(n211_carry_n_0),
        .CO({n211_carry__0_n_0,n211_carry__0_n_1,n211_carry__0_n_2,n211_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(n2210_in[6:3]),
        .O(n2111_in[8:5]),
        .S({n211_carry__0_i_1_n_0,n211_carry__0_i_2_n_0,n211_carry__0_i_3_n_0,n211_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__0_i_1
       (.I0(n2210_in[6]),
        .I1(n2210_in[8]),
        .O(n211_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__0_i_2
       (.I0(n2210_in[5]),
        .I1(n2210_in[7]),
        .O(n211_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__0_i_3
       (.I0(n2210_in[4]),
        .I1(n2210_in[6]),
        .O(n211_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__0_i_4
       (.I0(n2210_in[3]),
        .I1(n2210_in[5]),
        .O(n211_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n211_carry__1
       (.CI(n211_carry__0_n_0),
        .CO({n211_carry__1_n_0,n211_carry__1_n_1,n211_carry__1_n_2,n211_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(n2210_in[10:7]),
        .O(n2111_in[12:9]),
        .S({n211_carry__1_i_1_n_0,n211_carry__1_i_2_n_0,n211_carry__1_i_3_n_0,n211_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__1_i_1
       (.I0(n2210_in[10]),
        .I1(n2210_in[12]),
        .O(n211_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__1_i_2
       (.I0(n2210_in[9]),
        .I1(n2210_in[11]),
        .O(n211_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__1_i_3
       (.I0(n2210_in[8]),
        .I1(n2210_in[10]),
        .O(n211_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__1_i_4
       (.I0(n2210_in[7]),
        .I1(n2210_in[9]),
        .O(n211_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n211_carry__2
       (.CI(n211_carry__1_n_0),
        .CO({n211_carry__2_n_0,n211_carry__2_n_1,n211_carry__2_n_2,n211_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(n2210_in[14:11]),
        .O(n2111_in[16:13]),
        .S({n211_carry__2_i_1_n_0,n211_carry__2_i_2_n_0,n211_carry__2_i_3_n_0,n211_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__2_i_1
       (.I0(n2210_in[14]),
        .I1(n2210_in[16]),
        .O(n211_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__2_i_2
       (.I0(n2210_in[13]),
        .I1(n2210_in[15]),
        .O(n211_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__2_i_3
       (.I0(n2210_in[12]),
        .I1(n2210_in[14]),
        .O(n211_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__2_i_4
       (.I0(n2210_in[11]),
        .I1(n2210_in[13]),
        .O(n211_carry__2_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n211_carry__3
       (.CI(n211_carry__2_n_0),
        .CO({n211_carry__3_n_0,n211_carry__3_n_1,n211_carry__3_n_2,n211_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(n2210_in[18:15]),
        .O(n2111_in[20:17]),
        .S({n211_carry__3_i_1_n_0,n211_carry__3_i_2_n_0,n211_carry__3_i_3_n_0,n211_carry__3_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__3_i_1
       (.I0(n2210_in[18]),
        .I1(n2210_in[20]),
        .O(n211_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__3_i_2
       (.I0(n2210_in[17]),
        .I1(n2210_in[19]),
        .O(n211_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__3_i_3
       (.I0(n2210_in[16]),
        .I1(n2210_in[18]),
        .O(n211_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__3_i_4
       (.I0(n2210_in[15]),
        .I1(n2210_in[17]),
        .O(n211_carry__3_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n211_carry__4
       (.CI(n211_carry__3_n_0),
        .CO({n211_carry__4_n_0,n211_carry__4_n_1,n211_carry__4_n_2,n211_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(n2210_in[22:19]),
        .O(n2111_in[24:21]),
        .S({n211_carry__4_i_1_n_0,n211_carry__4_i_2_n_0,n211_carry__4_i_3_n_0,n211_carry__4_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__4_i_1
       (.I0(n2210_in[22]),
        .I1(n2210_in[24]),
        .O(n211_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__4_i_2
       (.I0(n2210_in[21]),
        .I1(n2210_in[23]),
        .O(n211_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__4_i_3
       (.I0(n2210_in[20]),
        .I1(n2210_in[22]),
        .O(n211_carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__4_i_4
       (.I0(n2210_in[19]),
        .I1(n2210_in[21]),
        .O(n211_carry__4_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n211_carry__5
       (.CI(n211_carry__4_n_0),
        .CO({n211_carry__5_n_0,n211_carry__5_n_1,n211_carry__5_n_2,n211_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI(n2210_in[26:23]),
        .O(n2111_in[28:25]),
        .S({n211_carry__5_i_1_n_0,n211_carry__5_i_2_n_0,n211_carry__5_i_3_n_0,n211_carry__5_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__5_i_1
       (.I0(n2210_in[26]),
        .I1(n2210_in[28]),
        .O(n211_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__5_i_2
       (.I0(n2210_in[25]),
        .I1(n2210_in[27]),
        .O(n211_carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__5_i_3
       (.I0(n2210_in[24]),
        .I1(n2210_in[26]),
        .O(n211_carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__5_i_4
       (.I0(n2210_in[23]),
        .I1(n2210_in[25]),
        .O(n211_carry__5_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n211_carry__6
       (.CI(n211_carry__5_n_0),
        .CO({NLW_n211_carry__6_CO_UNCONNECTED[3:2],n211_carry__6_n_2,n211_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,n2210_in[28:27]}),
        .O({NLW_n211_carry__6_O_UNCONNECTED[3],n2111_in[31:29]}),
        .S({1'b0,n211_carry__6_i_1_n_0,n211_carry__6_i_2_n_0,n211_carry__6_i_3_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__6_i_1
       (.I0(n2210_in[29]),
        .I1(n2210_in[31]),
        .O(n211_carry__6_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__6_i_2
       (.I0(n2210_in[28]),
        .I1(n2210_in[30]),
        .O(n211_carry__6_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry__6_i_3
       (.I0(n2210_in[27]),
        .I1(n2210_in[29]),
        .O(n211_carry__6_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry_i_1
       (.I0(n2210_in[2]),
        .I1(n2210_in[4]),
        .O(n211_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n211_carry_i_2
       (.I0(n2210_in[1]),
        .I1(n2210_in[3]),
        .O(n211_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    n211_carry_i_3
       (.I0(n2210_in[2]),
        .O(n211_carry_i_3_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n22__1_carry
       (.CI(1'b0),
        .CO({n22__1_carry_n_0,n22__1_carry_n_1,n22__1_carry_n_2,n22__1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({n22__1_carry_i_1_n_0,n2210_in[2:1],1'b0}),
        .O({n22[3:1],NLW_n22__1_carry_O_UNCONNECTED[0]}),
        .S({n22__1_carry_i_2_n_0,n22__1_carry_i_3_n_0,n22__1_carry_i_4_n_0,1'b0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n22__1_carry__0
       (.CI(n22__1_carry_n_0),
        .CO({n22__1_carry__0_n_0,n22__1_carry__0_n_1,n22__1_carry__0_n_2,n22__1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({n22__1_carry__0_i_1_n_0,n22__1_carry__0_i_2_n_0,n22__1_carry__0_i_3_n_0,n22__1_carry__0_i_4_n_0}),
        .O(n22[7:4]),
        .S({n22__1_carry__0_i_5_n_0,n22__1_carry__0_i_6_n_0,n22__1_carry__0_i_7_n_0,n22__1_carry__0_i_8_n_0}));
  (* HLUTNM = "lutpair1" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__0_i_1
       (.I0(n221[6]),
        .I1(n220[6]),
        .I2(n2210_in[6]),
        .O(n22__1_carry__0_i_1_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__0_i_2
       (.I0(n221[5]),
        .I1(n220[5]),
        .I2(n2210_in[5]),
        .O(n22__1_carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__0_i_3
       (.I0(n221[4]),
        .I1(n220[4]),
        .I2(n2210_in[4]),
        .O(n22__1_carry__0_i_3_n_0));
  (* HLUTNM = "lutpair0" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__0_i_4
       (.I0(n221[3]),
        .I1(n220[3]),
        .I2(n2210_in[3]),
        .O(n22__1_carry__0_i_4_n_0));
  (* HLUTNM = "lutpair2" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__0_i_5
       (.I0(n221[7]),
        .I1(n220[7]),
        .I2(n2210_in[7]),
        .I3(n22__1_carry__0_i_1_n_0),
        .O(n22__1_carry__0_i_5_n_0));
  (* HLUTNM = "lutpair1" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__0_i_6
       (.I0(n221[6]),
        .I1(n220[6]),
        .I2(n2210_in[6]),
        .I3(n22__1_carry__0_i_2_n_0),
        .O(n22__1_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__0_i_7
       (.I0(n221[5]),
        .I1(n220[5]),
        .I2(n2210_in[5]),
        .I3(n22__1_carry__0_i_3_n_0),
        .O(n22__1_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__0_i_8
       (.I0(n221[4]),
        .I1(n220[4]),
        .I2(n2210_in[4]),
        .I3(n22__1_carry__0_i_4_n_0),
        .O(n22__1_carry__0_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n22__1_carry__1
       (.CI(n22__1_carry__0_n_0),
        .CO({n22__1_carry__1_n_0,n22__1_carry__1_n_1,n22__1_carry__1_n_2,n22__1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({n22__1_carry__1_i_1_n_0,n22__1_carry__1_i_2_n_0,n22__1_carry__1_i_3_n_0,n22__1_carry__1_i_4_n_0}),
        .O(n22[11:8]),
        .S({n22__1_carry__1_i_5_n_0,n22__1_carry__1_i_6_n_0,n22__1_carry__1_i_7_n_0,n22__1_carry__1_i_8_n_0}));
  (* HLUTNM = "lutpair5" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__1_i_1
       (.I0(n221[10]),
        .I1(n220[10]),
        .I2(n2210_in[10]),
        .O(n22__1_carry__1_i_1_n_0));
  (* HLUTNM = "lutpair4" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__1_i_2
       (.I0(n221[9]),
        .I1(n220[9]),
        .I2(n2210_in[9]),
        .O(n22__1_carry__1_i_2_n_0));
  (* HLUTNM = "lutpair3" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__1_i_3
       (.I0(n221[8]),
        .I1(n220[8]),
        .I2(n2210_in[8]),
        .O(n22__1_carry__1_i_3_n_0));
  (* HLUTNM = "lutpair2" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__1_i_4
       (.I0(n221[7]),
        .I1(n220[7]),
        .I2(n2210_in[7]),
        .O(n22__1_carry__1_i_4_n_0));
  (* HLUTNM = "lutpair6" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__1_i_5
       (.I0(n221[11]),
        .I1(n220[11]),
        .I2(n2210_in[11]),
        .I3(n22__1_carry__1_i_1_n_0),
        .O(n22__1_carry__1_i_5_n_0));
  (* HLUTNM = "lutpair5" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__1_i_6
       (.I0(n221[10]),
        .I1(n220[10]),
        .I2(n2210_in[10]),
        .I3(n22__1_carry__1_i_2_n_0),
        .O(n22__1_carry__1_i_6_n_0));
  (* HLUTNM = "lutpair4" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__1_i_7
       (.I0(n221[9]),
        .I1(n220[9]),
        .I2(n2210_in[9]),
        .I3(n22__1_carry__1_i_3_n_0),
        .O(n22__1_carry__1_i_7_n_0));
  (* HLUTNM = "lutpair3" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__1_i_8
       (.I0(n221[8]),
        .I1(n220[8]),
        .I2(n2210_in[8]),
        .I3(n22__1_carry__1_i_4_n_0),
        .O(n22__1_carry__1_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n22__1_carry__2
       (.CI(n22__1_carry__1_n_0),
        .CO({n22__1_carry__2_n_0,n22__1_carry__2_n_1,n22__1_carry__2_n_2,n22__1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({n22__1_carry__2_i_1_n_0,n22__1_carry__2_i_2_n_0,n22__1_carry__2_i_3_n_0,n22__1_carry__2_i_4_n_0}),
        .O(n22[15:12]),
        .S({n22__1_carry__2_i_5_n_0,n22__1_carry__2_i_6_n_0,n22__1_carry__2_i_7_n_0,n22__1_carry__2_i_8_n_0}));
  (* HLUTNM = "lutpair9" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__2_i_1
       (.I0(n221[14]),
        .I1(n220[14]),
        .I2(n2210_in[14]),
        .O(n22__1_carry__2_i_1_n_0));
  (* HLUTNM = "lutpair8" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__2_i_2
       (.I0(n221[13]),
        .I1(n220[13]),
        .I2(n2210_in[13]),
        .O(n22__1_carry__2_i_2_n_0));
  (* HLUTNM = "lutpair7" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__2_i_3
       (.I0(n221[12]),
        .I1(n220[12]),
        .I2(n2210_in[12]),
        .O(n22__1_carry__2_i_3_n_0));
  (* HLUTNM = "lutpair6" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__2_i_4
       (.I0(n221[11]),
        .I1(n220[11]),
        .I2(n2210_in[11]),
        .O(n22__1_carry__2_i_4_n_0));
  (* HLUTNM = "lutpair10" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__2_i_5
       (.I0(n221[15]),
        .I1(n220[15]),
        .I2(n2210_in[15]),
        .I3(n22__1_carry__2_i_1_n_0),
        .O(n22__1_carry__2_i_5_n_0));
  (* HLUTNM = "lutpair9" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__2_i_6
       (.I0(n221[14]),
        .I1(n220[14]),
        .I2(n2210_in[14]),
        .I3(n22__1_carry__2_i_2_n_0),
        .O(n22__1_carry__2_i_6_n_0));
  (* HLUTNM = "lutpair8" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__2_i_7
       (.I0(n221[13]),
        .I1(n220[13]),
        .I2(n2210_in[13]),
        .I3(n22__1_carry__2_i_3_n_0),
        .O(n22__1_carry__2_i_7_n_0));
  (* HLUTNM = "lutpair7" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__2_i_8
       (.I0(n221[12]),
        .I1(n220[12]),
        .I2(n2210_in[12]),
        .I3(n22__1_carry__2_i_4_n_0),
        .O(n22__1_carry__2_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n22__1_carry__3
       (.CI(n22__1_carry__2_n_0),
        .CO({n22__1_carry__3_n_0,n22__1_carry__3_n_1,n22__1_carry__3_n_2,n22__1_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({n22__1_carry__3_i_1_n_0,n22__1_carry__3_i_2_n_0,n22__1_carry__3_i_3_n_0,n22__1_carry__3_i_4_n_0}),
        .O(n22[19:16]),
        .S({n22__1_carry__3_i_5_n_0,n22__1_carry__3_i_6_n_0,n22__1_carry__3_i_7_n_0,n22__1_carry__3_i_8_n_0}));
  (* HLUTNM = "lutpair13" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__3_i_1
       (.I0(n221[18]),
        .I1(n220[18]),
        .I2(n2210_in[18]),
        .O(n22__1_carry__3_i_1_n_0));
  (* HLUTNM = "lutpair12" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__3_i_2
       (.I0(n221[17]),
        .I1(n220[17]),
        .I2(n2210_in[17]),
        .O(n22__1_carry__3_i_2_n_0));
  (* HLUTNM = "lutpair11" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__3_i_3
       (.I0(n221[16]),
        .I1(n220[16]),
        .I2(n2210_in[16]),
        .O(n22__1_carry__3_i_3_n_0));
  (* HLUTNM = "lutpair10" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__3_i_4
       (.I0(n221[15]),
        .I1(n220[15]),
        .I2(n2210_in[15]),
        .O(n22__1_carry__3_i_4_n_0));
  (* HLUTNM = "lutpair14" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__3_i_5
       (.I0(n221[19]),
        .I1(n220[19]),
        .I2(n2210_in[19]),
        .I3(n22__1_carry__3_i_1_n_0),
        .O(n22__1_carry__3_i_5_n_0));
  (* HLUTNM = "lutpair13" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__3_i_6
       (.I0(n221[18]),
        .I1(n220[18]),
        .I2(n2210_in[18]),
        .I3(n22__1_carry__3_i_2_n_0),
        .O(n22__1_carry__3_i_6_n_0));
  (* HLUTNM = "lutpair12" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__3_i_7
       (.I0(n221[17]),
        .I1(n220[17]),
        .I2(n2210_in[17]),
        .I3(n22__1_carry__3_i_3_n_0),
        .O(n22__1_carry__3_i_7_n_0));
  (* HLUTNM = "lutpair11" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__3_i_8
       (.I0(n221[16]),
        .I1(n220[16]),
        .I2(n2210_in[16]),
        .I3(n22__1_carry__3_i_4_n_0),
        .O(n22__1_carry__3_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n22__1_carry__4
       (.CI(n22__1_carry__3_n_0),
        .CO({n22__1_carry__4_n_0,n22__1_carry__4_n_1,n22__1_carry__4_n_2,n22__1_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({n22__1_carry__4_i_1_n_0,n22__1_carry__4_i_2_n_0,n22__1_carry__4_i_3_n_0,n22__1_carry__4_i_4_n_0}),
        .O(n22[23:20]),
        .S({n22__1_carry__4_i_5_n_0,n22__1_carry__4_i_6_n_0,n22__1_carry__4_i_7_n_0,n22__1_carry__4_i_8_n_0}));
  (* HLUTNM = "lutpair17" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__4_i_1
       (.I0(n221[22]),
        .I1(n220[22]),
        .I2(n2210_in[22]),
        .O(n22__1_carry__4_i_1_n_0));
  (* HLUTNM = "lutpair16" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__4_i_2
       (.I0(n221[21]),
        .I1(n220[21]),
        .I2(n2210_in[21]),
        .O(n22__1_carry__4_i_2_n_0));
  (* HLUTNM = "lutpair15" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__4_i_3
       (.I0(n221[20]),
        .I1(n220[20]),
        .I2(n2210_in[20]),
        .O(n22__1_carry__4_i_3_n_0));
  (* HLUTNM = "lutpair14" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__4_i_4
       (.I0(n221[19]),
        .I1(n220[19]),
        .I2(n2210_in[19]),
        .O(n22__1_carry__4_i_4_n_0));
  (* HLUTNM = "lutpair18" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__4_i_5
       (.I0(n221[23]),
        .I1(n220[23]),
        .I2(n2210_in[23]),
        .I3(n22__1_carry__4_i_1_n_0),
        .O(n22__1_carry__4_i_5_n_0));
  (* HLUTNM = "lutpair17" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__4_i_6
       (.I0(n221[22]),
        .I1(n220[22]),
        .I2(n2210_in[22]),
        .I3(n22__1_carry__4_i_2_n_0),
        .O(n22__1_carry__4_i_6_n_0));
  (* HLUTNM = "lutpair16" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__4_i_7
       (.I0(n221[21]),
        .I1(n220[21]),
        .I2(n2210_in[21]),
        .I3(n22__1_carry__4_i_3_n_0),
        .O(n22__1_carry__4_i_7_n_0));
  (* HLUTNM = "lutpair15" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__4_i_8
       (.I0(n221[20]),
        .I1(n220[20]),
        .I2(n2210_in[20]),
        .I3(n22__1_carry__4_i_4_n_0),
        .O(n22__1_carry__4_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n22__1_carry__5
       (.CI(n22__1_carry__4_n_0),
        .CO({n22__1_carry__5_n_0,n22__1_carry__5_n_1,n22__1_carry__5_n_2,n22__1_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({n22__1_carry__5_i_1_n_0,n22__1_carry__5_i_2_n_0,n22__1_carry__5_i_3_n_0,n22__1_carry__5_i_4_n_0}),
        .O(n22[27:24]),
        .S({n22__1_carry__5_i_5_n_0,n22__1_carry__5_i_6_n_0,n22__1_carry__5_i_7_n_0,n22__1_carry__5_i_8_n_0}));
  (* HLUTNM = "lutpair21" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__5_i_1
       (.I0(n221[26]),
        .I1(n220[26]),
        .I2(n2210_in[26]),
        .O(n22__1_carry__5_i_1_n_0));
  (* HLUTNM = "lutpair20" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__5_i_2
       (.I0(n221[25]),
        .I1(n220[25]),
        .I2(n2210_in[25]),
        .O(n22__1_carry__5_i_2_n_0));
  (* HLUTNM = "lutpair19" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__5_i_3
       (.I0(n221[24]),
        .I1(n220[24]),
        .I2(n2210_in[24]),
        .O(n22__1_carry__5_i_3_n_0));
  (* HLUTNM = "lutpair18" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__5_i_4
       (.I0(n221[23]),
        .I1(n220[23]),
        .I2(n2210_in[23]),
        .O(n22__1_carry__5_i_4_n_0));
  (* HLUTNM = "lutpair22" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__5_i_5
       (.I0(n221[27]),
        .I1(n220[27]),
        .I2(n2210_in[27]),
        .I3(n22__1_carry__5_i_1_n_0),
        .O(n22__1_carry__5_i_5_n_0));
  (* HLUTNM = "lutpair21" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__5_i_6
       (.I0(n221[26]),
        .I1(n220[26]),
        .I2(n2210_in[26]),
        .I3(n22__1_carry__5_i_2_n_0),
        .O(n22__1_carry__5_i_6_n_0));
  (* HLUTNM = "lutpair20" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__5_i_7
       (.I0(n221[25]),
        .I1(n220[25]),
        .I2(n2210_in[25]),
        .I3(n22__1_carry__5_i_3_n_0),
        .O(n22__1_carry__5_i_7_n_0));
  (* HLUTNM = "lutpair19" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__5_i_8
       (.I0(n221[24]),
        .I1(n220[24]),
        .I2(n2210_in[24]),
        .I3(n22__1_carry__5_i_4_n_0),
        .O(n22__1_carry__5_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n22__1_carry__6
       (.CI(n22__1_carry__5_n_0),
        .CO({NLW_n22__1_carry__6_CO_UNCONNECTED[3],n22__1_carry__6_n_1,n22__1_carry__6_n_2,n22__1_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,n22__1_carry__6_i_1_n_0,n22__1_carry__6_i_2_n_0,n22__1_carry__6_i_3_n_0}),
        .O(n22[31:28]),
        .S({n22__1_carry__6_i_4_n_0,n22__1_carry__6_i_5_n_0,n22__1_carry__6_i_6_n_0,n22__1_carry__6_i_7_n_0}));
  (* HLUTNM = "lutpair24" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__6_i_1
       (.I0(n221[29]),
        .I1(n220[29]),
        .I2(n2210_in[29]),
        .O(n22__1_carry__6_i_1_n_0));
  (* HLUTNM = "lutpair23" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__6_i_2
       (.I0(n221[28]),
        .I1(n220[28]),
        .I2(n2210_in[28]),
        .O(n22__1_carry__6_i_2_n_0));
  (* HLUTNM = "lutpair22" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n22__1_carry__6_i_3
       (.I0(n221[27]),
        .I1(n220[27]),
        .I2(n2210_in[27]),
        .O(n22__1_carry__6_i_3_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    n22__1_carry__6_i_4
       (.I0(n2210_in[30]),
        .I1(n220[30]),
        .I2(n221[30]),
        .I3(n220[31]),
        .I4(n221[31]),
        .I5(n2210_in[31]),
        .O(n22__1_carry__6_i_4_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__6_i_5
       (.I0(n22__1_carry__6_i_1_n_0),
        .I1(n220[30]),
        .I2(n221[30]),
        .I3(n2210_in[30]),
        .O(n22__1_carry__6_i_5_n_0));
  (* HLUTNM = "lutpair24" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__6_i_6
       (.I0(n221[29]),
        .I1(n220[29]),
        .I2(n2210_in[29]),
        .I3(n22__1_carry__6_i_2_n_0),
        .O(n22__1_carry__6_i_6_n_0));
  (* HLUTNM = "lutpair23" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n22__1_carry__6_i_7
       (.I0(n221[28]),
        .I1(n220[28]),
        .I2(n2210_in[28]),
        .I3(n22__1_carry__6_i_3_n_0),
        .O(n22__1_carry__6_i_7_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n22__1_carry_i_1
       (.I0(n2210_in[3]),
        .I1(n221[3]),
        .I2(n220[3]),
        .O(n22__1_carry_i_1_n_0));
  (* HLUTNM = "lutpair0" *) 
  LUT5 #(
    .INIT(32'h69969696)) 
    n22__1_carry_i_2
       (.I0(n221[3]),
        .I1(n220[3]),
        .I2(n2210_in[3]),
        .I3(n220[2]),
        .I4(n221[2]),
        .O(n22__1_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n22__1_carry_i_3
       (.I0(n221[2]),
        .I1(n220[2]),
        .I2(n2210_in[2]),
        .O(n22__1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    n22__1_carry_i_4
       (.I0(n2210_in[1]),
        .I1(n220[1]),
        .O(n22__1_carry_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n310_carry
       (.CI(1'b0),
        .CO({n310_carry_n_0,n310_carry_n_1,n310_carry_n_2,n310_carry_n_3}),
        .CYINIT(1'b0),
        .DI({n22[1],1'b0,1'b0,1'b1}),
        .O({n310[3:1],NLW_n310_carry_O_UNCONNECTED[0]}),
        .S({n310_carry_i_1_n_0,n310_carry_i_2_n_0,n310_carry_i_3_n_0,1'b0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n310_carry__0
       (.CI(n310_carry_n_0),
        .CO({n310_carry__0_n_0,n310_carry__0_n_1,n310_carry__0_n_2,n310_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(n22[5:2]),
        .O(n310[7:4]),
        .S({n310_carry__0_i_1_n_0,n310_carry__0_i_2_n_0,n310_carry__0_i_3_n_0,n310_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__0_i_1
       (.I0(n22[5]),
        .I1(n22[7]),
        .O(n310_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__0_i_2
       (.I0(n22[4]),
        .I1(n22[6]),
        .O(n310_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__0_i_3
       (.I0(n22[3]),
        .I1(n22[5]),
        .O(n310_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__0_i_4
       (.I0(n22[2]),
        .I1(n22[4]),
        .O(n310_carry__0_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n310_carry__1
       (.CI(n310_carry__0_n_0),
        .CO({n310_carry__1_n_0,n310_carry__1_n_1,n310_carry__1_n_2,n310_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(n22[9:6]),
        .O(n310[11:8]),
        .S({n310_carry__1_i_1_n_0,n310_carry__1_i_2_n_0,n310_carry__1_i_3_n_0,n310_carry__1_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__1_i_1
       (.I0(n22[9]),
        .I1(n22[11]),
        .O(n310_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__1_i_2
       (.I0(n22[8]),
        .I1(n22[10]),
        .O(n310_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__1_i_3
       (.I0(n22[7]),
        .I1(n22[9]),
        .O(n310_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__1_i_4
       (.I0(n22[6]),
        .I1(n22[8]),
        .O(n310_carry__1_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n310_carry__2
       (.CI(n310_carry__1_n_0),
        .CO({n310_carry__2_n_0,n310_carry__2_n_1,n310_carry__2_n_2,n310_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(n22[13:10]),
        .O(n310[15:12]),
        .S({n310_carry__2_i_1_n_0,n310_carry__2_i_2_n_0,n310_carry__2_i_3_n_0,n310_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__2_i_1
       (.I0(n22[13]),
        .I1(n22[15]),
        .O(n310_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__2_i_2
       (.I0(n22[12]),
        .I1(n22[14]),
        .O(n310_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__2_i_3
       (.I0(n22[11]),
        .I1(n22[13]),
        .O(n310_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__2_i_4
       (.I0(n22[10]),
        .I1(n22[12]),
        .O(n310_carry__2_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n310_carry__3
       (.CI(n310_carry__2_n_0),
        .CO({n310_carry__3_n_0,n310_carry__3_n_1,n310_carry__3_n_2,n310_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(n22[17:14]),
        .O(n310[19:16]),
        .S({n310_carry__3_i_1_n_0,n310_carry__3_i_2_n_0,n310_carry__3_i_3_n_0,n310_carry__3_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__3_i_1
       (.I0(n22[17]),
        .I1(n22[19]),
        .O(n310_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__3_i_2
       (.I0(n22[16]),
        .I1(n22[18]),
        .O(n310_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__3_i_3
       (.I0(n22[15]),
        .I1(n22[17]),
        .O(n310_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__3_i_4
       (.I0(n22[14]),
        .I1(n22[16]),
        .O(n310_carry__3_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n310_carry__4
       (.CI(n310_carry__3_n_0),
        .CO({n310_carry__4_n_0,n310_carry__4_n_1,n310_carry__4_n_2,n310_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(n22[21:18]),
        .O(n310[23:20]),
        .S({n310_carry__4_i_1_n_0,n310_carry__4_i_2_n_0,n310_carry__4_i_3_n_0,n310_carry__4_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__4_i_1
       (.I0(n22[21]),
        .I1(n22[23]),
        .O(n310_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__4_i_2
       (.I0(n22[20]),
        .I1(n22[22]),
        .O(n310_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__4_i_3
       (.I0(n22[19]),
        .I1(n22[21]),
        .O(n310_carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__4_i_4
       (.I0(n22[18]),
        .I1(n22[20]),
        .O(n310_carry__4_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n310_carry__5
       (.CI(n310_carry__4_n_0),
        .CO({n310_carry__5_n_0,n310_carry__5_n_1,n310_carry__5_n_2,n310_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI(n22[25:22]),
        .O(n310[27:24]),
        .S({n310_carry__5_i_1_n_0,n310_carry__5_i_2_n_0,n310_carry__5_i_3_n_0,n310_carry__5_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__5_i_1
       (.I0(n22[25]),
        .I1(n22[27]),
        .O(n310_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__5_i_2
       (.I0(n22[24]),
        .I1(n22[26]),
        .O(n310_carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__5_i_3
       (.I0(n22[23]),
        .I1(n22[25]),
        .O(n310_carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__5_i_4
       (.I0(n22[22]),
        .I1(n22[24]),
        .O(n310_carry__5_i_4_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n310_carry__6
       (.CI(n310_carry__5_n_0),
        .CO({NLW_n310_carry__6_CO_UNCONNECTED[3],n310_carry__6_n_1,n310_carry__6_n_2,n310_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,n22[28:26]}),
        .O(n310[31:28]),
        .S({n310_carry__6_i_1_n_0,n310_carry__6_i_2_n_0,n310_carry__6_i_3_n_0,n310_carry__6_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__6_i_1
       (.I0(n22[29]),
        .I1(n22[31]),
        .O(n310_carry__6_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__6_i_2
       (.I0(n22[28]),
        .I1(n22[30]),
        .O(n310_carry__6_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__6_i_3
       (.I0(n22[27]),
        .I1(n22[29]),
        .O(n310_carry__6_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry__6_i_4
       (.I0(n22[26]),
        .I1(n22[28]),
        .O(n310_carry__6_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    n310_carry_i_1
       (.I0(n22[1]),
        .I1(n22[3]),
        .O(n310_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    n310_carry_i_2
       (.I0(n22[2]),
        .O(n310_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    n310_carry_i_3
       (.I0(n22[1]),
        .O(n310_carry_i_3_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n31__0_carry
       (.CI(1'b0),
        .CO({n31__0_carry_n_0,n31__0_carry_n_1,n31__0_carry_n_2,n31__0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({n31__0_carry_i_1_n_0,n31__0_carry_i_2_n_0,n31__0_carry_i_3_n_0,1'b0}),
        .O(\n12_reg[27]_0 [4:1]),
        .S({n31__0_carry_i_4_n_0,n31__0_carry_i_5_n_0,n31__0_carry_i_6_n_0,n31__0_carry_i_7_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n31__0_carry__0
       (.CI(n31__0_carry_n_0),
        .CO({n31__0_carry__0_n_0,n31__0_carry__0_n_1,n31__0_carry__0_n_2,n31__0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({n31__0_carry__0_i_1_n_0,n31__0_carry__0_i_2_n_0,n31__0_carry__0_i_3_n_0,n31__0_carry__0_i_4_n_0}),
        .O(\n12_reg[27]_0 [8:5]),
        .S({n31__0_carry__0_i_5_n_0,n31__0_carry__0_i_6_n_0,n31__0_carry__0_i_7_n_0,n31__0_carry__0_i_8_n_0}));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__0_i_1
       (.I0(n2111_in[7]),
        .I1(n31__0_carry__0_i_9_n_0),
        .I2(n310[6]),
        .I3(n210__0[6]),
        .I4(n221[7]),
        .O(n31__0_carry__0_i_1_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__0_i_10
       (.I0(n310[6]),
        .I1(n221[7]),
        .I2(n210__0[6]),
        .O(n31__0_carry__0_i_10_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__0_i_11
       (.I0(n310[5]),
        .I1(n221[6]),
        .I2(n210__0[5]),
        .O(n31__0_carry__0_i_11_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__0_i_12
       (.I0(n310[8]),
        .I1(n221[9]),
        .I2(n210__0[8]),
        .O(n31__0_carry__0_i_12_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__0_i_2
       (.I0(n2111_in[6]),
        .I1(n31__0_carry__0_i_10_n_0),
        .I2(n310[5]),
        .I3(n210__0[5]),
        .I4(n221[6]),
        .O(n31__0_carry__0_i_2_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__0_i_3
       (.I0(n2111_in[5]),
        .I1(n31__0_carry__0_i_11_n_0),
        .I2(n310[4]),
        .I3(n210__0[4]),
        .I4(n221[5]),
        .O(n31__0_carry__0_i_3_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__0_i_4
       (.I0(n2111_in[4]),
        .I1(n31__0_carry_i_10_n_0),
        .I2(n310[3]),
        .I3(n210__0[3]),
        .I4(n221[4]),
        .O(n31__0_carry__0_i_4_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__0_i_5
       (.I0(n31__0_carry__0_i_1_n_0),
        .I1(n31__0_carry__0_i_12_n_0),
        .I2(n2111_in[8]),
        .I3(n221[8]),
        .I4(n210__0[7]),
        .I5(n310[7]),
        .O(n31__0_carry__0_i_5_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__0_i_6
       (.I0(n31__0_carry__0_i_2_n_0),
        .I1(n31__0_carry__0_i_9_n_0),
        .I2(n2111_in[7]),
        .I3(n221[7]),
        .I4(n210__0[6]),
        .I5(n310[6]),
        .O(n31__0_carry__0_i_6_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__0_i_7
       (.I0(n31__0_carry__0_i_3_n_0),
        .I1(n31__0_carry__0_i_10_n_0),
        .I2(n2111_in[6]),
        .I3(n221[6]),
        .I4(n210__0[5]),
        .I5(n310[5]),
        .O(n31__0_carry__0_i_7_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__0_i_8
       (.I0(n31__0_carry__0_i_4_n_0),
        .I1(n31__0_carry__0_i_11_n_0),
        .I2(n2111_in[5]),
        .I3(n221[5]),
        .I4(n210__0[4]),
        .I5(n310[4]),
        .O(n31__0_carry__0_i_8_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__0_i_9
       (.I0(n310[7]),
        .I1(n221[8]),
        .I2(n210__0[7]),
        .O(n31__0_carry__0_i_9_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n31__0_carry__1
       (.CI(n31__0_carry__0_n_0),
        .CO({n31__0_carry__1_n_0,n31__0_carry__1_n_1,n31__0_carry__1_n_2,n31__0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({n31__0_carry__1_i_1_n_0,n31__0_carry__1_i_2_n_0,n31__0_carry__1_i_3_n_0,n31__0_carry__1_i_4_n_0}),
        .O(\n12_reg[27]_0 [12:9]),
        .S({n31__0_carry__1_i_5_n_0,n31__0_carry__1_i_6_n_0,n31__0_carry__1_i_7_n_0,n31__0_carry__1_i_8_n_0}));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__1_i_1
       (.I0(n2111_in[11]),
        .I1(n31__0_carry__1_i_9_n_0),
        .I2(n310[10]),
        .I3(n210__0[10]),
        .I4(n221[11]),
        .O(n31__0_carry__1_i_1_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__1_i_10
       (.I0(n310[10]),
        .I1(n221[11]),
        .I2(n210__0[10]),
        .O(n31__0_carry__1_i_10_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__1_i_11
       (.I0(n310[9]),
        .I1(n221[10]),
        .I2(n210__0[9]),
        .O(n31__0_carry__1_i_11_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__1_i_12
       (.I0(n310[12]),
        .I1(n221[13]),
        .I2(n210__0[12]),
        .O(n31__0_carry__1_i_12_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__1_i_2
       (.I0(n2111_in[10]),
        .I1(n31__0_carry__1_i_10_n_0),
        .I2(n310[9]),
        .I3(n210__0[9]),
        .I4(n221[10]),
        .O(n31__0_carry__1_i_2_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__1_i_3
       (.I0(n2111_in[9]),
        .I1(n31__0_carry__1_i_11_n_0),
        .I2(n310[8]),
        .I3(n210__0[8]),
        .I4(n221[9]),
        .O(n31__0_carry__1_i_3_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__1_i_4
       (.I0(n2111_in[8]),
        .I1(n31__0_carry__0_i_12_n_0),
        .I2(n310[7]),
        .I3(n210__0[7]),
        .I4(n221[8]),
        .O(n31__0_carry__1_i_4_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__1_i_5
       (.I0(n31__0_carry__1_i_1_n_0),
        .I1(n31__0_carry__1_i_12_n_0),
        .I2(n2111_in[12]),
        .I3(n221[12]),
        .I4(n210__0[11]),
        .I5(n310[11]),
        .O(n31__0_carry__1_i_5_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__1_i_6
       (.I0(n31__0_carry__1_i_2_n_0),
        .I1(n31__0_carry__1_i_9_n_0),
        .I2(n2111_in[11]),
        .I3(n221[11]),
        .I4(n210__0[10]),
        .I5(n310[10]),
        .O(n31__0_carry__1_i_6_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__1_i_7
       (.I0(n31__0_carry__1_i_3_n_0),
        .I1(n31__0_carry__1_i_10_n_0),
        .I2(n2111_in[10]),
        .I3(n221[10]),
        .I4(n210__0[9]),
        .I5(n310[9]),
        .O(n31__0_carry__1_i_7_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__1_i_8
       (.I0(n31__0_carry__1_i_4_n_0),
        .I1(n31__0_carry__1_i_11_n_0),
        .I2(n2111_in[9]),
        .I3(n221[9]),
        .I4(n210__0[8]),
        .I5(n310[8]),
        .O(n31__0_carry__1_i_8_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__1_i_9
       (.I0(n310[11]),
        .I1(n221[12]),
        .I2(n210__0[11]),
        .O(n31__0_carry__1_i_9_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n31__0_carry__2
       (.CI(n31__0_carry__1_n_0),
        .CO({n31__0_carry__2_n_0,n31__0_carry__2_n_1,n31__0_carry__2_n_2,n31__0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({n31__0_carry__2_i_1_n_0,n31__0_carry__2_i_2_n_0,n31__0_carry__2_i_3_n_0,n31__0_carry__2_i_4_n_0}),
        .O(\n12_reg[27]_0 [16:13]),
        .S({n31__0_carry__2_i_5_n_0,n31__0_carry__2_i_6_n_0,n31__0_carry__2_i_7_n_0,n31__0_carry__2_i_8_n_0}));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__2_i_1
       (.I0(n2111_in[15]),
        .I1(n31__0_carry__2_i_9_n_0),
        .I2(n310[14]),
        .I3(n210__0[14]),
        .I4(n221[15]),
        .O(n31__0_carry__2_i_1_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__2_i_10
       (.I0(n310[14]),
        .I1(n221[15]),
        .I2(n210__0[14]),
        .O(n31__0_carry__2_i_10_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__2_i_11
       (.I0(n310[13]),
        .I1(n221[14]),
        .I2(n210__0[13]),
        .O(n31__0_carry__2_i_11_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__2_i_12
       (.I0(n310[16]),
        .I1(n221[17]),
        .I2(n210__0[16]),
        .O(n31__0_carry__2_i_12_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__2_i_2
       (.I0(n2111_in[14]),
        .I1(n31__0_carry__2_i_10_n_0),
        .I2(n310[13]),
        .I3(n210__0[13]),
        .I4(n221[14]),
        .O(n31__0_carry__2_i_2_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__2_i_3
       (.I0(n2111_in[13]),
        .I1(n31__0_carry__2_i_11_n_0),
        .I2(n310[12]),
        .I3(n210__0[12]),
        .I4(n221[13]),
        .O(n31__0_carry__2_i_3_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__2_i_4
       (.I0(n2111_in[12]),
        .I1(n31__0_carry__1_i_12_n_0),
        .I2(n310[11]),
        .I3(n210__0[11]),
        .I4(n221[12]),
        .O(n31__0_carry__2_i_4_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__2_i_5
       (.I0(n31__0_carry__2_i_1_n_0),
        .I1(n31__0_carry__2_i_12_n_0),
        .I2(n2111_in[16]),
        .I3(n221[16]),
        .I4(n210__0[15]),
        .I5(n310[15]),
        .O(n31__0_carry__2_i_5_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__2_i_6
       (.I0(n31__0_carry__2_i_2_n_0),
        .I1(n31__0_carry__2_i_9_n_0),
        .I2(n2111_in[15]),
        .I3(n221[15]),
        .I4(n210__0[14]),
        .I5(n310[14]),
        .O(n31__0_carry__2_i_6_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__2_i_7
       (.I0(n31__0_carry__2_i_3_n_0),
        .I1(n31__0_carry__2_i_10_n_0),
        .I2(n2111_in[14]),
        .I3(n221[14]),
        .I4(n210__0[13]),
        .I5(n310[13]),
        .O(n31__0_carry__2_i_7_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__2_i_8
       (.I0(n31__0_carry__2_i_4_n_0),
        .I1(n31__0_carry__2_i_11_n_0),
        .I2(n2111_in[13]),
        .I3(n221[13]),
        .I4(n210__0[12]),
        .I5(n310[12]),
        .O(n31__0_carry__2_i_8_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__2_i_9
       (.I0(n310[15]),
        .I1(n221[16]),
        .I2(n210__0[15]),
        .O(n31__0_carry__2_i_9_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n31__0_carry__3
       (.CI(n31__0_carry__2_n_0),
        .CO({n31__0_carry__3_n_0,n31__0_carry__3_n_1,n31__0_carry__3_n_2,n31__0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({n31__0_carry__3_i_1_n_0,n31__0_carry__3_i_2_n_0,n31__0_carry__3_i_3_n_0,n31__0_carry__3_i_4_n_0}),
        .O(\n12_reg[27]_0 [20:17]),
        .S({n31__0_carry__3_i_5_n_0,n31__0_carry__3_i_6_n_0,n31__0_carry__3_i_7_n_0,n31__0_carry__3_i_8_n_0}));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__3_i_1
       (.I0(n2111_in[19]),
        .I1(n31__0_carry__3_i_9_n_0),
        .I2(n310[18]),
        .I3(n210__0[18]),
        .I4(n221[19]),
        .O(n31__0_carry__3_i_1_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__3_i_10
       (.I0(n310[18]),
        .I1(n221[19]),
        .I2(n210__0[18]),
        .O(n31__0_carry__3_i_10_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__3_i_11
       (.I0(n310[17]),
        .I1(n221[18]),
        .I2(n210__0[17]),
        .O(n31__0_carry__3_i_11_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__3_i_12
       (.I0(n310[20]),
        .I1(n221[21]),
        .I2(n210__0[20]),
        .O(n31__0_carry__3_i_12_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__3_i_2
       (.I0(n2111_in[18]),
        .I1(n31__0_carry__3_i_10_n_0),
        .I2(n310[17]),
        .I3(n210__0[17]),
        .I4(n221[18]),
        .O(n31__0_carry__3_i_2_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__3_i_3
       (.I0(n2111_in[17]),
        .I1(n31__0_carry__3_i_11_n_0),
        .I2(n310[16]),
        .I3(n210__0[16]),
        .I4(n221[17]),
        .O(n31__0_carry__3_i_3_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__3_i_4
       (.I0(n2111_in[16]),
        .I1(n31__0_carry__2_i_12_n_0),
        .I2(n310[15]),
        .I3(n210__0[15]),
        .I4(n221[16]),
        .O(n31__0_carry__3_i_4_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__3_i_5
       (.I0(n31__0_carry__3_i_1_n_0),
        .I1(n31__0_carry__3_i_12_n_0),
        .I2(n2111_in[20]),
        .I3(n221[20]),
        .I4(n210__0[19]),
        .I5(n310[19]),
        .O(n31__0_carry__3_i_5_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__3_i_6
       (.I0(n31__0_carry__3_i_2_n_0),
        .I1(n31__0_carry__3_i_9_n_0),
        .I2(n2111_in[19]),
        .I3(n221[19]),
        .I4(n210__0[18]),
        .I5(n310[18]),
        .O(n31__0_carry__3_i_6_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__3_i_7
       (.I0(n31__0_carry__3_i_3_n_0),
        .I1(n31__0_carry__3_i_10_n_0),
        .I2(n2111_in[18]),
        .I3(n221[18]),
        .I4(n210__0[17]),
        .I5(n310[17]),
        .O(n31__0_carry__3_i_7_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__3_i_8
       (.I0(n31__0_carry__3_i_4_n_0),
        .I1(n31__0_carry__3_i_11_n_0),
        .I2(n2111_in[17]),
        .I3(n221[17]),
        .I4(n210__0[16]),
        .I5(n310[16]),
        .O(n31__0_carry__3_i_8_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__3_i_9
       (.I0(n310[19]),
        .I1(n221[20]),
        .I2(n210__0[19]),
        .O(n31__0_carry__3_i_9_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n31__0_carry__4
       (.CI(n31__0_carry__3_n_0),
        .CO({n31__0_carry__4_n_0,n31__0_carry__4_n_1,n31__0_carry__4_n_2,n31__0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({n31__0_carry__4_i_1_n_0,n31__0_carry__4_i_2_n_0,n31__0_carry__4_i_3_n_0,n31__0_carry__4_i_4_n_0}),
        .O(\n12_reg[27]_0 [24:21]),
        .S({n31__0_carry__4_i_5_n_0,n31__0_carry__4_i_6_n_0,n31__0_carry__4_i_7_n_0,n31__0_carry__4_i_8_n_0}));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__4_i_1
       (.I0(n2111_in[23]),
        .I1(n31__0_carry__4_i_9_n_0),
        .I2(n310[22]),
        .I3(n210__0[22]),
        .I4(n221[23]),
        .O(n31__0_carry__4_i_1_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__4_i_10
       (.I0(n310[22]),
        .I1(n221[23]),
        .I2(n210__0[22]),
        .O(n31__0_carry__4_i_10_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__4_i_11
       (.I0(n310[21]),
        .I1(n221[22]),
        .I2(n210__0[21]),
        .O(n31__0_carry__4_i_11_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__4_i_12
       (.I0(n310[24]),
        .I1(n221[25]),
        .I2(n210__0[24]),
        .O(n31__0_carry__4_i_12_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__4_i_2
       (.I0(n2111_in[22]),
        .I1(n31__0_carry__4_i_10_n_0),
        .I2(n310[21]),
        .I3(n210__0[21]),
        .I4(n221[22]),
        .O(n31__0_carry__4_i_2_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__4_i_3
       (.I0(n2111_in[21]),
        .I1(n31__0_carry__4_i_11_n_0),
        .I2(n310[20]),
        .I3(n210__0[20]),
        .I4(n221[21]),
        .O(n31__0_carry__4_i_3_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__4_i_4
       (.I0(n2111_in[20]),
        .I1(n31__0_carry__3_i_12_n_0),
        .I2(n310[19]),
        .I3(n210__0[19]),
        .I4(n221[20]),
        .O(n31__0_carry__4_i_4_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__4_i_5
       (.I0(n31__0_carry__4_i_1_n_0),
        .I1(n31__0_carry__4_i_12_n_0),
        .I2(n2111_in[24]),
        .I3(n221[24]),
        .I4(n210__0[23]),
        .I5(n310[23]),
        .O(n31__0_carry__4_i_5_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__4_i_6
       (.I0(n31__0_carry__4_i_2_n_0),
        .I1(n31__0_carry__4_i_9_n_0),
        .I2(n2111_in[23]),
        .I3(n221[23]),
        .I4(n210__0[22]),
        .I5(n310[22]),
        .O(n31__0_carry__4_i_6_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__4_i_7
       (.I0(n31__0_carry__4_i_3_n_0),
        .I1(n31__0_carry__4_i_10_n_0),
        .I2(n2111_in[22]),
        .I3(n221[22]),
        .I4(n210__0[21]),
        .I5(n310[21]),
        .O(n31__0_carry__4_i_7_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__4_i_8
       (.I0(n31__0_carry__4_i_4_n_0),
        .I1(n31__0_carry__4_i_11_n_0),
        .I2(n2111_in[21]),
        .I3(n221[21]),
        .I4(n210__0[20]),
        .I5(n310[20]),
        .O(n31__0_carry__4_i_8_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__4_i_9
       (.I0(n310[23]),
        .I1(n221[24]),
        .I2(n210__0[23]),
        .O(n31__0_carry__4_i_9_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n31__0_carry__5
       (.CI(n31__0_carry__4_n_0),
        .CO({n31__0_carry__5_n_0,n31__0_carry__5_n_1,n31__0_carry__5_n_2,n31__0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({n31__0_carry__5_i_1_n_0,n31__0_carry__5_i_2_n_0,n31__0_carry__5_i_3_n_0,n31__0_carry__5_i_4_n_0}),
        .O(\n12_reg[27]_0 [28:25]),
        .S({n31__0_carry__5_i_5_n_0,n31__0_carry__5_i_6_n_0,n31__0_carry__5_i_7_n_0,n31__0_carry__5_i_8_n_0}));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__5_i_1
       (.I0(n2111_in[27]),
        .I1(n31__0_carry__5_i_9_n_0),
        .I2(n310[26]),
        .I3(n210__0[26]),
        .I4(n221[27]),
        .O(n31__0_carry__5_i_1_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__5_i_10
       (.I0(n310[26]),
        .I1(n221[27]),
        .I2(n210__0[26]),
        .O(n31__0_carry__5_i_10_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__5_i_11
       (.I0(n310[25]),
        .I1(n221[26]),
        .I2(n210__0[25]),
        .O(n31__0_carry__5_i_11_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__5_i_12
       (.I0(n310[28]),
        .I1(n221[29]),
        .I2(n210__0[28]),
        .O(n31__0_carry__5_i_12_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__5_i_2
       (.I0(n2111_in[26]),
        .I1(n31__0_carry__5_i_10_n_0),
        .I2(n310[25]),
        .I3(n210__0[25]),
        .I4(n221[26]),
        .O(n31__0_carry__5_i_2_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__5_i_3
       (.I0(n2111_in[25]),
        .I1(n31__0_carry__5_i_11_n_0),
        .I2(n310[24]),
        .I3(n210__0[24]),
        .I4(n221[25]),
        .O(n31__0_carry__5_i_3_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__5_i_4
       (.I0(n2111_in[24]),
        .I1(n31__0_carry__4_i_12_n_0),
        .I2(n310[23]),
        .I3(n210__0[23]),
        .I4(n221[24]),
        .O(n31__0_carry__5_i_4_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__5_i_5
       (.I0(n31__0_carry__5_i_1_n_0),
        .I1(n31__0_carry__5_i_12_n_0),
        .I2(n2111_in[28]),
        .I3(n221[28]),
        .I4(n210__0[27]),
        .I5(n310[27]),
        .O(n31__0_carry__5_i_5_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__5_i_6
       (.I0(n31__0_carry__5_i_2_n_0),
        .I1(n31__0_carry__5_i_9_n_0),
        .I2(n2111_in[27]),
        .I3(n221[27]),
        .I4(n210__0[26]),
        .I5(n310[26]),
        .O(n31__0_carry__5_i_6_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__5_i_7
       (.I0(n31__0_carry__5_i_3_n_0),
        .I1(n31__0_carry__5_i_10_n_0),
        .I2(n2111_in[26]),
        .I3(n221[26]),
        .I4(n210__0[25]),
        .I5(n310[25]),
        .O(n31__0_carry__5_i_7_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__5_i_8
       (.I0(n31__0_carry__5_i_4_n_0),
        .I1(n31__0_carry__5_i_11_n_0),
        .I2(n2111_in[25]),
        .I3(n221[25]),
        .I4(n210__0[24]),
        .I5(n310[24]),
        .O(n31__0_carry__5_i_8_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__5_i_9
       (.I0(n310[27]),
        .I1(n221[28]),
        .I2(n210__0[27]),
        .O(n31__0_carry__5_i_9_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 n31__0_carry__6
       (.CI(n31__0_carry__5_n_0),
        .CO({NLW_n31__0_carry__6_CO_UNCONNECTED[3:2],n31__0_carry__6_n_2,n31__0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,n31__0_carry__6_i_1_n_0,n31__0_carry__6_i_2_n_0}),
        .O({NLW_n31__0_carry__6_O_UNCONNECTED[3],\n12_reg[27]_0 [31:29]}),
        .S({1'b0,n31__0_carry__6_i_3_n_0,n31__0_carry__6_i_4_n_0,n31__0_carry__6_i_5_n_0}));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__6_i_1
       (.I0(n2111_in[29]),
        .I1(n31__0_carry__6_i_6_n_0),
        .I2(n310[28]),
        .I3(n210__0[28]),
        .I4(n221[29]),
        .O(n31__0_carry__6_i_1_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry__6_i_2
       (.I0(n2111_in[28]),
        .I1(n31__0_carry__5_i_12_n_0),
        .I2(n310[27]),
        .I3(n210__0[27]),
        .I4(n221[28]),
        .O(n31__0_carry__6_i_2_n_0));
  LUT6 #(
    .INIT(64'hE187871E871E1E78)) 
    n31__0_carry__6_i_3
       (.I0(n31__0_carry__6_i_7_n_0),
        .I1(n2111_in[30]),
        .I2(n31__0_carry__6_i_8_n_0),
        .I3(n221[31]),
        .I4(n210__0[30]),
        .I5(n310[30]),
        .O(n31__0_carry__6_i_3_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__6_i_4
       (.I0(n31__0_carry__6_i_1_n_0),
        .I1(n31__0_carry__6_i_9_n_0),
        .I2(n2111_in[30]),
        .I3(n221[30]),
        .I4(n210__0[29]),
        .I5(n310[29]),
        .O(n31__0_carry__6_i_4_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry__6_i_5
       (.I0(n31__0_carry__6_i_2_n_0),
        .I1(n31__0_carry__6_i_6_n_0),
        .I2(n2111_in[29]),
        .I3(n221[29]),
        .I4(n210__0[28]),
        .I5(n310[28]),
        .O(n31__0_carry__6_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__6_i_6
       (.I0(n310[29]),
        .I1(n221[30]),
        .I2(n210__0[29]),
        .O(n31__0_carry__6_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    n31__0_carry__6_i_7
       (.I0(n221[30]),
        .I1(n210__0[29]),
        .I2(n310[29]),
        .O(n31__0_carry__6_i_7_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    n31__0_carry__6_i_8
       (.I0(n210__0[31]),
        .I1(\n12_reg_n_0_[30] ),
        .I2(n310[31]),
        .I3(n2111_in[31]),
        .O(n31__0_carry__6_i_8_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry__6_i_9
       (.I0(n310[30]),
        .I1(n221[31]),
        .I2(n210__0[30]),
        .O(n31__0_carry__6_i_9_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry_i_1
       (.I0(n2111_in[3]),
        .I1(n31__0_carry_i_8_n_0),
        .I2(n310[2]),
        .I3(n210__0[2]),
        .I4(n221[3]),
        .O(n31__0_carry_i_1_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry_i_10
       (.I0(n310[4]),
        .I1(n221[5]),
        .I2(n210__0[4]),
        .O(n31__0_carry_i_10_n_0));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    n31__0_carry_i_2
       (.I0(n2111_in[2]),
        .I1(n31__0_carry_i_9_n_0),
        .I2(n310[1]),
        .I3(n210__0[1]),
        .I4(n221[2]),
        .O(n31__0_carry_i_2_n_0));
  (* HLUTNM = "lutpair25" *) 
  LUT4 #(
    .INIT(16'h8228)) 
    n31__0_carry_i_3
       (.I0(n2111_in[1]),
        .I1(n210__0[1]),
        .I2(n221[2]),
        .I3(n310[1]),
        .O(n31__0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry_i_4
       (.I0(n31__0_carry_i_1_n_0),
        .I1(n31__0_carry_i_10_n_0),
        .I2(n2111_in[4]),
        .I3(n221[4]),
        .I4(n210__0[3]),
        .I5(n310[3]),
        .O(n31__0_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry_i_5
       (.I0(n31__0_carry_i_2_n_0),
        .I1(n31__0_carry_i_8_n_0),
        .I2(n2111_in[3]),
        .I3(n221[3]),
        .I4(n210__0[2]),
        .I5(n310[2]),
        .O(n31__0_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    n31__0_carry_i_6
       (.I0(n31__0_carry_i_3_n_0),
        .I1(n31__0_carry_i_9_n_0),
        .I2(n2111_in[2]),
        .I3(n221[2]),
        .I4(n210__0[1]),
        .I5(n310[1]),
        .O(n31__0_carry_i_6_n_0));
  (* HLUTNM = "lutpair25" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    n31__0_carry_i_7
       (.I0(n2111_in[1]),
        .I1(n210__0[1]),
        .I2(n221[2]),
        .I3(n310[1]),
        .O(n31__0_carry_i_7_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry_i_8
       (.I0(n310[3]),
        .I1(n221[4]),
        .I2(n210__0[3]),
        .O(n31__0_carry_i_8_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    n31__0_carry_i_9
       (.I0(n310[2]),
        .I1(n221[3]),
        .I2(n210__0[2]),
        .O(n31__0_carry_i_9_n_0));
endmodule

(* ORIG_REF_NAME = "red" *) 
module design_1_red_0_2_red
   (s00_axi_awready,
    s00_axi_wready,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rvalid,
    s00_axi_bvalid,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_wstrb,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output s00_axi_awready;
  output s00_axi_wready;
  output s00_axi_arready;
  output [31:0]s00_axi_rdata;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input s00_axi_aclk;
  input [1:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input [3:0]s00_axi_wstrb;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire axi_4_lite_inst_n_1;
  wire [0:0]n210;
  wire [31:1]n31;
  wire [3:0]out;
  wire [2:0]output_direccion;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [31:0]slv_reg0;

  design_1_red_0_2_axi_4_lite axi_4_lite_inst
       (.D({n31,n210}),
        .Q(output_direccion),
        .SR(axi_4_lite_inst_n_1),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid),
        .\slv_reg0_reg[31]_0 (slv_reg0));
  design_1_red_0_2_deco deco
       (.Q(output_direccion),
        .out(out));
  design_1_red_0_2_memoria memoria
       (.D(slv_reg0),
        .SR(axi_4_lite_inst_n_1),
        .\n12_reg[27]_0 ({n31,n210}),
        .out(out),
        .s00_axi_aclk(s00_axi_aclk));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

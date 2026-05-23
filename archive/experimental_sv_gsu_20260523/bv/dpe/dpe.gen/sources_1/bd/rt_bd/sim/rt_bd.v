//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Sat May 23 10:19:41 2026
//Host        : DESKTOP-PMQ3QCF running 64-bit major release  (build 9200)
//Command     : generate_target rt_bd.bd
//Design      : rt_bd
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "rt_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=rt_bd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=8,numReposBlks=8,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_ps7_cnt=1,synth_mode=None}" *) (* HW_HANDOFF = "rt_bd.hwdef" *) 
module rt_bd
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;

  wire [15:0]axi_dma0_M_AXIS_MM2S_TDATA;
  wire [1:0]axi_dma0_M_AXIS_MM2S_TKEEP;
  wire axi_dma0_M_AXIS_MM2S_TLAST;
  wire axi_dma0_M_AXIS_MM2S_TREADY;
  wire axi_dma0_M_AXIS_MM2S_TVALID;
  wire [31:0]axi_dma0_M_AXI_MM2S_ARADDR;
  wire [1:0]axi_dma0_M_AXI_MM2S_ARBURST;
  wire [3:0]axi_dma0_M_AXI_MM2S_ARCACHE;
  wire [7:0]axi_dma0_M_AXI_MM2S_ARLEN;
  wire [2:0]axi_dma0_M_AXI_MM2S_ARPROT;
  wire axi_dma0_M_AXI_MM2S_ARREADY;
  wire [2:0]axi_dma0_M_AXI_MM2S_ARSIZE;
  wire axi_dma0_M_AXI_MM2S_ARVALID;
  wire [31:0]axi_dma0_M_AXI_MM2S_RDATA;
  wire axi_dma0_M_AXI_MM2S_RLAST;
  wire axi_dma0_M_AXI_MM2S_RREADY;
  wire [1:0]axi_dma0_M_AXI_MM2S_RRESP;
  wire axi_dma0_M_AXI_MM2S_RVALID;
  wire [31:0]axi_dma0_M_AXI_S2MM_AWADDR;
  wire [1:0]axi_dma0_M_AXI_S2MM_AWBURST;
  wire [3:0]axi_dma0_M_AXI_S2MM_AWCACHE;
  wire [7:0]axi_dma0_M_AXI_S2MM_AWLEN;
  wire [2:0]axi_dma0_M_AXI_S2MM_AWPROT;
  wire axi_dma0_M_AXI_S2MM_AWREADY;
  wire [2:0]axi_dma0_M_AXI_S2MM_AWSIZE;
  wire axi_dma0_M_AXI_S2MM_AWVALID;
  wire axi_dma0_M_AXI_S2MM_BREADY;
  wire [1:0]axi_dma0_M_AXI_S2MM_BRESP;
  wire axi_dma0_M_AXI_S2MM_BVALID;
  wire [31:0]axi_dma0_M_AXI_S2MM_WDATA;
  wire axi_dma0_M_AXI_S2MM_WLAST;
  wire axi_dma0_M_AXI_S2MM_WREADY;
  wire [3:0]axi_dma0_M_AXI_S2MM_WSTRB;
  wire axi_dma0_M_AXI_S2MM_WVALID;
  wire [15:0]axi_dma1_M_AXIS_MM2S_TDATA;
  wire [1:0]axi_dma1_M_AXIS_MM2S_TKEEP;
  wire axi_dma1_M_AXIS_MM2S_TLAST;
  wire axi_dma1_M_AXIS_MM2S_TREADY;
  wire axi_dma1_M_AXIS_MM2S_TVALID;
  wire [31:0]axi_dma1_M_AXI_MM2S_ARADDR;
  wire [1:0]axi_dma1_M_AXI_MM2S_ARBURST;
  wire [3:0]axi_dma1_M_AXI_MM2S_ARCACHE;
  wire [7:0]axi_dma1_M_AXI_MM2S_ARLEN;
  wire [2:0]axi_dma1_M_AXI_MM2S_ARPROT;
  wire axi_dma1_M_AXI_MM2S_ARREADY;
  wire [2:0]axi_dma1_M_AXI_MM2S_ARSIZE;
  wire axi_dma1_M_AXI_MM2S_ARVALID;
  wire [31:0]axi_dma1_M_AXI_MM2S_RDATA;
  wire axi_dma1_M_AXI_MM2S_RLAST;
  wire axi_dma1_M_AXI_MM2S_RREADY;
  wire [1:0]axi_dma1_M_AXI_MM2S_RRESP;
  wire axi_dma1_M_AXI_MM2S_RVALID;
  wire [5:0]axi_smc_ctrl_M00_AXI_ARADDR;
  wire axi_smc_ctrl_M00_AXI_ARREADY;
  wire axi_smc_ctrl_M00_AXI_ARVALID;
  wire [5:0]axi_smc_ctrl_M00_AXI_AWADDR;
  wire axi_smc_ctrl_M00_AXI_AWREADY;
  wire axi_smc_ctrl_M00_AXI_AWVALID;
  wire axi_smc_ctrl_M00_AXI_BREADY;
  wire [1:0]axi_smc_ctrl_M00_AXI_BRESP;
  wire axi_smc_ctrl_M00_AXI_BVALID;
  wire [31:0]axi_smc_ctrl_M00_AXI_RDATA;
  wire axi_smc_ctrl_M00_AXI_RREADY;
  wire [1:0]axi_smc_ctrl_M00_AXI_RRESP;
  wire axi_smc_ctrl_M00_AXI_RVALID;
  wire [31:0]axi_smc_ctrl_M00_AXI_WDATA;
  wire axi_smc_ctrl_M00_AXI_WREADY;
  wire [3:0]axi_smc_ctrl_M00_AXI_WSTRB;
  wire axi_smc_ctrl_M00_AXI_WVALID;
  wire [9:0]axi_smc_ctrl_M01_AXI_ARADDR;
  wire axi_smc_ctrl_M01_AXI_ARREADY;
  wire axi_smc_ctrl_M01_AXI_ARVALID;
  wire [9:0]axi_smc_ctrl_M01_AXI_AWADDR;
  wire axi_smc_ctrl_M01_AXI_AWREADY;
  wire axi_smc_ctrl_M01_AXI_AWVALID;
  wire axi_smc_ctrl_M01_AXI_BREADY;
  wire [1:0]axi_smc_ctrl_M01_AXI_BRESP;
  wire axi_smc_ctrl_M01_AXI_BVALID;
  wire [31:0]axi_smc_ctrl_M01_AXI_RDATA;
  wire axi_smc_ctrl_M01_AXI_RREADY;
  wire [1:0]axi_smc_ctrl_M01_AXI_RRESP;
  wire axi_smc_ctrl_M01_AXI_RVALID;
  wire [31:0]axi_smc_ctrl_M01_AXI_WDATA;
  wire axi_smc_ctrl_M01_AXI_WREADY;
  wire axi_smc_ctrl_M01_AXI_WVALID;
  wire [9:0]axi_smc_ctrl_M02_AXI_ARADDR;
  wire axi_smc_ctrl_M02_AXI_ARREADY;
  wire axi_smc_ctrl_M02_AXI_ARVALID;
  wire [9:0]axi_smc_ctrl_M02_AXI_AWADDR;
  wire axi_smc_ctrl_M02_AXI_AWREADY;
  wire axi_smc_ctrl_M02_AXI_AWVALID;
  wire axi_smc_ctrl_M02_AXI_BREADY;
  wire [1:0]axi_smc_ctrl_M02_AXI_BRESP;
  wire axi_smc_ctrl_M02_AXI_BVALID;
  wire [31:0]axi_smc_ctrl_M02_AXI_RDATA;
  wire axi_smc_ctrl_M02_AXI_RREADY;
  wire [1:0]axi_smc_ctrl_M02_AXI_RRESP;
  wire axi_smc_ctrl_M02_AXI_RVALID;
  wire [31:0]axi_smc_ctrl_M02_AXI_WDATA;
  wire axi_smc_ctrl_M02_AXI_WREADY;
  wire axi_smc_ctrl_M02_AXI_WVALID;
  wire [31:0]axi_smc_mem_M00_AXI_ARADDR;
  wire [1:0]axi_smc_mem_M00_AXI_ARBURST;
  wire [3:0]axi_smc_mem_M00_AXI_ARCACHE;
  wire [3:0]axi_smc_mem_M00_AXI_ARLEN;
  wire [1:0]axi_smc_mem_M00_AXI_ARLOCK;
  wire [2:0]axi_smc_mem_M00_AXI_ARPROT;
  wire [3:0]axi_smc_mem_M00_AXI_ARQOS;
  wire axi_smc_mem_M00_AXI_ARREADY;
  wire [2:0]axi_smc_mem_M00_AXI_ARSIZE;
  wire axi_smc_mem_M00_AXI_ARVALID;
  wire [31:0]axi_smc_mem_M00_AXI_AWADDR;
  wire [1:0]axi_smc_mem_M00_AXI_AWBURST;
  wire [3:0]axi_smc_mem_M00_AXI_AWCACHE;
  wire [3:0]axi_smc_mem_M00_AXI_AWLEN;
  wire [1:0]axi_smc_mem_M00_AXI_AWLOCK;
  wire [2:0]axi_smc_mem_M00_AXI_AWPROT;
  wire [3:0]axi_smc_mem_M00_AXI_AWQOS;
  wire axi_smc_mem_M00_AXI_AWREADY;
  wire [2:0]axi_smc_mem_M00_AXI_AWSIZE;
  wire axi_smc_mem_M00_AXI_AWVALID;
  wire axi_smc_mem_M00_AXI_BREADY;
  wire [1:0]axi_smc_mem_M00_AXI_BRESP;
  wire axi_smc_mem_M00_AXI_BVALID;
  wire [63:0]axi_smc_mem_M00_AXI_RDATA;
  wire axi_smc_mem_M00_AXI_RLAST;
  wire axi_smc_mem_M00_AXI_RREADY;
  wire [1:0]axi_smc_mem_M00_AXI_RRESP;
  wire axi_smc_mem_M00_AXI_RVALID;
  wire [63:0]axi_smc_mem_M00_AXI_WDATA;
  wire axi_smc_mem_M00_AXI_WLAST;
  wire axi_smc_mem_M00_AXI_WREADY;
  wire [7:0]axi_smc_mem_M00_AXI_WSTRB;
  wire axi_smc_mem_M00_AXI_WVALID;
  wire [15:0]projection_adapter_0_m_axis_resp_TDATA;
  wire projection_adapter_0_m_axis_resp_TLAST;
  wire projection_adapter_0_m_axis_resp_TREADY;
  wire projection_adapter_0_m_axis_resp_TVALID;
  wire [14:0]ps7_0_DDR_ADDR;
  wire [2:0]ps7_0_DDR_BA;
  wire ps7_0_DDR_CAS_N;
  wire ps7_0_DDR_CKE;
  wire ps7_0_DDR_CK_N;
  wire ps7_0_DDR_CK_P;
  wire ps7_0_DDR_CS_N;
  wire [3:0]ps7_0_DDR_DM;
  wire [31:0]ps7_0_DDR_DQ;
  wire [3:0]ps7_0_DDR_DQS_N;
  wire [3:0]ps7_0_DDR_DQS_P;
  wire ps7_0_DDR_ODT;
  wire ps7_0_DDR_RAS_N;
  wire ps7_0_DDR_RESET_N;
  wire ps7_0_DDR_WE_N;
  wire ps7_0_FCLK_CLK0;
  wire ps7_0_FCLK_RESET0_N;
  wire ps7_0_FIXED_IO_DDR_VRN;
  wire ps7_0_FIXED_IO_DDR_VRP;
  wire [53:0]ps7_0_FIXED_IO_MIO;
  wire ps7_0_FIXED_IO_PS_CLK;
  wire ps7_0_FIXED_IO_PS_PORB;
  wire ps7_0_FIXED_IO_PS_SRSTB;
  wire [31:0]ps7_0_M_AXI_GP0_ARADDR;
  wire [1:0]ps7_0_M_AXI_GP0_ARBURST;
  wire [3:0]ps7_0_M_AXI_GP0_ARCACHE;
  wire [11:0]ps7_0_M_AXI_GP0_ARID;
  wire [3:0]ps7_0_M_AXI_GP0_ARLEN;
  wire [1:0]ps7_0_M_AXI_GP0_ARLOCK;
  wire [2:0]ps7_0_M_AXI_GP0_ARPROT;
  wire [3:0]ps7_0_M_AXI_GP0_ARQOS;
  wire ps7_0_M_AXI_GP0_ARREADY;
  wire [2:0]ps7_0_M_AXI_GP0_ARSIZE;
  wire ps7_0_M_AXI_GP0_ARVALID;
  wire [31:0]ps7_0_M_AXI_GP0_AWADDR;
  wire [1:0]ps7_0_M_AXI_GP0_AWBURST;
  wire [3:0]ps7_0_M_AXI_GP0_AWCACHE;
  wire [11:0]ps7_0_M_AXI_GP0_AWID;
  wire [3:0]ps7_0_M_AXI_GP0_AWLEN;
  wire [1:0]ps7_0_M_AXI_GP0_AWLOCK;
  wire [2:0]ps7_0_M_AXI_GP0_AWPROT;
  wire [3:0]ps7_0_M_AXI_GP0_AWQOS;
  wire ps7_0_M_AXI_GP0_AWREADY;
  wire [2:0]ps7_0_M_AXI_GP0_AWSIZE;
  wire ps7_0_M_AXI_GP0_AWVALID;
  wire [11:0]ps7_0_M_AXI_GP0_BID;
  wire ps7_0_M_AXI_GP0_BREADY;
  wire [1:0]ps7_0_M_AXI_GP0_BRESP;
  wire ps7_0_M_AXI_GP0_BVALID;
  wire [31:0]ps7_0_M_AXI_GP0_RDATA;
  wire [11:0]ps7_0_M_AXI_GP0_RID;
  wire ps7_0_M_AXI_GP0_RLAST;
  wire ps7_0_M_AXI_GP0_RREADY;
  wire [1:0]ps7_0_M_AXI_GP0_RRESP;
  wire ps7_0_M_AXI_GP0_RVALID;
  wire [31:0]ps7_0_M_AXI_GP0_WDATA;
  wire [11:0]ps7_0_M_AXI_GP0_WID;
  wire ps7_0_M_AXI_GP0_WLAST;
  wire ps7_0_M_AXI_GP0_WREADY;
  wire [3:0]ps7_0_M_AXI_GP0_WSTRB;
  wire ps7_0_M_AXI_GP0_WVALID;
  wire [0:0]rst_ps7_100m_peripheral_aresetn;
  wire [0:0]rst_ps7_100m_peripheral_reset;
  wire [15:0]subband_realtime_0_df_coef_stream_TDATA;
  wire [1:0]subband_realtime_0_df_coef_stream_TKEEP;
  wire [0:0]subband_realtime_0_df_coef_stream_TLAST;
  wire subband_realtime_0_df_coef_stream_TREADY;
  wire subband_realtime_0_df_coef_stream_TVALID;
  wire [31:0]subband_realtime_0_m_axi_weights_ARADDR;
  wire [1:0]subband_realtime_0_m_axi_weights_ARBURST;
  wire [3:0]subband_realtime_0_m_axi_weights_ARCACHE;
  wire [0:0]subband_realtime_0_m_axi_weights_ARID;
  wire [7:0]subband_realtime_0_m_axi_weights_ARLEN;
  wire [1:0]subband_realtime_0_m_axi_weights_ARLOCK;
  wire [2:0]subband_realtime_0_m_axi_weights_ARPROT;
  wire [3:0]subband_realtime_0_m_axi_weights_ARQOS;
  wire subband_realtime_0_m_axi_weights_ARREADY;
  wire [2:0]subband_realtime_0_m_axi_weights_ARSIZE;
  wire subband_realtime_0_m_axi_weights_ARVALID;
  wire [255:0]subband_realtime_0_m_axi_weights_RDATA;
  wire [0:0]subband_realtime_0_m_axi_weights_RID;
  wire subband_realtime_0_m_axi_weights_RLAST;
  wire subband_realtime_0_m_axi_weights_RREADY;
  wire [1:0]subband_realtime_0_m_axi_weights_RRESP;
  wire subband_realtime_0_m_axi_weights_RVALID;
  wire [15:0]subband_realtime_0_projection_request_stream_TDATA;
  wire [0:0]subband_realtime_0_projection_request_stream_TLAST;
  wire subband_realtime_0_projection_request_stream_TREADY;
  wire subband_realtime_0_projection_request_stream_TVALID;

  rt_bd_axi_dma0_0 axi_dma0
       (.axi_resetn(rst_ps7_100m_peripheral_aresetn),
        .m_axi_mm2s_aclk(ps7_0_FCLK_CLK0),
        .m_axi_mm2s_araddr(axi_dma0_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(axi_dma0_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(axi_dma0_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_arlen(axi_dma0_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(axi_dma0_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(axi_dma0_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(axi_dma0_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_arvalid(axi_dma0_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(axi_dma0_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(axi_dma0_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(axi_dma0_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(axi_dma0_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(axi_dma0_M_AXI_MM2S_RVALID),
        .m_axi_s2mm_aclk(ps7_0_FCLK_CLK0),
        .m_axi_s2mm_awaddr(axi_dma0_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(axi_dma0_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(axi_dma0_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(axi_dma0_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(axi_dma0_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(axi_dma0_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(axi_dma0_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awvalid(axi_dma0_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(axi_dma0_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(axi_dma0_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(axi_dma0_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(axi_dma0_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(axi_dma0_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(axi_dma0_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(axi_dma0_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(axi_dma0_M_AXI_S2MM_WVALID),
        .m_axis_mm2s_tdata(axi_dma0_M_AXIS_MM2S_TDATA),
        .m_axis_mm2s_tkeep(axi_dma0_M_AXIS_MM2S_TKEEP),
        .m_axis_mm2s_tlast(axi_dma0_M_AXIS_MM2S_TLAST),
        .m_axis_mm2s_tready(axi_dma0_M_AXIS_MM2S_TREADY),
        .m_axis_mm2s_tvalid(axi_dma0_M_AXIS_MM2S_TVALID),
        .s_axi_lite_aclk(ps7_0_FCLK_CLK0),
        .s_axi_lite_araddr(axi_smc_ctrl_M01_AXI_ARADDR),
        .s_axi_lite_arready(axi_smc_ctrl_M01_AXI_ARREADY),
        .s_axi_lite_arvalid(axi_smc_ctrl_M01_AXI_ARVALID),
        .s_axi_lite_awaddr(axi_smc_ctrl_M01_AXI_AWADDR),
        .s_axi_lite_awready(axi_smc_ctrl_M01_AXI_AWREADY),
        .s_axi_lite_awvalid(axi_smc_ctrl_M01_AXI_AWVALID),
        .s_axi_lite_bready(axi_smc_ctrl_M01_AXI_BREADY),
        .s_axi_lite_bresp(axi_smc_ctrl_M01_AXI_BRESP),
        .s_axi_lite_bvalid(axi_smc_ctrl_M01_AXI_BVALID),
        .s_axi_lite_rdata(axi_smc_ctrl_M01_AXI_RDATA),
        .s_axi_lite_rready(axi_smc_ctrl_M01_AXI_RREADY),
        .s_axi_lite_rresp(axi_smc_ctrl_M01_AXI_RRESP),
        .s_axi_lite_rvalid(axi_smc_ctrl_M01_AXI_RVALID),
        .s_axi_lite_wdata(axi_smc_ctrl_M01_AXI_WDATA),
        .s_axi_lite_wready(axi_smc_ctrl_M01_AXI_WREADY),
        .s_axi_lite_wvalid(axi_smc_ctrl_M01_AXI_WVALID),
        .s_axis_s2mm_tdata(subband_realtime_0_df_coef_stream_TDATA),
        .s_axis_s2mm_tkeep(subband_realtime_0_df_coef_stream_TKEEP),
        .s_axis_s2mm_tlast(subband_realtime_0_df_coef_stream_TLAST),
        .s_axis_s2mm_tready(subband_realtime_0_df_coef_stream_TREADY),
        .s_axis_s2mm_tvalid(subband_realtime_0_df_coef_stream_TVALID));
  rt_bd_axi_dma1_0 axi_dma1
       (.axi_resetn(rst_ps7_100m_peripheral_aresetn),
        .m_axi_mm2s_aclk(ps7_0_FCLK_CLK0),
        .m_axi_mm2s_araddr(axi_dma1_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(axi_dma1_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(axi_dma1_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_arlen(axi_dma1_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(axi_dma1_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(axi_dma1_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(axi_dma1_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_arvalid(axi_dma1_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(axi_dma1_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(axi_dma1_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(axi_dma1_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(axi_dma1_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(axi_dma1_M_AXI_MM2S_RVALID),
        .m_axis_mm2s_tdata(axi_dma1_M_AXIS_MM2S_TDATA),
        .m_axis_mm2s_tkeep(axi_dma1_M_AXIS_MM2S_TKEEP),
        .m_axis_mm2s_tlast(axi_dma1_M_AXIS_MM2S_TLAST),
        .m_axis_mm2s_tready(axi_dma1_M_AXIS_MM2S_TREADY),
        .m_axis_mm2s_tvalid(axi_dma1_M_AXIS_MM2S_TVALID),
        .s_axi_lite_aclk(ps7_0_FCLK_CLK0),
        .s_axi_lite_araddr(axi_smc_ctrl_M02_AXI_ARADDR),
        .s_axi_lite_arready(axi_smc_ctrl_M02_AXI_ARREADY),
        .s_axi_lite_arvalid(axi_smc_ctrl_M02_AXI_ARVALID),
        .s_axi_lite_awaddr(axi_smc_ctrl_M02_AXI_AWADDR),
        .s_axi_lite_awready(axi_smc_ctrl_M02_AXI_AWREADY),
        .s_axi_lite_awvalid(axi_smc_ctrl_M02_AXI_AWVALID),
        .s_axi_lite_bready(axi_smc_ctrl_M02_AXI_BREADY),
        .s_axi_lite_bresp(axi_smc_ctrl_M02_AXI_BRESP),
        .s_axi_lite_bvalid(axi_smc_ctrl_M02_AXI_BVALID),
        .s_axi_lite_rdata(axi_smc_ctrl_M02_AXI_RDATA),
        .s_axi_lite_rready(axi_smc_ctrl_M02_AXI_RREADY),
        .s_axi_lite_rresp(axi_smc_ctrl_M02_AXI_RRESP),
        .s_axi_lite_rvalid(axi_smc_ctrl_M02_AXI_RVALID),
        .s_axi_lite_wdata(axi_smc_ctrl_M02_AXI_WDATA),
        .s_axi_lite_wready(axi_smc_ctrl_M02_AXI_WREADY),
        .s_axi_lite_wvalid(axi_smc_ctrl_M02_AXI_WVALID));
  rt_bd_axi_smc_ctrl_0 axi_smc_ctrl
       (.M00_AXI_araddr(axi_smc_ctrl_M00_AXI_ARADDR),
        .M00_AXI_arready(axi_smc_ctrl_M00_AXI_ARREADY),
        .M00_AXI_arvalid(axi_smc_ctrl_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_smc_ctrl_M00_AXI_AWADDR),
        .M00_AXI_awready(axi_smc_ctrl_M00_AXI_AWREADY),
        .M00_AXI_awvalid(axi_smc_ctrl_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_smc_ctrl_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_smc_ctrl_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_smc_ctrl_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_smc_ctrl_M00_AXI_RDATA),
        .M00_AXI_rready(axi_smc_ctrl_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_smc_ctrl_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_smc_ctrl_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_smc_ctrl_M00_AXI_WDATA),
        .M00_AXI_wready(axi_smc_ctrl_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_smc_ctrl_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_smc_ctrl_M00_AXI_WVALID),
        .M01_AXI_araddr(axi_smc_ctrl_M01_AXI_ARADDR),
        .M01_AXI_arready(axi_smc_ctrl_M01_AXI_ARREADY),
        .M01_AXI_arvalid(axi_smc_ctrl_M01_AXI_ARVALID),
        .M01_AXI_awaddr(axi_smc_ctrl_M01_AXI_AWADDR),
        .M01_AXI_awready(axi_smc_ctrl_M01_AXI_AWREADY),
        .M01_AXI_awvalid(axi_smc_ctrl_M01_AXI_AWVALID),
        .M01_AXI_bready(axi_smc_ctrl_M01_AXI_BREADY),
        .M01_AXI_bresp(axi_smc_ctrl_M01_AXI_BRESP),
        .M01_AXI_bvalid(axi_smc_ctrl_M01_AXI_BVALID),
        .M01_AXI_rdata(axi_smc_ctrl_M01_AXI_RDATA),
        .M01_AXI_rready(axi_smc_ctrl_M01_AXI_RREADY),
        .M01_AXI_rresp(axi_smc_ctrl_M01_AXI_RRESP),
        .M01_AXI_rvalid(axi_smc_ctrl_M01_AXI_RVALID),
        .M01_AXI_wdata(axi_smc_ctrl_M01_AXI_WDATA),
        .M01_AXI_wready(axi_smc_ctrl_M01_AXI_WREADY),
        .M01_AXI_wvalid(axi_smc_ctrl_M01_AXI_WVALID),
        .M02_AXI_araddr(axi_smc_ctrl_M02_AXI_ARADDR),
        .M02_AXI_arready(axi_smc_ctrl_M02_AXI_ARREADY),
        .M02_AXI_arvalid(axi_smc_ctrl_M02_AXI_ARVALID),
        .M02_AXI_awaddr(axi_smc_ctrl_M02_AXI_AWADDR),
        .M02_AXI_awready(axi_smc_ctrl_M02_AXI_AWREADY),
        .M02_AXI_awvalid(axi_smc_ctrl_M02_AXI_AWVALID),
        .M02_AXI_bready(axi_smc_ctrl_M02_AXI_BREADY),
        .M02_AXI_bresp(axi_smc_ctrl_M02_AXI_BRESP),
        .M02_AXI_bvalid(axi_smc_ctrl_M02_AXI_BVALID),
        .M02_AXI_rdata(axi_smc_ctrl_M02_AXI_RDATA),
        .M02_AXI_rready(axi_smc_ctrl_M02_AXI_RREADY),
        .M02_AXI_rresp(axi_smc_ctrl_M02_AXI_RRESP),
        .M02_AXI_rvalid(axi_smc_ctrl_M02_AXI_RVALID),
        .M02_AXI_wdata(axi_smc_ctrl_M02_AXI_WDATA),
        .M02_AXI_wready(axi_smc_ctrl_M02_AXI_WREADY),
        .M02_AXI_wvalid(axi_smc_ctrl_M02_AXI_WVALID),
        .S00_AXI_araddr(ps7_0_M_AXI_GP0_ARADDR),
        .S00_AXI_arburst(ps7_0_M_AXI_GP0_ARBURST),
        .S00_AXI_arcache(ps7_0_M_AXI_GP0_ARCACHE),
        .S00_AXI_arid(ps7_0_M_AXI_GP0_ARID),
        .S00_AXI_arlen(ps7_0_M_AXI_GP0_ARLEN),
        .S00_AXI_arlock(ps7_0_M_AXI_GP0_ARLOCK),
        .S00_AXI_arprot(ps7_0_M_AXI_GP0_ARPROT),
        .S00_AXI_arqos(ps7_0_M_AXI_GP0_ARQOS),
        .S00_AXI_arready(ps7_0_M_AXI_GP0_ARREADY),
        .S00_AXI_arsize(ps7_0_M_AXI_GP0_ARSIZE),
        .S00_AXI_arvalid(ps7_0_M_AXI_GP0_ARVALID),
        .S00_AXI_awaddr(ps7_0_M_AXI_GP0_AWADDR),
        .S00_AXI_awburst(ps7_0_M_AXI_GP0_AWBURST),
        .S00_AXI_awcache(ps7_0_M_AXI_GP0_AWCACHE),
        .S00_AXI_awid(ps7_0_M_AXI_GP0_AWID),
        .S00_AXI_awlen(ps7_0_M_AXI_GP0_AWLEN),
        .S00_AXI_awlock(ps7_0_M_AXI_GP0_AWLOCK),
        .S00_AXI_awprot(ps7_0_M_AXI_GP0_AWPROT),
        .S00_AXI_awqos(ps7_0_M_AXI_GP0_AWQOS),
        .S00_AXI_awready(ps7_0_M_AXI_GP0_AWREADY),
        .S00_AXI_awsize(ps7_0_M_AXI_GP0_AWSIZE),
        .S00_AXI_awvalid(ps7_0_M_AXI_GP0_AWVALID),
        .S00_AXI_bid(ps7_0_M_AXI_GP0_BID),
        .S00_AXI_bready(ps7_0_M_AXI_GP0_BREADY),
        .S00_AXI_bresp(ps7_0_M_AXI_GP0_BRESP),
        .S00_AXI_bvalid(ps7_0_M_AXI_GP0_BVALID),
        .S00_AXI_rdata(ps7_0_M_AXI_GP0_RDATA),
        .S00_AXI_rid(ps7_0_M_AXI_GP0_RID),
        .S00_AXI_rlast(ps7_0_M_AXI_GP0_RLAST),
        .S00_AXI_rready(ps7_0_M_AXI_GP0_RREADY),
        .S00_AXI_rresp(ps7_0_M_AXI_GP0_RRESP),
        .S00_AXI_rvalid(ps7_0_M_AXI_GP0_RVALID),
        .S00_AXI_wdata(ps7_0_M_AXI_GP0_WDATA),
        .S00_AXI_wid(ps7_0_M_AXI_GP0_WID),
        .S00_AXI_wlast(ps7_0_M_AXI_GP0_WLAST),
        .S00_AXI_wready(ps7_0_M_AXI_GP0_WREADY),
        .S00_AXI_wstrb(ps7_0_M_AXI_GP0_WSTRB),
        .S00_AXI_wvalid(ps7_0_M_AXI_GP0_WVALID),
        .aclk(ps7_0_FCLK_CLK0),
        .aresetn(rst_ps7_100m_peripheral_aresetn));
  rt_bd_axi_smc_mem_0 axi_smc_mem
       (.M00_AXI_araddr(axi_smc_mem_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_smc_mem_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_smc_mem_M00_AXI_ARCACHE),
        .M00_AXI_arlen(axi_smc_mem_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_smc_mem_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_smc_mem_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_smc_mem_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_smc_mem_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_smc_mem_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_smc_mem_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_smc_mem_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_smc_mem_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_smc_mem_M00_AXI_AWCACHE),
        .M00_AXI_awlen(axi_smc_mem_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_smc_mem_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_smc_mem_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_smc_mem_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_smc_mem_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_smc_mem_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_smc_mem_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_smc_mem_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_smc_mem_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_smc_mem_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_smc_mem_M00_AXI_RDATA),
        .M00_AXI_rlast(axi_smc_mem_M00_AXI_RLAST),
        .M00_AXI_rready(axi_smc_mem_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_smc_mem_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_smc_mem_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_smc_mem_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_smc_mem_M00_AXI_WLAST),
        .M00_AXI_wready(axi_smc_mem_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_smc_mem_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_smc_mem_M00_AXI_WVALID),
        .S00_AXI_araddr(axi_dma0_M_AXI_MM2S_ARADDR),
        .S00_AXI_arburst(axi_dma0_M_AXI_MM2S_ARBURST),
        .S00_AXI_arcache(axi_dma0_M_AXI_MM2S_ARCACHE),
        .S00_AXI_arlen(axi_dma0_M_AXI_MM2S_ARLEN),
        .S00_AXI_arlock(1'b0),
        .S00_AXI_arprot(axi_dma0_M_AXI_MM2S_ARPROT),
        .S00_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_arready(axi_dma0_M_AXI_MM2S_ARREADY),
        .S00_AXI_arsize(axi_dma0_M_AXI_MM2S_ARSIZE),
        .S00_AXI_arvalid(axi_dma0_M_AXI_MM2S_ARVALID),
        .S00_AXI_rdata(axi_dma0_M_AXI_MM2S_RDATA),
        .S00_AXI_rlast(axi_dma0_M_AXI_MM2S_RLAST),
        .S00_AXI_rready(axi_dma0_M_AXI_MM2S_RREADY),
        .S00_AXI_rresp(axi_dma0_M_AXI_MM2S_RRESP),
        .S00_AXI_rvalid(axi_dma0_M_AXI_MM2S_RVALID),
        .S01_AXI_awaddr(axi_dma0_M_AXI_S2MM_AWADDR),
        .S01_AXI_awburst(axi_dma0_M_AXI_S2MM_AWBURST),
        .S01_AXI_awcache(axi_dma0_M_AXI_S2MM_AWCACHE),
        .S01_AXI_awlen(axi_dma0_M_AXI_S2MM_AWLEN),
        .S01_AXI_awlock(1'b0),
        .S01_AXI_awprot(axi_dma0_M_AXI_S2MM_AWPROT),
        .S01_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_awready(axi_dma0_M_AXI_S2MM_AWREADY),
        .S01_AXI_awsize(axi_dma0_M_AXI_S2MM_AWSIZE),
        .S01_AXI_awvalid(axi_dma0_M_AXI_S2MM_AWVALID),
        .S01_AXI_bready(axi_dma0_M_AXI_S2MM_BREADY),
        .S01_AXI_bresp(axi_dma0_M_AXI_S2MM_BRESP),
        .S01_AXI_bvalid(axi_dma0_M_AXI_S2MM_BVALID),
        .S01_AXI_wdata(axi_dma0_M_AXI_S2MM_WDATA),
        .S01_AXI_wlast(axi_dma0_M_AXI_S2MM_WLAST),
        .S01_AXI_wready(axi_dma0_M_AXI_S2MM_WREADY),
        .S01_AXI_wstrb(axi_dma0_M_AXI_S2MM_WSTRB),
        .S01_AXI_wvalid(axi_dma0_M_AXI_S2MM_WVALID),
        .S02_AXI_araddr(axi_dma1_M_AXI_MM2S_ARADDR),
        .S02_AXI_arburst(axi_dma1_M_AXI_MM2S_ARBURST),
        .S02_AXI_arcache(axi_dma1_M_AXI_MM2S_ARCACHE),
        .S02_AXI_arlen(axi_dma1_M_AXI_MM2S_ARLEN),
        .S02_AXI_arlock(1'b0),
        .S02_AXI_arprot(axi_dma1_M_AXI_MM2S_ARPROT),
        .S02_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S02_AXI_arready(axi_dma1_M_AXI_MM2S_ARREADY),
        .S02_AXI_arsize(axi_dma1_M_AXI_MM2S_ARSIZE),
        .S02_AXI_arvalid(axi_dma1_M_AXI_MM2S_ARVALID),
        .S02_AXI_rdata(axi_dma1_M_AXI_MM2S_RDATA),
        .S02_AXI_rlast(axi_dma1_M_AXI_MM2S_RLAST),
        .S02_AXI_rready(axi_dma1_M_AXI_MM2S_RREADY),
        .S02_AXI_rresp(axi_dma1_M_AXI_MM2S_RRESP),
        .S02_AXI_rvalid(axi_dma1_M_AXI_MM2S_RVALID),
        .S03_AXI_araddr(subband_realtime_0_m_axi_weights_ARADDR),
        .S03_AXI_arburst(subband_realtime_0_m_axi_weights_ARBURST),
        .S03_AXI_arcache(subband_realtime_0_m_axi_weights_ARCACHE),
        .S03_AXI_arid(subband_realtime_0_m_axi_weights_ARID),
        .S03_AXI_arlen(subband_realtime_0_m_axi_weights_ARLEN),
        .S03_AXI_arlock(subband_realtime_0_m_axi_weights_ARLOCK[0]),
        .S03_AXI_arprot(subband_realtime_0_m_axi_weights_ARPROT),
        .S03_AXI_arqos(subband_realtime_0_m_axi_weights_ARQOS),
        .S03_AXI_arready(subband_realtime_0_m_axi_weights_ARREADY),
        .S03_AXI_arsize(subband_realtime_0_m_axi_weights_ARSIZE),
        .S03_AXI_arvalid(subband_realtime_0_m_axi_weights_ARVALID),
        .S03_AXI_rdata(subband_realtime_0_m_axi_weights_RDATA),
        .S03_AXI_rid(subband_realtime_0_m_axi_weights_RID),
        .S03_AXI_rlast(subband_realtime_0_m_axi_weights_RLAST),
        .S03_AXI_rready(subband_realtime_0_m_axi_weights_RREADY),
        .S03_AXI_rresp(subband_realtime_0_m_axi_weights_RRESP),
        .S03_AXI_rvalid(subband_realtime_0_m_axi_weights_RVALID),
        .aclk(ps7_0_FCLK_CLK0),
        .aresetn(rst_ps7_100m_peripheral_aresetn));
  rt_bd_projection_adapter_0_0 projection_adapter_0
       (.ap_clk(ps7_0_FCLK_CLK0),
        .ap_rst(rst_ps7_100m_peripheral_reset),
        .m_axis_resp_tdata(projection_adapter_0_m_axis_resp_TDATA),
        .m_axis_resp_tlast(projection_adapter_0_m_axis_resp_TLAST),
        .m_axis_resp_tready(projection_adapter_0_m_axis_resp_TREADY),
        .m_axis_resp_tvalid(projection_adapter_0_m_axis_resp_TVALID),
        .s_axis_req_tdata(subband_realtime_0_projection_request_stream_TDATA),
        .s_axis_req_tlast(subband_realtime_0_projection_request_stream_TLAST),
        .s_axis_req_tready(subband_realtime_0_projection_request_stream_TREADY),
        .s_axis_req_tvalid(subband_realtime_0_projection_request_stream_TVALID));
  rt_bd_ps7_0_0 ps7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(ps7_0_FCLK_CLK0),
        .FCLK_RESET0_N(ps7_0_FCLK_RESET0_N),
        .MIO(FIXED_IO_mio[53:0]),
        .M_AXI_GP0_ACLK(ps7_0_FCLK_CLK0),
        .M_AXI_GP0_ARADDR(ps7_0_M_AXI_GP0_ARADDR),
        .M_AXI_GP0_ARBURST(ps7_0_M_AXI_GP0_ARBURST),
        .M_AXI_GP0_ARCACHE(ps7_0_M_AXI_GP0_ARCACHE),
        .M_AXI_GP0_ARID(ps7_0_M_AXI_GP0_ARID),
        .M_AXI_GP0_ARLEN(ps7_0_M_AXI_GP0_ARLEN),
        .M_AXI_GP0_ARLOCK(ps7_0_M_AXI_GP0_ARLOCK),
        .M_AXI_GP0_ARPROT(ps7_0_M_AXI_GP0_ARPROT),
        .M_AXI_GP0_ARQOS(ps7_0_M_AXI_GP0_ARQOS),
        .M_AXI_GP0_ARREADY(ps7_0_M_AXI_GP0_ARREADY),
        .M_AXI_GP0_ARSIZE(ps7_0_M_AXI_GP0_ARSIZE),
        .M_AXI_GP0_ARVALID(ps7_0_M_AXI_GP0_ARVALID),
        .M_AXI_GP0_AWADDR(ps7_0_M_AXI_GP0_AWADDR),
        .M_AXI_GP0_AWBURST(ps7_0_M_AXI_GP0_AWBURST),
        .M_AXI_GP0_AWCACHE(ps7_0_M_AXI_GP0_AWCACHE),
        .M_AXI_GP0_AWID(ps7_0_M_AXI_GP0_AWID),
        .M_AXI_GP0_AWLEN(ps7_0_M_AXI_GP0_AWLEN),
        .M_AXI_GP0_AWLOCK(ps7_0_M_AXI_GP0_AWLOCK),
        .M_AXI_GP0_AWPROT(ps7_0_M_AXI_GP0_AWPROT),
        .M_AXI_GP0_AWQOS(ps7_0_M_AXI_GP0_AWQOS),
        .M_AXI_GP0_AWREADY(ps7_0_M_AXI_GP0_AWREADY),
        .M_AXI_GP0_AWSIZE(ps7_0_M_AXI_GP0_AWSIZE),
        .M_AXI_GP0_AWVALID(ps7_0_M_AXI_GP0_AWVALID),
        .M_AXI_GP0_BID(ps7_0_M_AXI_GP0_BID),
        .M_AXI_GP0_BREADY(ps7_0_M_AXI_GP0_BREADY),
        .M_AXI_GP0_BRESP(ps7_0_M_AXI_GP0_BRESP),
        .M_AXI_GP0_BVALID(ps7_0_M_AXI_GP0_BVALID),
        .M_AXI_GP0_RDATA(ps7_0_M_AXI_GP0_RDATA),
        .M_AXI_GP0_RID(ps7_0_M_AXI_GP0_RID),
        .M_AXI_GP0_RLAST(ps7_0_M_AXI_GP0_RLAST),
        .M_AXI_GP0_RREADY(ps7_0_M_AXI_GP0_RREADY),
        .M_AXI_GP0_RRESP(ps7_0_M_AXI_GP0_RRESP),
        .M_AXI_GP0_RVALID(ps7_0_M_AXI_GP0_RVALID),
        .M_AXI_GP0_WDATA(ps7_0_M_AXI_GP0_WDATA),
        .M_AXI_GP0_WID(ps7_0_M_AXI_GP0_WID),
        .M_AXI_GP0_WLAST(ps7_0_M_AXI_GP0_WLAST),
        .M_AXI_GP0_WREADY(ps7_0_M_AXI_GP0_WREADY),
        .M_AXI_GP0_WSTRB(ps7_0_M_AXI_GP0_WSTRB),
        .M_AXI_GP0_WVALID(ps7_0_M_AXI_GP0_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .S_AXI_HP0_ACLK(ps7_0_FCLK_CLK0),
        .S_AXI_HP0_ARADDR(axi_smc_mem_M00_AXI_ARADDR),
        .S_AXI_HP0_ARBURST(axi_smc_mem_M00_AXI_ARBURST),
        .S_AXI_HP0_ARCACHE(axi_smc_mem_M00_AXI_ARCACHE),
        .S_AXI_HP0_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARLEN(axi_smc_mem_M00_AXI_ARLEN),
        .S_AXI_HP0_ARLOCK(axi_smc_mem_M00_AXI_ARLOCK),
        .S_AXI_HP0_ARPROT(axi_smc_mem_M00_AXI_ARPROT),
        .S_AXI_HP0_ARQOS(axi_smc_mem_M00_AXI_ARQOS),
        .S_AXI_HP0_ARREADY(axi_smc_mem_M00_AXI_ARREADY),
        .S_AXI_HP0_ARSIZE(axi_smc_mem_M00_AXI_ARSIZE),
        .S_AXI_HP0_ARVALID(axi_smc_mem_M00_AXI_ARVALID),
        .S_AXI_HP0_AWADDR(axi_smc_mem_M00_AXI_AWADDR),
        .S_AXI_HP0_AWBURST(axi_smc_mem_M00_AXI_AWBURST),
        .S_AXI_HP0_AWCACHE(axi_smc_mem_M00_AXI_AWCACHE),
        .S_AXI_HP0_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_AWLEN(axi_smc_mem_M00_AXI_AWLEN),
        .S_AXI_HP0_AWLOCK(axi_smc_mem_M00_AXI_AWLOCK),
        .S_AXI_HP0_AWPROT(axi_smc_mem_M00_AXI_AWPROT),
        .S_AXI_HP0_AWQOS(axi_smc_mem_M00_AXI_AWQOS),
        .S_AXI_HP0_AWREADY(axi_smc_mem_M00_AXI_AWREADY),
        .S_AXI_HP0_AWSIZE(axi_smc_mem_M00_AXI_AWSIZE),
        .S_AXI_HP0_AWVALID(axi_smc_mem_M00_AXI_AWVALID),
        .S_AXI_HP0_BREADY(axi_smc_mem_M00_AXI_BREADY),
        .S_AXI_HP0_BRESP(axi_smc_mem_M00_AXI_BRESP),
        .S_AXI_HP0_BVALID(axi_smc_mem_M00_AXI_BVALID),
        .S_AXI_HP0_RDATA(axi_smc_mem_M00_AXI_RDATA),
        .S_AXI_HP0_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP0_RLAST(axi_smc_mem_M00_AXI_RLAST),
        .S_AXI_HP0_RREADY(axi_smc_mem_M00_AXI_RREADY),
        .S_AXI_HP0_RRESP(axi_smc_mem_M00_AXI_RRESP),
        .S_AXI_HP0_RVALID(axi_smc_mem_M00_AXI_RVALID),
        .S_AXI_HP0_WDATA(axi_smc_mem_M00_AXI_WDATA),
        .S_AXI_HP0_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_WLAST(axi_smc_mem_M00_AXI_WLAST),
        .S_AXI_HP0_WREADY(axi_smc_mem_M00_AXI_WREADY),
        .S_AXI_HP0_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP0_WSTRB(axi_smc_mem_M00_AXI_WSTRB),
        .S_AXI_HP0_WVALID(axi_smc_mem_M00_AXI_WVALID));
  rt_bd_rst_ps7_100m_0 rst_ps7_100m
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(ps7_0_FCLK_RESET0_N),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_ps7_100m_peripheral_aresetn),
        .peripheral_reset(rst_ps7_100m_peripheral_reset),
        .slowest_sync_clk(ps7_0_FCLK_CLK0));
  rt_bd_subband_realtime_0_0 subband_realtime_0
       (.ap_clk(ps7_0_FCLK_CLK0),
        .ap_rst_n(rst_ps7_100m_peripheral_aresetn),
        .df_coef_stream_TDATA(subband_realtime_0_df_coef_stream_TDATA),
        .df_coef_stream_TKEEP(subband_realtime_0_df_coef_stream_TKEEP),
        .df_coef_stream_TLAST(subband_realtime_0_df_coef_stream_TLAST),
        .df_coef_stream_TREADY(subband_realtime_0_df_coef_stream_TREADY),
        .df_coef_stream_TVALID(subband_realtime_0_df_coef_stream_TVALID),
        .fb_fft_stream_TDATA(axi_dma1_M_AXIS_MM2S_TDATA),
        .fb_fft_stream_TKEEP(axi_dma1_M_AXIS_MM2S_TKEEP),
        .fb_fft_stream_TLAST(axi_dma1_M_AXIS_MM2S_TLAST),
        .fb_fft_stream_TREADY(axi_dma1_M_AXIS_MM2S_TREADY),
        .fb_fft_stream_TSTRB({1'b1,1'b1}),
        .fb_fft_stream_TVALID(axi_dma1_M_AXIS_MM2S_TVALID),
        .m_axi_weights_ARADDR(subband_realtime_0_m_axi_weights_ARADDR),
        .m_axi_weights_ARBURST(subband_realtime_0_m_axi_weights_ARBURST),
        .m_axi_weights_ARCACHE(subband_realtime_0_m_axi_weights_ARCACHE),
        .m_axi_weights_ARID(subband_realtime_0_m_axi_weights_ARID),
        .m_axi_weights_ARLEN(subband_realtime_0_m_axi_weights_ARLEN),
        .m_axi_weights_ARLOCK(subband_realtime_0_m_axi_weights_ARLOCK),
        .m_axi_weights_ARPROT(subband_realtime_0_m_axi_weights_ARPROT),
        .m_axi_weights_ARQOS(subband_realtime_0_m_axi_weights_ARQOS),
        .m_axi_weights_ARREADY(subband_realtime_0_m_axi_weights_ARREADY),
        .m_axi_weights_ARSIZE(subband_realtime_0_m_axi_weights_ARSIZE),
        .m_axi_weights_ARVALID(subband_realtime_0_m_axi_weights_ARVALID),
        .m_axi_weights_AWREADY(1'b0),
        .m_axi_weights_BID(1'b0),
        .m_axi_weights_BRESP({1'b0,1'b0}),
        .m_axi_weights_BVALID(1'b0),
        .m_axi_weights_RDATA(subband_realtime_0_m_axi_weights_RDATA),
        .m_axi_weights_RID(subband_realtime_0_m_axi_weights_RID),
        .m_axi_weights_RLAST(subband_realtime_0_m_axi_weights_RLAST),
        .m_axi_weights_RREADY(subband_realtime_0_m_axi_weights_RREADY),
        .m_axi_weights_RRESP(subband_realtime_0_m_axi_weights_RRESP),
        .m_axi_weights_RVALID(subband_realtime_0_m_axi_weights_RVALID),
        .m_axi_weights_WREADY(1'b0),
        .noisy_fft_stream_TDATA(axi_dma0_M_AXIS_MM2S_TDATA),
        .noisy_fft_stream_TKEEP(axi_dma0_M_AXIS_MM2S_TKEEP),
        .noisy_fft_stream_TLAST(axi_dma0_M_AXIS_MM2S_TLAST),
        .noisy_fft_stream_TREADY(axi_dma0_M_AXIS_MM2S_TREADY),
        .noisy_fft_stream_TSTRB({1'b1,1'b1}),
        .noisy_fft_stream_TVALID(axi_dma0_M_AXIS_MM2S_TVALID),
        .projection_request_stream_TDATA(subband_realtime_0_projection_request_stream_TDATA),
        .projection_request_stream_TLAST(subband_realtime_0_projection_request_stream_TLAST),
        .projection_request_stream_TREADY(subband_realtime_0_projection_request_stream_TREADY),
        .projection_request_stream_TVALID(subband_realtime_0_projection_request_stream_TVALID),
        .projection_response_stream_TDATA(projection_adapter_0_m_axis_resp_TDATA),
        .projection_response_stream_TKEEP({1'b1,1'b1}),
        .projection_response_stream_TLAST(projection_adapter_0_m_axis_resp_TLAST),
        .projection_response_stream_TREADY(projection_adapter_0_m_axis_resp_TREADY),
        .projection_response_stream_TSTRB({1'b1,1'b1}),
        .projection_response_stream_TVALID(projection_adapter_0_m_axis_resp_TVALID),
        .s_axi_control_ARADDR(axi_smc_ctrl_M00_AXI_ARADDR),
        .s_axi_control_ARREADY(axi_smc_ctrl_M00_AXI_ARREADY),
        .s_axi_control_ARVALID(axi_smc_ctrl_M00_AXI_ARVALID),
        .s_axi_control_AWADDR(axi_smc_ctrl_M00_AXI_AWADDR),
        .s_axi_control_AWREADY(axi_smc_ctrl_M00_AXI_AWREADY),
        .s_axi_control_AWVALID(axi_smc_ctrl_M00_AXI_AWVALID),
        .s_axi_control_BREADY(axi_smc_ctrl_M00_AXI_BREADY),
        .s_axi_control_BRESP(axi_smc_ctrl_M00_AXI_BRESP),
        .s_axi_control_BVALID(axi_smc_ctrl_M00_AXI_BVALID),
        .s_axi_control_RDATA(axi_smc_ctrl_M00_AXI_RDATA),
        .s_axi_control_RREADY(axi_smc_ctrl_M00_AXI_RREADY),
        .s_axi_control_RRESP(axi_smc_ctrl_M00_AXI_RRESP),
        .s_axi_control_RVALID(axi_smc_ctrl_M00_AXI_RVALID),
        .s_axi_control_WDATA(axi_smc_ctrl_M00_AXI_WDATA),
        .s_axi_control_WREADY(axi_smc_ctrl_M00_AXI_WREADY),
        .s_axi_control_WSTRB(axi_smc_ctrl_M00_AXI_WSTRB),
        .s_axi_control_WVALID(axi_smc_ctrl_M00_AXI_WVALID));
endmodule

// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:SubbandRealtimeTopQ610Ip:1.0
// IP Revision: 2114608468

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module realtime_dma_bd_subband_realtime_0_0 (
  s_axi_control_AWADDR,
  s_axi_control_AWVALID,
  s_axi_control_AWREADY,
  s_axi_control_WDATA,
  s_axi_control_WSTRB,
  s_axi_control_WVALID,
  s_axi_control_WREADY,
  s_axi_control_BRESP,
  s_axi_control_BVALID,
  s_axi_control_BREADY,
  s_axi_control_ARADDR,
  s_axi_control_ARVALID,
  s_axi_control_ARREADY,
  s_axi_control_RDATA,
  s_axi_control_RRESP,
  s_axi_control_RVALID,
  s_axi_control_RREADY,
  ap_clk,
  ap_rst_n,
  interrupt,
  m_axi_weights_AWID,
  m_axi_weights_AWADDR,
  m_axi_weights_AWLEN,
  m_axi_weights_AWSIZE,
  m_axi_weights_AWBURST,
  m_axi_weights_AWLOCK,
  m_axi_weights_AWREGION,
  m_axi_weights_AWCACHE,
  m_axi_weights_AWPROT,
  m_axi_weights_AWQOS,
  m_axi_weights_AWVALID,
  m_axi_weights_AWREADY,
  m_axi_weights_WID,
  m_axi_weights_WDATA,
  m_axi_weights_WSTRB,
  m_axi_weights_WLAST,
  m_axi_weights_WVALID,
  m_axi_weights_WREADY,
  m_axi_weights_BID,
  m_axi_weights_BRESP,
  m_axi_weights_BVALID,
  m_axi_weights_BREADY,
  m_axi_weights_ARID,
  m_axi_weights_ARADDR,
  m_axi_weights_ARLEN,
  m_axi_weights_ARSIZE,
  m_axi_weights_ARBURST,
  m_axi_weights_ARLOCK,
  m_axi_weights_ARREGION,
  m_axi_weights_ARCACHE,
  m_axi_weights_ARPROT,
  m_axi_weights_ARQOS,
  m_axi_weights_ARVALID,
  m_axi_weights_ARREADY,
  m_axi_weights_RID,
  m_axi_weights_RDATA,
  m_axi_weights_RRESP,
  m_axi_weights_RLAST,
  m_axi_weights_RVALID,
  m_axi_weights_RREADY,
  noisy_fft_stream_TVALID,
  noisy_fft_stream_TREADY,
  noisy_fft_stream_TDATA,
  noisy_fft_stream_TLAST,
  noisy_fft_stream_TKEEP,
  noisy_fft_stream_TSTRB,
  fb_fft_stream_TVALID,
  fb_fft_stream_TREADY,
  fb_fft_stream_TDATA,
  fb_fft_stream_TLAST,
  fb_fft_stream_TKEEP,
  fb_fft_stream_TSTRB,
  df_coef_stream_TVALID,
  df_coef_stream_TREADY,
  df_coef_stream_TDATA,
  df_coef_stream_TLAST,
  df_coef_stream_TKEEP,
  df_coef_stream_TSTRB
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *)
input wire [5 : 0] s_axi_control_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *)
input wire s_axi_control_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *)
output wire s_axi_control_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *)
input wire [31 : 0] s_axi_control_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *)
input wire [3 : 0] s_axi_control_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *)
input wire s_axi_control_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *)
output wire s_axi_control_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *)
output wire [1 : 0] s_axi_control_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *)
output wire s_axi_control_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *)
input wire s_axi_control_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *)
input wire [5 : 0] s_axi_control_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *)
input wire s_axi_control_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *)
output wire s_axi_control_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *)
output wire [31 : 0] s_axi_control_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *)
output wire [1 : 0] s_axi_control_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *)
output wire s_axi_control_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 6, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN realtime_dma_bd_ps7_0_0_FCLK_CLK0, NUM_READ_THREADS 1\
, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *)
input wire s_axi_control_RREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control:m_axi_weights:noisy_fft_stream:fb_fft_stream:df_coef_stream, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN realtime_dma_bd_ps7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
output wire interrupt;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights AWID" *)
output wire [0 : 0] m_axi_weights_AWID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights AWADDR" *)
output wire [31 : 0] m_axi_weights_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights AWLEN" *)
output wire [7 : 0] m_axi_weights_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights AWSIZE" *)
output wire [2 : 0] m_axi_weights_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights AWBURST" *)
output wire [1 : 0] m_axi_weights_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights AWLOCK" *)
output wire [1 : 0] m_axi_weights_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights AWREGION" *)
output wire [3 : 0] m_axi_weights_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights AWCACHE" *)
output wire [3 : 0] m_axi_weights_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights AWPROT" *)
output wire [2 : 0] m_axi_weights_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights AWQOS" *)
output wire [3 : 0] m_axi_weights_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights AWVALID" *)
output wire m_axi_weights_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights AWREADY" *)
input wire m_axi_weights_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights WID" *)
output wire [0 : 0] m_axi_weights_WID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights WDATA" *)
output wire [255 : 0] m_axi_weights_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights WSTRB" *)
output wire [31 : 0] m_axi_weights_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights WLAST" *)
output wire m_axi_weights_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights WVALID" *)
output wire m_axi_weights_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights WREADY" *)
input wire m_axi_weights_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights BID" *)
input wire [0 : 0] m_axi_weights_BID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights BRESP" *)
input wire [1 : 0] m_axi_weights_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights BVALID" *)
input wire m_axi_weights_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights BREADY" *)
output wire m_axi_weights_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights ARID" *)
output wire [0 : 0] m_axi_weights_ARID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights ARADDR" *)
output wire [31 : 0] m_axi_weights_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights ARLEN" *)
output wire [7 : 0] m_axi_weights_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights ARSIZE" *)
output wire [2 : 0] m_axi_weights_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights ARBURST" *)
output wire [1 : 0] m_axi_weights_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights ARLOCK" *)
output wire [1 : 0] m_axi_weights_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights ARREGION" *)
output wire [3 : 0] m_axi_weights_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights ARCACHE" *)
output wire [3 : 0] m_axi_weights_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights ARPROT" *)
output wire [2 : 0] m_axi_weights_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights ARQOS" *)
output wire [3 : 0] m_axi_weights_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights ARVALID" *)
output wire m_axi_weights_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights ARREADY" *)
input wire m_axi_weights_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights RID" *)
input wire [0 : 0] m_axi_weights_RID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights RDATA" *)
input wire [255 : 0] m_axi_weights_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights RRESP" *)
input wire [1 : 0] m_axi_weights_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights RLAST" *)
input wire m_axi_weights_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights RVALID" *)
input wire m_axi_weights_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_weights, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, MAX_BURST_LENGTH 256, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 256, FREQ_HZ 100000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN r\
ealtime_dma_bd_ps7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_weights RREADY" *)
output wire m_axi_weights_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 noisy_fft_stream TVALID" *)
input wire noisy_fft_stream_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 noisy_fft_stream TREADY" *)
output wire noisy_fft_stream_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 noisy_fft_stream TDATA" *)
input wire [15 : 0] noisy_fft_stream_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 noisy_fft_stream TLAST" *)
input wire [0 : 0] noisy_fft_stream_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 noisy_fft_stream TKEEP" *)
input wire [1 : 0] noisy_fft_stream_TKEEP;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME noisy_fft_stream, TDATA_NUM_BYTES 2, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN realtime_dma_bd_ps7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 noisy_fft_stream TSTRB" *)
input wire [1 : 0] noisy_fft_stream_TSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 fb_fft_stream TVALID" *)
input wire fb_fft_stream_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 fb_fft_stream TREADY" *)
output wire fb_fft_stream_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 fb_fft_stream TDATA" *)
input wire [15 : 0] fb_fft_stream_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 fb_fft_stream TLAST" *)
input wire [0 : 0] fb_fft_stream_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 fb_fft_stream TKEEP" *)
input wire [1 : 0] fb_fft_stream_TKEEP;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fb_fft_stream, TDATA_NUM_BYTES 2, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN realtime_dma_bd_ps7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 fb_fft_stream TSTRB" *)
input wire [1 : 0] fb_fft_stream_TSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 df_coef_stream TVALID" *)
output wire df_coef_stream_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 df_coef_stream TREADY" *)
input wire df_coef_stream_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 df_coef_stream TDATA" *)
output wire [15 : 0] df_coef_stream_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 df_coef_stream TLAST" *)
output wire [0 : 0] df_coef_stream_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 df_coef_stream TKEEP" *)
output wire [1 : 0] df_coef_stream_TKEEP;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME df_coef_stream, TDATA_NUM_BYTES 2, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN realtime_dma_bd_ps7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 df_coef_stream TSTRB" *)
output wire [1 : 0] df_coef_stream_TSTRB;

(* SDX_KERNEL = "true" *)
(* SDX_KERNEL_TYPE = "hls" *)
(* SDX_KERNEL_SIM_INST = "" *)
  SubbandRealtimeTopQ610Ip #(
    .C_S_AXI_CONTROL_ADDR_WIDTH(6),
    .C_S_AXI_CONTROL_DATA_WIDTH(32),
    .C_M_AXI_WEIGHTS_ID_WIDTH(1),
    .C_M_AXI_WEIGHTS_ADDR_WIDTH(32),
    .C_M_AXI_WEIGHTS_DATA_WIDTH(256),
    .C_M_AXI_WEIGHTS_AWUSER_WIDTH(1),
    .C_M_AXI_WEIGHTS_ARUSER_WIDTH(1),
    .C_M_AXI_WEIGHTS_WUSER_WIDTH(1),
    .C_M_AXI_WEIGHTS_RUSER_WIDTH(1),
    .C_M_AXI_WEIGHTS_BUSER_WIDTH(1),
    .C_M_AXI_WEIGHTS_USER_VALUE(32'H00000000),
    .C_M_AXI_WEIGHTS_PROT_VALUE(3'B000),
    .C_M_AXI_WEIGHTS_CACHE_VALUE(4'B0011)
  ) inst (
    .s_axi_control_AWADDR(s_axi_control_AWADDR),
    .s_axi_control_AWVALID(s_axi_control_AWVALID),
    .s_axi_control_AWREADY(s_axi_control_AWREADY),
    .s_axi_control_WDATA(s_axi_control_WDATA),
    .s_axi_control_WSTRB(s_axi_control_WSTRB),
    .s_axi_control_WVALID(s_axi_control_WVALID),
    .s_axi_control_WREADY(s_axi_control_WREADY),
    .s_axi_control_BRESP(s_axi_control_BRESP),
    .s_axi_control_BVALID(s_axi_control_BVALID),
    .s_axi_control_BREADY(s_axi_control_BREADY),
    .s_axi_control_ARADDR(s_axi_control_ARADDR),
    .s_axi_control_ARVALID(s_axi_control_ARVALID),
    .s_axi_control_ARREADY(s_axi_control_ARREADY),
    .s_axi_control_RDATA(s_axi_control_RDATA),
    .s_axi_control_RRESP(s_axi_control_RRESP),
    .s_axi_control_RVALID(s_axi_control_RVALID),
    .s_axi_control_RREADY(s_axi_control_RREADY),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .interrupt(interrupt),
    .m_axi_weights_AWID(m_axi_weights_AWID),
    .m_axi_weights_AWADDR(m_axi_weights_AWADDR),
    .m_axi_weights_AWLEN(m_axi_weights_AWLEN),
    .m_axi_weights_AWSIZE(m_axi_weights_AWSIZE),
    .m_axi_weights_AWBURST(m_axi_weights_AWBURST),
    .m_axi_weights_AWLOCK(m_axi_weights_AWLOCK),
    .m_axi_weights_AWREGION(m_axi_weights_AWREGION),
    .m_axi_weights_AWCACHE(m_axi_weights_AWCACHE),
    .m_axi_weights_AWPROT(m_axi_weights_AWPROT),
    .m_axi_weights_AWQOS(m_axi_weights_AWQOS),
    .m_axi_weights_AWUSER(),
    .m_axi_weights_AWVALID(m_axi_weights_AWVALID),
    .m_axi_weights_AWREADY(m_axi_weights_AWREADY),
    .m_axi_weights_WID(m_axi_weights_WID),
    .m_axi_weights_WDATA(m_axi_weights_WDATA),
    .m_axi_weights_WSTRB(m_axi_weights_WSTRB),
    .m_axi_weights_WLAST(m_axi_weights_WLAST),
    .m_axi_weights_WUSER(),
    .m_axi_weights_WVALID(m_axi_weights_WVALID),
    .m_axi_weights_WREADY(m_axi_weights_WREADY),
    .m_axi_weights_BID(m_axi_weights_BID),
    .m_axi_weights_BRESP(m_axi_weights_BRESP),
    .m_axi_weights_BUSER(1'B0),
    .m_axi_weights_BVALID(m_axi_weights_BVALID),
    .m_axi_weights_BREADY(m_axi_weights_BREADY),
    .m_axi_weights_ARID(m_axi_weights_ARID),
    .m_axi_weights_ARADDR(m_axi_weights_ARADDR),
    .m_axi_weights_ARLEN(m_axi_weights_ARLEN),
    .m_axi_weights_ARSIZE(m_axi_weights_ARSIZE),
    .m_axi_weights_ARBURST(m_axi_weights_ARBURST),
    .m_axi_weights_ARLOCK(m_axi_weights_ARLOCK),
    .m_axi_weights_ARREGION(m_axi_weights_ARREGION),
    .m_axi_weights_ARCACHE(m_axi_weights_ARCACHE),
    .m_axi_weights_ARPROT(m_axi_weights_ARPROT),
    .m_axi_weights_ARQOS(m_axi_weights_ARQOS),
    .m_axi_weights_ARUSER(),
    .m_axi_weights_ARVALID(m_axi_weights_ARVALID),
    .m_axi_weights_ARREADY(m_axi_weights_ARREADY),
    .m_axi_weights_RID(m_axi_weights_RID),
    .m_axi_weights_RDATA(m_axi_weights_RDATA),
    .m_axi_weights_RRESP(m_axi_weights_RRESP),
    .m_axi_weights_RLAST(m_axi_weights_RLAST),
    .m_axi_weights_RUSER(1'B0),
    .m_axi_weights_RVALID(m_axi_weights_RVALID),
    .m_axi_weights_RREADY(m_axi_weights_RREADY),
    .noisy_fft_stream_TVALID(noisy_fft_stream_TVALID),
    .noisy_fft_stream_TREADY(noisy_fft_stream_TREADY),
    .noisy_fft_stream_TDATA(noisy_fft_stream_TDATA),
    .noisy_fft_stream_TLAST(noisy_fft_stream_TLAST),
    .noisy_fft_stream_TKEEP(noisy_fft_stream_TKEEP),
    .noisy_fft_stream_TSTRB(noisy_fft_stream_TSTRB),
    .fb_fft_stream_TVALID(fb_fft_stream_TVALID),
    .fb_fft_stream_TREADY(fb_fft_stream_TREADY),
    .fb_fft_stream_TDATA(fb_fft_stream_TDATA),
    .fb_fft_stream_TLAST(fb_fft_stream_TLAST),
    .fb_fft_stream_TKEEP(fb_fft_stream_TKEEP),
    .fb_fft_stream_TSTRB(fb_fft_stream_TSTRB),
    .df_coef_stream_TVALID(df_coef_stream_TVALID),
    .df_coef_stream_TREADY(df_coef_stream_TREADY),
    .df_coef_stream_TDATA(df_coef_stream_TDATA),
    .df_coef_stream_TLAST(df_coef_stream_TLAST),
    .df_coef_stream_TKEEP(df_coef_stream_TKEEP),
    .df_coef_stream_TSTRB(df_coef_stream_TSTRB)
  );
endmodule

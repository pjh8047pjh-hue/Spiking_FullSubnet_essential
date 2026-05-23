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


// IP VLNV: user.org:subband:projection_axis_adapter:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module rt_bd_projection_adapter_0_0 (
  ap_clk,
  ap_rst,
  s_axis_req_tdata,
  s_axis_req_tvalid,
  s_axis_req_tready,
  s_axis_req_tlast,
  m_axis_resp_tdata,
  m_axis_resp_tvalid,
  m_axis_resp_tready,
  m_axis_resp_tlast
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, ASSOCIATED_BUSIF s_axis_req:m_axis_resp, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN rt_bd_ps7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst RST" *)
input wire ap_rst;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_req TDATA" *)
input wire [15 : 0] s_axis_req_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_req TVALID" *)
input wire s_axis_req_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_req TREADY" *)
output wire s_axis_req_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_req, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN rt_bd_ps7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_req TLAST" *)
input wire s_axis_req_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_resp TDATA" *)
output wire [15 : 0] m_axis_resp_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_resp TVALID" *)
output wire m_axis_resp_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_resp TREADY" *)
input wire m_axis_resp_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_resp, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN rt_bd_ps7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_resp TLAST" *)
output wire m_axis_resp_tlast;

  projection_axis_adapter inst (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .s_axis_req_tdata(s_axis_req_tdata),
    .s_axis_req_tvalid(s_axis_req_tvalid),
    .s_axis_req_tready(s_axis_req_tready),
    .s_axis_req_tlast(s_axis_req_tlast),
    .m_axis_resp_tdata(m_axis_resp_tdata),
    .m_axis_resp_tvalid(m_axis_resp_tvalid),
    .m_axis_resp_tready(m_axis_resp_tready),
    .m_axis_resp_tlast(m_axis_resp_tlast)
  );
endmodule

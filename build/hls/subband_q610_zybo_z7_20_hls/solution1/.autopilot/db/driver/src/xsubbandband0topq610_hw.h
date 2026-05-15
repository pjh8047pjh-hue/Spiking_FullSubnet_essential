// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of noisy_input_q610
//        bit 31~0 - noisy_input_q610[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of fb_output_q610
//        bit 31~0 - fb_output_q610[31:0] (Read/Write)
// 0x1c : reserved
// 0x20 : Data signal of layer0_weight_ih_q610
//        bit 31~0 - layer0_weight_ih_q610[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of layer0_weight_hh_q610
//        bit 31~0 - layer0_weight_hh_q610[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of layer0_bias_ih_q610
//        bit 31~0 - layer0_bias_ih_q610[31:0] (Read/Write)
// 0x34 : reserved
// 0x38 : Data signal of layer0_bn_mul_q610
//        bit 31~0 - layer0_bn_mul_q610[31:0] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of layer0_bn_add_q610
//        bit 31~0 - layer0_bn_add_q610[31:0] (Read/Write)
// 0x44 : reserved
// 0x48 : Data signal of layer1_weight_ih_q610
//        bit 31~0 - layer1_weight_ih_q610[31:0] (Read/Write)
// 0x4c : reserved
// 0x50 : Data signal of layer1_weight_hh_q610
//        bit 31~0 - layer1_weight_hh_q610[31:0] (Read/Write)
// 0x54 : reserved
// 0x58 : Data signal of layer1_bias_ih_q610
//        bit 31~0 - layer1_bias_ih_q610[31:0] (Read/Write)
// 0x5c : reserved
// 0x60 : Data signal of layer1_bn_mul_q610
//        bit 31~0 - layer1_bn_mul_q610[31:0] (Read/Write)
// 0x64 : reserved
// 0x68 : Data signal of layer1_bn_add_q610
//        bit 31~0 - layer1_bn_add_q610[31:0] (Read/Write)
// 0x6c : reserved
// 0x70 : Data signal of proj_weight_q610
//        bit 31~0 - proj_weight_q610[31:0] (Read/Write)
// 0x74 : reserved
// 0x78 : Data signal of proj_bias_q610
//        bit 31~0 - proj_bias_q610[31:0] (Read/Write)
// 0x7c : reserved
// 0x80 : Data signal of df_coef_q610
//        bit 31~0 - df_coef_q610[31:0] (Read/Write)
// 0x84 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_AP_CTRL                    0x00
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_GIE                        0x04
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_IER                        0x08
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_ISR                        0x0c
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_NOISY_INPUT_Q610_DATA      0x10
#define XSUBBANDBAND0TOPQ610_CONTROL_BITS_NOISY_INPUT_Q610_DATA      32
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_FB_OUTPUT_Q610_DATA        0x18
#define XSUBBANDBAND0TOPQ610_CONTROL_BITS_FB_OUTPUT_Q610_DATA        32
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER0_WEIGHT_IH_Q610_DATA 0x20
#define XSUBBANDBAND0TOPQ610_CONTROL_BITS_LAYER0_WEIGHT_IH_Q610_DATA 32
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER0_WEIGHT_HH_Q610_DATA 0x28
#define XSUBBANDBAND0TOPQ610_CONTROL_BITS_LAYER0_WEIGHT_HH_Q610_DATA 32
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER0_BIAS_IH_Q610_DATA   0x30
#define XSUBBANDBAND0TOPQ610_CONTROL_BITS_LAYER0_BIAS_IH_Q610_DATA   32
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER0_BN_MUL_Q610_DATA    0x38
#define XSUBBANDBAND0TOPQ610_CONTROL_BITS_LAYER0_BN_MUL_Q610_DATA    32
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER0_BN_ADD_Q610_DATA    0x40
#define XSUBBANDBAND0TOPQ610_CONTROL_BITS_LAYER0_BN_ADD_Q610_DATA    32
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER1_WEIGHT_IH_Q610_DATA 0x48
#define XSUBBANDBAND0TOPQ610_CONTROL_BITS_LAYER1_WEIGHT_IH_Q610_DATA 32
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER1_WEIGHT_HH_Q610_DATA 0x50
#define XSUBBANDBAND0TOPQ610_CONTROL_BITS_LAYER1_WEIGHT_HH_Q610_DATA 32
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER1_BIAS_IH_Q610_DATA   0x58
#define XSUBBANDBAND0TOPQ610_CONTROL_BITS_LAYER1_BIAS_IH_Q610_DATA   32
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER1_BN_MUL_Q610_DATA    0x60
#define XSUBBANDBAND0TOPQ610_CONTROL_BITS_LAYER1_BN_MUL_Q610_DATA    32
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER1_BN_ADD_Q610_DATA    0x68
#define XSUBBANDBAND0TOPQ610_CONTROL_BITS_LAYER1_BN_ADD_Q610_DATA    32
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_PROJ_WEIGHT_Q610_DATA      0x70
#define XSUBBANDBAND0TOPQ610_CONTROL_BITS_PROJ_WEIGHT_Q610_DATA      32
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_PROJ_BIAS_Q610_DATA        0x78
#define XSUBBANDBAND0TOPQ610_CONTROL_BITS_PROJ_BIAS_Q610_DATA        32
#define XSUBBANDBAND0TOPQ610_CONTROL_ADDR_DF_COEF_Q610_DATA          0x80
#define XSUBBANDBAND0TOPQ610_CONTROL_BITS_DF_COEF_Q610_DATA          32


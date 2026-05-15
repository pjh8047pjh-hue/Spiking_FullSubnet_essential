// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xsubbandband0topq610.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSubbandband0topq610_CfgInitialize(XSubbandband0topq610 *InstancePtr, XSubbandband0topq610_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSubbandband0topq610_Start(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_AP_CTRL) & 0x80;
    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSubbandband0topq610_IsDone(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSubbandband0topq610_IsIdle(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSubbandband0topq610_IsReady(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSubbandband0topq610_EnableAutoRestart(XSubbandband0topq610 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XSubbandband0topq610_DisableAutoRestart(XSubbandband0topq610 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_AP_CTRL, 0);
}

void XSubbandband0topq610_Set_noisy_input_q610(XSubbandband0topq610 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_NOISY_INPUT_Q610_DATA, Data);
}

u32 XSubbandband0topq610_Get_noisy_input_q610(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_NOISY_INPUT_Q610_DATA);
    return Data;
}

void XSubbandband0topq610_Set_fb_output_q610(XSubbandband0topq610 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_FB_OUTPUT_Q610_DATA, Data);
}

u32 XSubbandband0topq610_Get_fb_output_q610(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_FB_OUTPUT_Q610_DATA);
    return Data;
}

void XSubbandband0topq610_Set_layer0_weight_ih_q610(XSubbandband0topq610 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER0_WEIGHT_IH_Q610_DATA, Data);
}

u32 XSubbandband0topq610_Get_layer0_weight_ih_q610(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER0_WEIGHT_IH_Q610_DATA);
    return Data;
}

void XSubbandband0topq610_Set_layer0_weight_hh_q610(XSubbandband0topq610 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER0_WEIGHT_HH_Q610_DATA, Data);
}

u32 XSubbandband0topq610_Get_layer0_weight_hh_q610(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER0_WEIGHT_HH_Q610_DATA);
    return Data;
}

void XSubbandband0topq610_Set_layer0_bias_ih_q610(XSubbandband0topq610 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER0_BIAS_IH_Q610_DATA, Data);
}

u32 XSubbandband0topq610_Get_layer0_bias_ih_q610(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER0_BIAS_IH_Q610_DATA);
    return Data;
}

void XSubbandband0topq610_Set_layer0_bn_mul_q610(XSubbandband0topq610 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER0_BN_MUL_Q610_DATA, Data);
}

u32 XSubbandband0topq610_Get_layer0_bn_mul_q610(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER0_BN_MUL_Q610_DATA);
    return Data;
}

void XSubbandband0topq610_Set_layer0_bn_add_q610(XSubbandband0topq610 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER0_BN_ADD_Q610_DATA, Data);
}

u32 XSubbandband0topq610_Get_layer0_bn_add_q610(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER0_BN_ADD_Q610_DATA);
    return Data;
}

void XSubbandband0topq610_Set_layer1_weight_ih_q610(XSubbandband0topq610 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER1_WEIGHT_IH_Q610_DATA, Data);
}

u32 XSubbandband0topq610_Get_layer1_weight_ih_q610(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER1_WEIGHT_IH_Q610_DATA);
    return Data;
}

void XSubbandband0topq610_Set_layer1_weight_hh_q610(XSubbandband0topq610 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER1_WEIGHT_HH_Q610_DATA, Data);
}

u32 XSubbandband0topq610_Get_layer1_weight_hh_q610(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER1_WEIGHT_HH_Q610_DATA);
    return Data;
}

void XSubbandband0topq610_Set_layer1_bias_ih_q610(XSubbandband0topq610 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER1_BIAS_IH_Q610_DATA, Data);
}

u32 XSubbandband0topq610_Get_layer1_bias_ih_q610(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER1_BIAS_IH_Q610_DATA);
    return Data;
}

void XSubbandband0topq610_Set_layer1_bn_mul_q610(XSubbandband0topq610 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER1_BN_MUL_Q610_DATA, Data);
}

u32 XSubbandband0topq610_Get_layer1_bn_mul_q610(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER1_BN_MUL_Q610_DATA);
    return Data;
}

void XSubbandband0topq610_Set_layer1_bn_add_q610(XSubbandband0topq610 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER1_BN_ADD_Q610_DATA, Data);
}

u32 XSubbandband0topq610_Get_layer1_bn_add_q610(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_LAYER1_BN_ADD_Q610_DATA);
    return Data;
}

void XSubbandband0topq610_Set_proj_weight_q610(XSubbandband0topq610 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_PROJ_WEIGHT_Q610_DATA, Data);
}

u32 XSubbandband0topq610_Get_proj_weight_q610(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_PROJ_WEIGHT_Q610_DATA);
    return Data;
}

void XSubbandband0topq610_Set_proj_bias_q610(XSubbandband0topq610 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_PROJ_BIAS_Q610_DATA, Data);
}

u32 XSubbandband0topq610_Get_proj_bias_q610(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_PROJ_BIAS_Q610_DATA);
    return Data;
}

void XSubbandband0topq610_Set_df_coef_q610(XSubbandband0topq610 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_DF_COEF_Q610_DATA, Data);
}

u32 XSubbandband0topq610_Get_df_coef_q610(XSubbandband0topq610 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_DF_COEF_Q610_DATA);
    return Data;
}

void XSubbandband0topq610_InterruptGlobalEnable(XSubbandband0topq610 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_GIE, 1);
}

void XSubbandband0topq610_InterruptGlobalDisable(XSubbandband0topq610 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_GIE, 0);
}

void XSubbandband0topq610_InterruptEnable(XSubbandband0topq610 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_IER);
    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_IER, Register | Mask);
}

void XSubbandband0topq610_InterruptDisable(XSubbandband0topq610 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_IER);
    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_IER, Register & (~Mask));
}

void XSubbandband0topq610_InterruptClear(XSubbandband0topq610 *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandband0topq610_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_ISR, Mask);
}

u32 XSubbandband0topq610_InterruptGetEnabled(XSubbandband0topq610 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_IER);
}

u32 XSubbandband0topq610_InterruptGetStatus(XSubbandband0topq610 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSubbandband0topq610_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDBAND0TOPQ610_CONTROL_ADDR_ISR);
}


// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xsubbandrealtimetopq610ip.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSubbandrealtimetopq610ip_CfgInitialize(XSubbandrealtimetopq610ip *InstancePtr, XSubbandrealtimetopq610ip_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSubbandrealtimetopq610ip_Start(XSubbandrealtimetopq610ip *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandrealtimetopq610ip_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_AP_CTRL) & 0x80;
    XSubbandrealtimetopq610ip_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSubbandrealtimetopq610ip_IsDone(XSubbandrealtimetopq610ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandrealtimetopq610ip_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSubbandrealtimetopq610ip_IsIdle(XSubbandrealtimetopq610ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandrealtimetopq610ip_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSubbandrealtimetopq610ip_IsReady(XSubbandrealtimetopq610ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandrealtimetopq610ip_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSubbandrealtimetopq610ip_EnableAutoRestart(XSubbandrealtimetopq610ip *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandrealtimetopq610ip_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XSubbandrealtimetopq610ip_DisableAutoRestart(XSubbandrealtimetopq610ip *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandrealtimetopq610ip_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_AP_CTRL, 0);
}

void XSubbandrealtimetopq610ip_Set_weights_q610(XSubbandrealtimetopq610ip *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandrealtimetopq610ip_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_WEIGHTS_Q610_DATA, Data);
}

u32 XSubbandrealtimetopq610ip_Get_weights_q610(XSubbandrealtimetopq610ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandrealtimetopq610ip_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_WEIGHTS_Q610_DATA);
    return Data;
}

void XSubbandrealtimetopq610ip_Set_num_frames(XSubbandrealtimetopq610ip *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandrealtimetopq610ip_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_NUM_FRAMES_DATA, Data);
}

u32 XSubbandrealtimetopq610ip_Get_num_frames(XSubbandrealtimetopq610ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandrealtimetopq610ip_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_NUM_FRAMES_DATA);
    return Data;
}

void XSubbandrealtimetopq610ip_Set_reset_state(XSubbandrealtimetopq610ip *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandrealtimetopq610ip_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_RESET_STATE_DATA, Data);
}

u32 XSubbandrealtimetopq610ip_Get_reset_state(XSubbandrealtimetopq610ip *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubbandrealtimetopq610ip_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_RESET_STATE_DATA);
    return Data;
}

void XSubbandrealtimetopq610ip_InterruptGlobalEnable(XSubbandrealtimetopq610ip *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandrealtimetopq610ip_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_GIE, 1);
}

void XSubbandrealtimetopq610ip_InterruptGlobalDisable(XSubbandrealtimetopq610ip *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandrealtimetopq610ip_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_GIE, 0);
}

void XSubbandrealtimetopq610ip_InterruptEnable(XSubbandrealtimetopq610ip *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSubbandrealtimetopq610ip_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_IER);
    XSubbandrealtimetopq610ip_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_IER, Register | Mask);
}

void XSubbandrealtimetopq610ip_InterruptDisable(XSubbandrealtimetopq610ip *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSubbandrealtimetopq610ip_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_IER);
    XSubbandrealtimetopq610ip_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_IER, Register & (~Mask));
}

void XSubbandrealtimetopq610ip_InterruptClear(XSubbandrealtimetopq610ip *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubbandrealtimetopq610ip_WriteReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_ISR, Mask);
}

u32 XSubbandrealtimetopq610ip_InterruptGetEnabled(XSubbandrealtimetopq610ip *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSubbandrealtimetopq610ip_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_IER);
}

u32 XSubbandrealtimetopq610ip_InterruptGetStatus(XSubbandrealtimetopq610ip *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSubbandrealtimetopq610ip_ReadReg(InstancePtr->Control_BaseAddress, XSUBBANDREALTIMETOPQ610IP_CONTROL_ADDR_ISR);
}


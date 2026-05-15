// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XSUBBANDBAND0TOPQ610_H
#define XSUBBANDBAND0TOPQ610_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xsubbandband0topq610_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u32 Control_BaseAddress;
} XSubbandband0topq610_Config;
#endif

typedef struct {
    u32 Control_BaseAddress;
    u32 IsReady;
} XSubbandband0topq610;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XSubbandband0topq610_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XSubbandband0topq610_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XSubbandband0topq610_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XSubbandband0topq610_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XSubbandband0topq610_Initialize(XSubbandband0topq610 *InstancePtr, UINTPTR BaseAddress);
XSubbandband0topq610_Config* XSubbandband0topq610_LookupConfig(UINTPTR BaseAddress);
#else
int XSubbandband0topq610_Initialize(XSubbandband0topq610 *InstancePtr, u16 DeviceId);
XSubbandband0topq610_Config* XSubbandband0topq610_LookupConfig(u16 DeviceId);
#endif
int XSubbandband0topq610_CfgInitialize(XSubbandband0topq610 *InstancePtr, XSubbandband0topq610_Config *ConfigPtr);
#else
int XSubbandband0topq610_Initialize(XSubbandband0topq610 *InstancePtr, const char* InstanceName);
int XSubbandband0topq610_Release(XSubbandband0topq610 *InstancePtr);
#endif

void XSubbandband0topq610_Start(XSubbandband0topq610 *InstancePtr);
u32 XSubbandband0topq610_IsDone(XSubbandband0topq610 *InstancePtr);
u32 XSubbandband0topq610_IsIdle(XSubbandband0topq610 *InstancePtr);
u32 XSubbandband0topq610_IsReady(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_EnableAutoRestart(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_DisableAutoRestart(XSubbandband0topq610 *InstancePtr);

void XSubbandband0topq610_Set_noisy_input_q610(XSubbandband0topq610 *InstancePtr, u32 Data);
u32 XSubbandband0topq610_Get_noisy_input_q610(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_Set_fb_output_q610(XSubbandband0topq610 *InstancePtr, u32 Data);
u32 XSubbandband0topq610_Get_fb_output_q610(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_Set_layer0_weight_ih_q610(XSubbandband0topq610 *InstancePtr, u32 Data);
u32 XSubbandband0topq610_Get_layer0_weight_ih_q610(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_Set_layer0_weight_hh_q610(XSubbandband0topq610 *InstancePtr, u32 Data);
u32 XSubbandband0topq610_Get_layer0_weight_hh_q610(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_Set_layer0_bias_ih_q610(XSubbandband0topq610 *InstancePtr, u32 Data);
u32 XSubbandband0topq610_Get_layer0_bias_ih_q610(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_Set_layer0_bn_mul_q610(XSubbandband0topq610 *InstancePtr, u32 Data);
u32 XSubbandband0topq610_Get_layer0_bn_mul_q610(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_Set_layer0_bn_add_q610(XSubbandband0topq610 *InstancePtr, u32 Data);
u32 XSubbandband0topq610_Get_layer0_bn_add_q610(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_Set_layer1_weight_ih_q610(XSubbandband0topq610 *InstancePtr, u32 Data);
u32 XSubbandband0topq610_Get_layer1_weight_ih_q610(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_Set_layer1_weight_hh_q610(XSubbandband0topq610 *InstancePtr, u32 Data);
u32 XSubbandband0topq610_Get_layer1_weight_hh_q610(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_Set_layer1_bias_ih_q610(XSubbandband0topq610 *InstancePtr, u32 Data);
u32 XSubbandband0topq610_Get_layer1_bias_ih_q610(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_Set_layer1_bn_mul_q610(XSubbandband0topq610 *InstancePtr, u32 Data);
u32 XSubbandband0topq610_Get_layer1_bn_mul_q610(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_Set_layer1_bn_add_q610(XSubbandband0topq610 *InstancePtr, u32 Data);
u32 XSubbandband0topq610_Get_layer1_bn_add_q610(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_Set_proj_weight_q610(XSubbandband0topq610 *InstancePtr, u32 Data);
u32 XSubbandband0topq610_Get_proj_weight_q610(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_Set_proj_bias_q610(XSubbandband0topq610 *InstancePtr, u32 Data);
u32 XSubbandband0topq610_Get_proj_bias_q610(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_Set_df_coef_q610(XSubbandband0topq610 *InstancePtr, u32 Data);
u32 XSubbandband0topq610_Get_df_coef_q610(XSubbandband0topq610 *InstancePtr);

void XSubbandband0topq610_InterruptGlobalEnable(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_InterruptGlobalDisable(XSubbandband0topq610 *InstancePtr);
void XSubbandband0topq610_InterruptEnable(XSubbandband0topq610 *InstancePtr, u32 Mask);
void XSubbandband0topq610_InterruptDisable(XSubbandband0topq610 *InstancePtr, u32 Mask);
void XSubbandband0topq610_InterruptClear(XSubbandband0topq610 *InstancePtr, u32 Mask);
u32 XSubbandband0topq610_InterruptGetEnabled(XSubbandband0topq610 *InstancePtr);
u32 XSubbandband0topq610_InterruptGetStatus(XSubbandband0topq610 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif

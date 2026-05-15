// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XSUBBANDREALTIMETOPQ610IP_H
#define XSUBBANDREALTIMETOPQ610IP_H

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
#include "xsubbandrealtimetopq610ip_hw.h"

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
} XSubbandrealtimetopq610ip_Config;
#endif

typedef struct {
    u32 Control_BaseAddress;
    u32 IsReady;
} XSubbandrealtimetopq610ip;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XSubbandrealtimetopq610ip_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XSubbandrealtimetopq610ip_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XSubbandrealtimetopq610ip_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XSubbandrealtimetopq610ip_ReadReg(BaseAddress, RegOffset) \
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
int XSubbandrealtimetopq610ip_Initialize(XSubbandrealtimetopq610ip *InstancePtr, UINTPTR BaseAddress);
XSubbandrealtimetopq610ip_Config* XSubbandrealtimetopq610ip_LookupConfig(UINTPTR BaseAddress);
#else
int XSubbandrealtimetopq610ip_Initialize(XSubbandrealtimetopq610ip *InstancePtr, u16 DeviceId);
XSubbandrealtimetopq610ip_Config* XSubbandrealtimetopq610ip_LookupConfig(u16 DeviceId);
#endif
int XSubbandrealtimetopq610ip_CfgInitialize(XSubbandrealtimetopq610ip *InstancePtr, XSubbandrealtimetopq610ip_Config *ConfigPtr);
#else
int XSubbandrealtimetopq610ip_Initialize(XSubbandrealtimetopq610ip *InstancePtr, const char* InstanceName);
int XSubbandrealtimetopq610ip_Release(XSubbandrealtimetopq610ip *InstancePtr);
#endif

void XSubbandrealtimetopq610ip_Start(XSubbandrealtimetopq610ip *InstancePtr);
u32 XSubbandrealtimetopq610ip_IsDone(XSubbandrealtimetopq610ip *InstancePtr);
u32 XSubbandrealtimetopq610ip_IsIdle(XSubbandrealtimetopq610ip *InstancePtr);
u32 XSubbandrealtimetopq610ip_IsReady(XSubbandrealtimetopq610ip *InstancePtr);
void XSubbandrealtimetopq610ip_EnableAutoRestart(XSubbandrealtimetopq610ip *InstancePtr);
void XSubbandrealtimetopq610ip_DisableAutoRestart(XSubbandrealtimetopq610ip *InstancePtr);

void XSubbandrealtimetopq610ip_Set_weights_q610(XSubbandrealtimetopq610ip *InstancePtr, u32 Data);
u32 XSubbandrealtimetopq610ip_Get_weights_q610(XSubbandrealtimetopq610ip *InstancePtr);
void XSubbandrealtimetopq610ip_Set_num_frames(XSubbandrealtimetopq610ip *InstancePtr, u32 Data);
u32 XSubbandrealtimetopq610ip_Get_num_frames(XSubbandrealtimetopq610ip *InstancePtr);
void XSubbandrealtimetopq610ip_Set_reset_state(XSubbandrealtimetopq610ip *InstancePtr, u32 Data);
u32 XSubbandrealtimetopq610ip_Get_reset_state(XSubbandrealtimetopq610ip *InstancePtr);

void XSubbandrealtimetopq610ip_InterruptGlobalEnable(XSubbandrealtimetopq610ip *InstancePtr);
void XSubbandrealtimetopq610ip_InterruptGlobalDisable(XSubbandrealtimetopq610ip *InstancePtr);
void XSubbandrealtimetopq610ip_InterruptEnable(XSubbandrealtimetopq610ip *InstancePtr, u32 Mask);
void XSubbandrealtimetopq610ip_InterruptDisable(XSubbandrealtimetopq610ip *InstancePtr, u32 Mask);
void XSubbandrealtimetopq610ip_InterruptClear(XSubbandrealtimetopq610ip *InstancePtr, u32 Mask);
u32 XSubbandrealtimetopq610ip_InterruptGetEnabled(XSubbandrealtimetopq610ip *InstancePtr);
u32 XSubbandrealtimetopq610ip_InterruptGetStatus(XSubbandrealtimetopq610ip *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif

// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xsubbandrealtimetopq610ip.h"

extern XSubbandrealtimetopq610ip_Config XSubbandrealtimetopq610ip_ConfigTable[];

#ifdef SDT
XSubbandrealtimetopq610ip_Config *XSubbandrealtimetopq610ip_LookupConfig(UINTPTR BaseAddress) {
	XSubbandrealtimetopq610ip_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XSubbandrealtimetopq610ip_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XSubbandrealtimetopq610ip_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XSubbandrealtimetopq610ip_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSubbandrealtimetopq610ip_Initialize(XSubbandrealtimetopq610ip *InstancePtr, UINTPTR BaseAddress) {
	XSubbandrealtimetopq610ip_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSubbandrealtimetopq610ip_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSubbandrealtimetopq610ip_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XSubbandrealtimetopq610ip_Config *XSubbandrealtimetopq610ip_LookupConfig(u16 DeviceId) {
	XSubbandrealtimetopq610ip_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSUBBANDREALTIMETOPQ610IP_NUM_INSTANCES; Index++) {
		if (XSubbandrealtimetopq610ip_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSubbandrealtimetopq610ip_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSubbandrealtimetopq610ip_Initialize(XSubbandrealtimetopq610ip *InstancePtr, u16 DeviceId) {
	XSubbandrealtimetopq610ip_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSubbandrealtimetopq610ip_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSubbandrealtimetopq610ip_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif


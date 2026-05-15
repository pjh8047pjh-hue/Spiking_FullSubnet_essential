set moduleName p_anonymous_namespace_RunGSUMacPhaseBand0Q610_Pipeline_VITIS_LOOP_1833_2
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {(anonymous namespace)RunGSUMacPhaseBand0Q610_Pipeline_VITIS_LOOP_1833_2}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_ptr_0_val int 16 regular  }
	{ input_ptr_4_val int 16 regular  }
	{ input_ptr_8_val int 16 regular  }
	{ input_ptr_12_val int 16 regular  }
	{ input_ptr_16_val int 16 regular  }
	{ input_ptr_20_val int 16 regular  }
	{ input_ptr_24_val int 16 regular  }
	{ input_ptr_28_val int 16 regular  }
	{ input_ptr_32_val int 16 regular  }
	{ input_ptr_36_val int 16 regular  }
	{ add_ln1839_3 int 11 regular  }
	{ input_ptr_1_val int 16 regular  }
	{ input_ptr_5_val int 16 regular  }
	{ input_ptr_9_val int 16 regular  }
	{ input_ptr_13_val int 16 regular  }
	{ input_ptr_17_val int 16 regular  }
	{ input_ptr_21_val int 16 regular  }
	{ input_ptr_25_val int 16 regular  }
	{ input_ptr_29_val int 16 regular  }
	{ input_ptr_33_val int 16 regular  }
	{ input_ptr_37_val int 16 regular  }
	{ input_ptr_2_val int 16 regular  }
	{ input_ptr_6_val int 16 regular  }
	{ input_ptr_10_val int 16 regular  }
	{ input_ptr_14_val int 16 regular  }
	{ input_ptr_18_val int 16 regular  }
	{ input_ptr_22_val int 16 regular  }
	{ input_ptr_26_val int 16 regular  }
	{ input_ptr_30_val int 16 regular  }
	{ input_ptr_34_val int 16 regular  }
	{ input_ptr_3_val int 16 regular  }
	{ input_ptr_7_val int 16 regular  }
	{ input_ptr_11_val int 16 regular  }
	{ input_ptr_15_val int 16 regular  }
	{ input_ptr_19_val int 16 regular  }
	{ input_ptr_23_val int 16 regular  }
	{ input_ptr_27_val int 16 regular  }
	{ input_ptr_31_val int 16 regular  }
	{ input_ptr_35_val int 16 regular  }
	{ p_out int 48 regular {pointer 1}  }
	{ p_out1 int 48 regular {pointer 1}  }
	{ p_out2 int 35 regular {pointer 1}  }
	{ p_out3 int 35 regular {pointer 1}  }
	{ SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12 int 64 regular {array 1120 { 1 3 } 1 1 stable  } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "input_ptr_0_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_4_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_8_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_12_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_16_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_20_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_24_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_28_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_32_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_36_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "add_ln1839_3", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_1_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_5_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_9_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_13_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_17_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_21_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_25_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_29_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_33_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_37_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_2_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_6_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_10_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_14_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_18_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_22_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_26_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_30_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_34_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_3_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_7_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_11_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_15_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_19_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_23_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_27_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_31_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_35_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_out", "interface" : "wire", "bitwidth" : 48, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out1", "interface" : "wire", "bitwidth" : 48, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out2", "interface" : "wire", "bitwidth" : 35, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out3", "interface" : "wire", "bitwidth" : 35, "direction" : "WRITEONLY"} , 
 	{ "Name" : "SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 56
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_ptr_0_val sc_in sc_lv 16 signal 0 } 
	{ input_ptr_4_val sc_in sc_lv 16 signal 1 } 
	{ input_ptr_8_val sc_in sc_lv 16 signal 2 } 
	{ input_ptr_12_val sc_in sc_lv 16 signal 3 } 
	{ input_ptr_16_val sc_in sc_lv 16 signal 4 } 
	{ input_ptr_20_val sc_in sc_lv 16 signal 5 } 
	{ input_ptr_24_val sc_in sc_lv 16 signal 6 } 
	{ input_ptr_28_val sc_in sc_lv 16 signal 7 } 
	{ input_ptr_32_val sc_in sc_lv 16 signal 8 } 
	{ input_ptr_36_val sc_in sc_lv 16 signal 9 } 
	{ add_ln1839_3 sc_in sc_lv 11 signal 10 } 
	{ input_ptr_1_val sc_in sc_lv 16 signal 11 } 
	{ input_ptr_5_val sc_in sc_lv 16 signal 12 } 
	{ input_ptr_9_val sc_in sc_lv 16 signal 13 } 
	{ input_ptr_13_val sc_in sc_lv 16 signal 14 } 
	{ input_ptr_17_val sc_in sc_lv 16 signal 15 } 
	{ input_ptr_21_val sc_in sc_lv 16 signal 16 } 
	{ input_ptr_25_val sc_in sc_lv 16 signal 17 } 
	{ input_ptr_29_val sc_in sc_lv 16 signal 18 } 
	{ input_ptr_33_val sc_in sc_lv 16 signal 19 } 
	{ input_ptr_37_val sc_in sc_lv 16 signal 20 } 
	{ input_ptr_2_val sc_in sc_lv 16 signal 21 } 
	{ input_ptr_6_val sc_in sc_lv 16 signal 22 } 
	{ input_ptr_10_val sc_in sc_lv 16 signal 23 } 
	{ input_ptr_14_val sc_in sc_lv 16 signal 24 } 
	{ input_ptr_18_val sc_in sc_lv 16 signal 25 } 
	{ input_ptr_22_val sc_in sc_lv 16 signal 26 } 
	{ input_ptr_26_val sc_in sc_lv 16 signal 27 } 
	{ input_ptr_30_val sc_in sc_lv 16 signal 28 } 
	{ input_ptr_34_val sc_in sc_lv 16 signal 29 } 
	{ input_ptr_3_val sc_in sc_lv 16 signal 30 } 
	{ input_ptr_7_val sc_in sc_lv 16 signal 31 } 
	{ input_ptr_11_val sc_in sc_lv 16 signal 32 } 
	{ input_ptr_15_val sc_in sc_lv 16 signal 33 } 
	{ input_ptr_19_val sc_in sc_lv 16 signal 34 } 
	{ input_ptr_23_val sc_in sc_lv 16 signal 35 } 
	{ input_ptr_27_val sc_in sc_lv 16 signal 36 } 
	{ input_ptr_31_val sc_in sc_lv 16 signal 37 } 
	{ input_ptr_35_val sc_in sc_lv 16 signal 38 } 
	{ p_out sc_out sc_lv 48 signal 39 } 
	{ p_out_ap_vld sc_out sc_logic 1 outvld 39 } 
	{ p_out1 sc_out sc_lv 48 signal 40 } 
	{ p_out1_ap_vld sc_out sc_logic 1 outvld 40 } 
	{ p_out2 sc_out sc_lv 35 signal 41 } 
	{ p_out2_ap_vld sc_out sc_logic 1 outvld 41 } 
	{ p_out3 sc_out sc_lv 35 signal 42 } 
	{ p_out3_ap_vld sc_out sc_logic 1 outvld 42 } 
	{ SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12_address0 sc_out sc_lv 11 signal 43 } 
	{ SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12_ce0 sc_out sc_logic 1 signal 43 } 
	{ SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12_q0 sc_in sc_lv 64 signal 43 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_ptr_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_0_val", "role": "default" }} , 
 	{ "name": "input_ptr_4_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_4_val", "role": "default" }} , 
 	{ "name": "input_ptr_8_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_8_val", "role": "default" }} , 
 	{ "name": "input_ptr_12_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_12_val", "role": "default" }} , 
 	{ "name": "input_ptr_16_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_16_val", "role": "default" }} , 
 	{ "name": "input_ptr_20_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_20_val", "role": "default" }} , 
 	{ "name": "input_ptr_24_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_24_val", "role": "default" }} , 
 	{ "name": "input_ptr_28_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_28_val", "role": "default" }} , 
 	{ "name": "input_ptr_32_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_32_val", "role": "default" }} , 
 	{ "name": "input_ptr_36_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_36_val", "role": "default" }} , 
 	{ "name": "add_ln1839_3", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "add_ln1839_3", "role": "default" }} , 
 	{ "name": "input_ptr_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_1_val", "role": "default" }} , 
 	{ "name": "input_ptr_5_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_5_val", "role": "default" }} , 
 	{ "name": "input_ptr_9_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_9_val", "role": "default" }} , 
 	{ "name": "input_ptr_13_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_13_val", "role": "default" }} , 
 	{ "name": "input_ptr_17_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_17_val", "role": "default" }} , 
 	{ "name": "input_ptr_21_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_21_val", "role": "default" }} , 
 	{ "name": "input_ptr_25_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_25_val", "role": "default" }} , 
 	{ "name": "input_ptr_29_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_29_val", "role": "default" }} , 
 	{ "name": "input_ptr_33_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_33_val", "role": "default" }} , 
 	{ "name": "input_ptr_37_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_37_val", "role": "default" }} , 
 	{ "name": "input_ptr_2_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_2_val", "role": "default" }} , 
 	{ "name": "input_ptr_6_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_6_val", "role": "default" }} , 
 	{ "name": "input_ptr_10_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_10_val", "role": "default" }} , 
 	{ "name": "input_ptr_14_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_14_val", "role": "default" }} , 
 	{ "name": "input_ptr_18_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_18_val", "role": "default" }} , 
 	{ "name": "input_ptr_22_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_22_val", "role": "default" }} , 
 	{ "name": "input_ptr_26_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_26_val", "role": "default" }} , 
 	{ "name": "input_ptr_30_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_30_val", "role": "default" }} , 
 	{ "name": "input_ptr_34_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_34_val", "role": "default" }} , 
 	{ "name": "input_ptr_3_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_3_val", "role": "default" }} , 
 	{ "name": "input_ptr_7_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_7_val", "role": "default" }} , 
 	{ "name": "input_ptr_11_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_11_val", "role": "default" }} , 
 	{ "name": "input_ptr_15_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_15_val", "role": "default" }} , 
 	{ "name": "input_ptr_19_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_19_val", "role": "default" }} , 
 	{ "name": "input_ptr_23_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_23_val", "role": "default" }} , 
 	{ "name": "input_ptr_27_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_27_val", "role": "default" }} , 
 	{ "name": "input_ptr_31_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_31_val", "role": "default" }} , 
 	{ "name": "input_ptr_35_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_35_val", "role": "default" }} , 
 	{ "name": "p_out", "direction": "out", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "p_out", "role": "default" }} , 
 	{ "name": "p_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out", "role": "ap_vld" }} , 
 	{ "name": "p_out1", "direction": "out", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "p_out1", "role": "default" }} , 
 	{ "name": "p_out1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out1", "role": "ap_vld" }} , 
 	{ "name": "p_out2", "direction": "out", "datatype": "sc_lv", "bitwidth":35, "type": "signal", "bundle":{"name": "p_out2", "role": "default" }} , 
 	{ "name": "p_out2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out2", "role": "ap_vld" }} , 
 	{ "name": "p_out3", "direction": "out", "datatype": "sc_lv", "bitwidth":35, "type": "signal", "bundle":{"name": "p_out3", "role": "default" }} , 
 	{ "name": "p_out3_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out3", "role": "ap_vld" }} , 
 	{ "name": "SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12", "role": "address0" }} , 
 	{ "name": "SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12", "role": "ce0" }} , 
 	{ "name": "SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
		"CDFG" : "p_anonymous_namespace_RunGSUMacPhaseBand0Q610_Pipeline_VITIS_LOOP_1833_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "14", "EstimateLatencyMax" : "14",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_ptr_0_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_4_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_8_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_12_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_16_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_20_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_24_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_28_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_32_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_36_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "add_ln1839_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_1_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_5_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_9_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_13_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_17_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_21_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_25_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_29_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_33_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_37_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_2_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_6_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_10_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_14_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_18_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_22_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_26_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_30_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_34_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_3_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_7_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_11_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_15_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_19_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_23_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_27_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_31_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_35_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12", "Type" : "Stable", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_1833_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_21_6_16_1_1_U1089", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_21_6_16_1_1_U1090", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_19_6_16_1_1_U1091", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_19_6_16_1_1_U1092", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_35s_35_3_1_U1093", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_35s_35_3_1_U1094", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_48s_48_3_1_U1095", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_48s_48_3_1_U1096", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	p_anonymous_namespace_RunGSUMacPhaseBand0Q610_Pipeline_VITIS_LOOP_1833_2 {
		input_ptr_0_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_4_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_8_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_12_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_16_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_20_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_24_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_28_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_32_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_36_val {Type I LastRead 0 FirstWrite -1}
		add_ln1839_3 {Type I LastRead 0 FirstWrite -1}
		input_ptr_1_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_5_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_9_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_13_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_17_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_21_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_25_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_29_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_33_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_37_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_2_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_6_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_10_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_14_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_18_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_22_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_26_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_30_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_34_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_3_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_7_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_11_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_15_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_19_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_23_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_27_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_31_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_35_val {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 2}
		p_out1 {Type O LastRead -1 FirstWrite 2}
		p_out2 {Type O LastRead -1 FirstWrite 2}
		p_out3 {Type O LastRead -1 FirstWrite 2}
		SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "14", "Max" : "14"}
	, {"Name" : "Interval", "Min" : "14", "Max" : "14"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	input_ptr_0_val { ap_none {  { input_ptr_0_val in_data 0 16 } } }
	input_ptr_4_val { ap_none {  { input_ptr_4_val in_data 0 16 } } }
	input_ptr_8_val { ap_none {  { input_ptr_8_val in_data 0 16 } } }
	input_ptr_12_val { ap_none {  { input_ptr_12_val in_data 0 16 } } }
	input_ptr_16_val { ap_none {  { input_ptr_16_val in_data 0 16 } } }
	input_ptr_20_val { ap_none {  { input_ptr_20_val in_data 0 16 } } }
	input_ptr_24_val { ap_none {  { input_ptr_24_val in_data 0 16 } } }
	input_ptr_28_val { ap_none {  { input_ptr_28_val in_data 0 16 } } }
	input_ptr_32_val { ap_none {  { input_ptr_32_val in_data 0 16 } } }
	input_ptr_36_val { ap_none {  { input_ptr_36_val in_data 0 16 } } }
	add_ln1839_3 { ap_none {  { add_ln1839_3 in_data 0 11 } } }
	input_ptr_1_val { ap_none {  { input_ptr_1_val in_data 0 16 } } }
	input_ptr_5_val { ap_none {  { input_ptr_5_val in_data 0 16 } } }
	input_ptr_9_val { ap_none {  { input_ptr_9_val in_data 0 16 } } }
	input_ptr_13_val { ap_none {  { input_ptr_13_val in_data 0 16 } } }
	input_ptr_17_val { ap_none {  { input_ptr_17_val in_data 0 16 } } }
	input_ptr_21_val { ap_none {  { input_ptr_21_val in_data 0 16 } } }
	input_ptr_25_val { ap_none {  { input_ptr_25_val in_data 0 16 } } }
	input_ptr_29_val { ap_none {  { input_ptr_29_val in_data 0 16 } } }
	input_ptr_33_val { ap_none {  { input_ptr_33_val in_data 0 16 } } }
	input_ptr_37_val { ap_none {  { input_ptr_37_val in_data 0 16 } } }
	input_ptr_2_val { ap_none {  { input_ptr_2_val in_data 0 16 } } }
	input_ptr_6_val { ap_none {  { input_ptr_6_val in_data 0 16 } } }
	input_ptr_10_val { ap_none {  { input_ptr_10_val in_data 0 16 } } }
	input_ptr_14_val { ap_none {  { input_ptr_14_val in_data 0 16 } } }
	input_ptr_18_val { ap_none {  { input_ptr_18_val in_data 0 16 } } }
	input_ptr_22_val { ap_none {  { input_ptr_22_val in_data 0 16 } } }
	input_ptr_26_val { ap_none {  { input_ptr_26_val in_data 0 16 } } }
	input_ptr_30_val { ap_none {  { input_ptr_30_val in_data 0 16 } } }
	input_ptr_34_val { ap_none {  { input_ptr_34_val in_data 0 16 } } }
	input_ptr_3_val { ap_none {  { input_ptr_3_val in_data 0 16 } } }
	input_ptr_7_val { ap_none {  { input_ptr_7_val in_data 0 16 } } }
	input_ptr_11_val { ap_none {  { input_ptr_11_val in_data 0 16 } } }
	input_ptr_15_val { ap_none {  { input_ptr_15_val in_data 0 16 } } }
	input_ptr_19_val { ap_none {  { input_ptr_19_val in_data 0 16 } } }
	input_ptr_23_val { ap_none {  { input_ptr_23_val in_data 0 16 } } }
	input_ptr_27_val { ap_none {  { input_ptr_27_val in_data 0 16 } } }
	input_ptr_31_val { ap_none {  { input_ptr_31_val in_data 0 16 } } }
	input_ptr_35_val { ap_none {  { input_ptr_35_val in_data 0 16 } } }
	p_out { ap_vld {  { p_out out_data 1 48 }  { p_out_ap_vld out_vld 1 1 } } }
	p_out1 { ap_vld {  { p_out1 out_data 1 48 }  { p_out1_ap_vld out_vld 1 1 } } }
	p_out2 { ap_vld {  { p_out2 out_data 1 35 }  { p_out2_ap_vld out_vld 1 1 } } }
	p_out3 { ap_vld {  { p_out3 out_data 1 35 }  { p_out3_ap_vld out_vld 1 1 } } }
	SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12 { ap_stable {  { SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12_address0 mem_address 1 11 }  { SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12_ce0 mem_ce 1 1 }  { SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_12_q0 in_data 0 64 } } }
}

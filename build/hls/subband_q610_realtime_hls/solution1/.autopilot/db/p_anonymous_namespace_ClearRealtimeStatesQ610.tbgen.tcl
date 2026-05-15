set moduleName p_anonymous_namespace_ClearRealtimeStatesQ610
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
set C_modelName {(anonymous namespace)ClearRealtimeStatesQ610}
set C_modelType { void 0 }
set C_modelArgList {
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9 int 16 regular {array 2688 { 3 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11 int 16 regular {array 2688 { 3 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3 int 16 regular {array 2688 { 3 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5 int 16 regular {array 2688 { 3 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8 int 16 regular {array 2688 { 3 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10 int 16 regular {array 2688 { 3 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2 int 16 regular {array 2688 { 3 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4 int 16 regular {array 2688 { 3 0 } 0 1 } {global 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 38
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_address1 sc_out sc_lv 12 signal 0 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_ce1 sc_out sc_logic 1 signal 0 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_we1 sc_out sc_logic 1 signal 0 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_d1 sc_out sc_lv 16 signal 0 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_address1 sc_out sc_lv 12 signal 1 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_ce1 sc_out sc_logic 1 signal 1 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_we1 sc_out sc_logic 1 signal 1 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_d1 sc_out sc_lv 16 signal 1 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_address1 sc_out sc_lv 12 signal 2 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_ce1 sc_out sc_logic 1 signal 2 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_we1 sc_out sc_logic 1 signal 2 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_d1 sc_out sc_lv 16 signal 2 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_address1 sc_out sc_lv 12 signal 3 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_ce1 sc_out sc_logic 1 signal 3 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_we1 sc_out sc_logic 1 signal 3 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_d1 sc_out sc_lv 16 signal 3 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_address1 sc_out sc_lv 12 signal 4 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_ce1 sc_out sc_logic 1 signal 4 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_we1 sc_out sc_logic 1 signal 4 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_d1 sc_out sc_lv 16 signal 4 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_address1 sc_out sc_lv 12 signal 5 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_ce1 sc_out sc_logic 1 signal 5 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_we1 sc_out sc_logic 1 signal 5 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_d1 sc_out sc_lv 16 signal 5 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_address1 sc_out sc_lv 12 signal 6 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_ce1 sc_out sc_logic 1 signal 6 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_we1 sc_out sc_logic 1 signal 6 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_d1 sc_out sc_lv 16 signal 6 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_address1 sc_out sc_lv 12 signal 7 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_ce1 sc_out sc_logic 1 signal 7 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_we1 sc_out sc_logic 1 signal 7 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_d1 sc_out sc_lv 16 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "p_anonymous_namespace_ClearRealtimeStatesQ610",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5378", "EstimateLatencyMax" : "5378",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_2489_1_VITIS_LOOP_2490_2_VITIS_LOOP_2491_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	p_anonymous_namespace_ClearRealtimeStatesQ610 {
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9 {Type O LastRead -1 FirstWrite 2}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11 {Type O LastRead -1 FirstWrite 2}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3 {Type O LastRead -1 FirstWrite 2}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5 {Type O LastRead -1 FirstWrite 2}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8 {Type O LastRead -1 FirstWrite 2}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10 {Type O LastRead -1 FirstWrite 2}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2 {Type O LastRead -1 FirstWrite 2}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4 {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5378", "Max" : "5378"}
	, {"Name" : "Interval", "Min" : "5378", "Max" : "5378"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_address1 MemPortADDR2 1 12 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_d1 MemPortDIN2 1 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_address1 MemPortADDR2 1 12 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_d1 MemPortDIN2 1 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_address1 MemPortADDR2 1 12 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_d1 MemPortDIN2 1 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_address1 MemPortADDR2 1 12 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_d1 MemPortDIN2 1 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_address1 MemPortADDR2 1 12 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_d1 MemPortDIN2 1 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_address1 MemPortADDR2 1 12 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_d1 MemPortDIN2 1 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_address1 MemPortADDR2 1 12 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_d1 MemPortDIN2 1 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_address1 MemPortADDR2 1 12 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_d1 MemPortDIN2 1 16 } } }
}

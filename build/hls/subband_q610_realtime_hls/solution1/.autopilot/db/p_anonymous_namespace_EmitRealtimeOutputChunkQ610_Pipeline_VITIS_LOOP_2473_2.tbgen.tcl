set moduleName p_anonymous_namespace_EmitRealtimeOutputChunkQ610_Pipeline_VITIS_LOOP_2473_2
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
set C_modelName {(anonymous namespace)EmitRealtimeOutputChunkQ610_Pipeline_VITIS_LOOP_2473_2}
set C_modelType { void 0 }
set C_modelArgList {
	{ cmp6 int 1 regular  }
	{ or_ln2477 int 13 regular  }
	{ df_coef_stream_V_data_V int 16 regular {axi_s 1 volatile  { df_coef_stream Data } }  }
	{ df_coef_stream_V_keep_V int 2 regular {axi_s 1 volatile  { df_coef_stream Keep } }  }
	{ df_coef_stream_V_strb_V int 2 regular {axi_s 1 volatile  { df_coef_stream Strb } }  }
	{ df_coef_stream_V_last_V int 1 regular {axi_s 1 volatile  { df_coef_stream Last } }  }
	{ output_chunk int 16 regular {array 4608 { 1 3 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "cmp6", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "or_ln2477", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "df_coef_stream_V_data_V", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "df_coef_stream_V_keep_V", "interface" : "axis", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "df_coef_stream_V_strb_V", "interface" : "axis", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "df_coef_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_chunk", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ df_coef_stream_TREADY sc_in sc_logic 1 outacc 2 } 
	{ cmp6 sc_in sc_lv 1 signal 0 } 
	{ or_ln2477 sc_in sc_lv 13 signal 1 } 
	{ df_coef_stream_TDATA sc_out sc_lv 16 signal 2 } 
	{ df_coef_stream_TVALID sc_out sc_logic 1 outvld 5 } 
	{ df_coef_stream_TKEEP sc_out sc_lv 2 signal 3 } 
	{ df_coef_stream_TSTRB sc_out sc_lv 2 signal 4 } 
	{ df_coef_stream_TLAST sc_out sc_lv 1 signal 5 } 
	{ output_chunk_address0 sc_out sc_lv 13 signal 6 } 
	{ output_chunk_ce0 sc_out sc_logic 1 signal 6 } 
	{ output_chunk_q0 sc_in sc_lv 16 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "df_coef_stream_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "df_coef_stream_V_data_V", "role": "default" }} , 
 	{ "name": "cmp6", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp6", "role": "default" }} , 
 	{ "name": "or_ln2477", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "or_ln2477", "role": "default" }} , 
 	{ "name": "df_coef_stream_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "df_coef_stream_V_data_V", "role": "default" }} , 
 	{ "name": "df_coef_stream_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "df_coef_stream_V_last_V", "role": "default" }} , 
 	{ "name": "df_coef_stream_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "df_coef_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "df_coef_stream_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "df_coef_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "df_coef_stream_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "df_coef_stream_V_last_V", "role": "default" }} , 
 	{ "name": "output_chunk_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "output_chunk", "role": "address0" }} , 
 	{ "name": "output_chunk_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_chunk", "role": "ce0" }} , 
 	{ "name": "output_chunk_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "output_chunk", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "p_anonymous_namespace_EmitRealtimeOutputChunkQ610_Pipeline_VITIS_LOOP_2473_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1154", "EstimateLatencyMax" : "1154",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "cmp6", "Type" : "None", "Direction" : "I"},
			{"Name" : "or_ln2477", "Type" : "None", "Direction" : "I"},
			{"Name" : "df_coef_stream_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "df_coef_stream",
				"BlockSignal" : [
					{"Name" : "df_coef_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "df_coef_stream_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "df_coef_stream"},
			{"Name" : "df_coef_stream_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "df_coef_stream"},
			{"Name" : "df_coef_stream_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "df_coef_stream"},
			{"Name" : "output_chunk", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_2473_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	p_anonymous_namespace_EmitRealtimeOutputChunkQ610_Pipeline_VITIS_LOOP_2473_2 {
		cmp6 {Type I LastRead 0 FirstWrite -1}
		or_ln2477 {Type I LastRead 0 FirstWrite -1}
		df_coef_stream_V_data_V {Type O LastRead -1 FirstWrite 1}
		df_coef_stream_V_keep_V {Type O LastRead -1 FirstWrite 1}
		df_coef_stream_V_strb_V {Type O LastRead -1 FirstWrite 1}
		df_coef_stream_V_last_V {Type O LastRead -1 FirstWrite 1}
		output_chunk {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1154", "Max" : "1154"}
	, {"Name" : "Interval", "Min" : "1154", "Max" : "1154"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	cmp6 { ap_none {  { cmp6 in_data 0 1 } } }
	or_ln2477 { ap_none {  { or_ln2477 in_data 0 13 } } }
	df_coef_stream_V_data_V { axis {  { df_coef_stream_TREADY out_acc 0 1 }  { df_coef_stream_TDATA out_data 1 16 } } }
	df_coef_stream_V_keep_V { axis {  { df_coef_stream_TKEEP out_data 1 2 } } }
	df_coef_stream_V_strb_V { axis {  { df_coef_stream_TSTRB out_data 1 2 } } }
	df_coef_stream_V_last_V { axis {  { df_coef_stream_TVALID out_vld 1 1 }  { df_coef_stream_TLAST out_data 1 1 } } }
	output_chunk { ap_memory {  { output_chunk_address0 mem_address 1 13 }  { output_chunk_ce0 mem_ce 1 1 }  { output_chunk_q0 in_data 0 16 } } }
}

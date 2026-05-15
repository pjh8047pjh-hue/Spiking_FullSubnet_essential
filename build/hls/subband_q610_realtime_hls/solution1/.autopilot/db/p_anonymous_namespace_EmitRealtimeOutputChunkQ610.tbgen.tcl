set moduleName p_anonymous_namespace_EmitRealtimeOutputChunkQ610
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {(anonymous namespace)EmitRealtimeOutputChunkQ610}
set C_modelType { void 0 }
set C_modelArgList {
	{ num_frames int 3 regular  }
	{ df_coef_stream_V_data_V int 16 regular {axi_s 1 volatile  { df_coef_stream Data } }  }
	{ df_coef_stream_V_keep_V int 2 regular {axi_s 1 volatile  { df_coef_stream Keep } }  }
	{ df_coef_stream_V_strb_V int 2 regular {axi_s 1 volatile  { df_coef_stream Strb } }  }
	{ df_coef_stream_V_last_V int 1 regular {axi_s 1 volatile  { df_coef_stream Last } }  }
	{ output_chunk int 16 regular {array 4608 { 1 3 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "num_frames", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "df_coef_stream_V_data_V", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "df_coef_stream_V_keep_V", "interface" : "axis", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "df_coef_stream_V_strb_V", "interface" : "axis", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "df_coef_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_chunk", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ num_frames sc_in sc_lv 3 signal 0 } 
	{ df_coef_stream_TDATA sc_out sc_lv 16 signal 1 } 
	{ df_coef_stream_TVALID sc_out sc_logic 1 outvld 4 } 
	{ df_coef_stream_TREADY sc_in sc_logic 1 outacc 4 } 
	{ df_coef_stream_TKEEP sc_out sc_lv 2 signal 2 } 
	{ df_coef_stream_TSTRB sc_out sc_lv 2 signal 3 } 
	{ df_coef_stream_TLAST sc_out sc_lv 1 signal 4 } 
	{ output_chunk_address0 sc_out sc_lv 13 signal 5 } 
	{ output_chunk_ce0 sc_out sc_logic 1 signal 5 } 
	{ output_chunk_q0 sc_in sc_lv 16 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "num_frames", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "num_frames", "role": "default" }} , 
 	{ "name": "df_coef_stream_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "df_coef_stream_V_data_V", "role": "default" }} , 
 	{ "name": "df_coef_stream_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "df_coef_stream_V_last_V", "role": "default" }} , 
 	{ "name": "df_coef_stream_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "df_coef_stream_V_last_V", "role": "default" }} , 
 	{ "name": "df_coef_stream_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "df_coef_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "df_coef_stream_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "df_coef_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "df_coef_stream_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "df_coef_stream_V_last_V", "role": "default" }} , 
 	{ "name": "output_chunk_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "output_chunk", "role": "address0" }} , 
 	{ "name": "output_chunk_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_chunk", "role": "ce0" }} , 
 	{ "name": "output_chunk_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "output_chunk", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "p_anonymous_namespace_EmitRealtimeOutputChunkQ610",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "9", "EstimateLatencyMax" : "4625",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "num_frames", "Type" : "None", "Direction" : "I"},
			{"Name" : "df_coef_stream_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "df_coef_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_p_anonymous_namespace_EmitRealtimeOutputChunkQ610_Pipeline_VITIS_LOOP_2473_2_fu_78", "Port" : "df_coef_stream_V_data_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "df_coef_stream_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "df_coef_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_p_anonymous_namespace_EmitRealtimeOutputChunkQ610_Pipeline_VITIS_LOOP_2473_2_fu_78", "Port" : "df_coef_stream_V_keep_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "df_coef_stream_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "df_coef_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_p_anonymous_namespace_EmitRealtimeOutputChunkQ610_Pipeline_VITIS_LOOP_2473_2_fu_78", "Port" : "df_coef_stream_V_strb_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "df_coef_stream_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "df_coef_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_p_anonymous_namespace_EmitRealtimeOutputChunkQ610_Pipeline_VITIS_LOOP_2473_2_fu_78", "Port" : "df_coef_stream_V_last_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_chunk", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_p_anonymous_namespace_EmitRealtimeOutputChunkQ610_Pipeline_VITIS_LOOP_2473_2_fu_78", "Port" : "output_chunk", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_2470_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_EmitRealtimeOutputChunkQ610_Pipeline_VITIS_LOOP_2473_2_fu_78", "Parent" : "0", "Child" : ["2"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_EmitRealtimeOutputChunkQ610_Pipeline_VITIS_LOOP_2473_2_fu_78.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	p_anonymous_namespace_EmitRealtimeOutputChunkQ610 {
		num_frames {Type I LastRead 0 FirstWrite -1}
		df_coef_stream_V_data_V {Type O LastRead -1 FirstWrite 1}
		df_coef_stream_V_keep_V {Type O LastRead -1 FirstWrite 1}
		df_coef_stream_V_strb_V {Type O LastRead -1 FirstWrite 1}
		df_coef_stream_V_last_V {Type O LastRead -1 FirstWrite 1}
		output_chunk {Type I LastRead 0 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "9", "Max" : "4625"}
	, {"Name" : "Interval", "Min" : "9", "Max" : "4625"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	num_frames { ap_none {  { num_frames in_data 0 3 } } }
	df_coef_stream_V_data_V { axis {  { df_coef_stream_TDATA out_data 1 16 } } }
	df_coef_stream_V_keep_V { axis {  { df_coef_stream_TKEEP out_data 1 2 } } }
	df_coef_stream_V_strb_V { axis {  { df_coef_stream_TSTRB out_data 1 2 } } }
	df_coef_stream_V_last_V { axis {  { df_coef_stream_TVALID out_vld 1 1 }  { df_coef_stream_TREADY out_acc 0 1 }  { df_coef_stream_TLAST out_data 1 1 } } }
	output_chunk { ap_memory {  { output_chunk_address0 mem_address 1 13 }  { output_chunk_ce0 mem_ce 1 1 }  { output_chunk_q0 mem_dout 0 16 } } }
}

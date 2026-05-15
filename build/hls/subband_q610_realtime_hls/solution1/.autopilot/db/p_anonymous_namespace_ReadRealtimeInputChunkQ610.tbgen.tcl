set moduleName p_anonymous_namespace_ReadRealtimeInputChunkQ610
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
set C_modelName {(anonymous namespace)ReadRealtimeInputChunkQ610}
set C_modelType { void 0 }
set C_modelArgList {
	{ noisy_fft_stream_V_data_V int 16 regular {axi_s 0 volatile  { noisy_fft_stream Data } }  }
	{ noisy_fft_stream_V_keep_V int 2 regular {axi_s 0 volatile  { noisy_fft_stream Keep } }  }
	{ noisy_fft_stream_V_strb_V int 2 regular {axi_s 0 volatile  { noisy_fft_stream Strb } }  }
	{ noisy_fft_stream_V_last_V int 1 regular {axi_s 0 volatile  { noisy_fft_stream Last } }  }
	{ fb_fft_stream_V_data_V int 16 regular {axi_s 0 volatile  { fb_fft_stream Data } }  }
	{ fb_fft_stream_V_keep_V int 2 regular {axi_s 0 volatile  { fb_fft_stream Keep } }  }
	{ fb_fft_stream_V_strb_V int 2 regular {axi_s 0 volatile  { fb_fft_stream Strb } }  }
	{ fb_fft_stream_V_last_V int 1 regular {axi_s 0 volatile  { fb_fft_stream Last } }  }
	{ num_frames int 3 regular  }
	{ noisy_chunk int 16 regular {array 1024 { 3 0 } 0 1 } {global 1}  }
	{ fb_chunk int 16 regular {array 1024 { 3 0 } 0 1 } {global 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "noisy_fft_stream_V_data_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "noisy_fft_stream_V_keep_V", "interface" : "axis", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "noisy_fft_stream_V_strb_V", "interface" : "axis", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "noisy_fft_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "fb_fft_stream_V_data_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fb_fft_stream_V_keep_V", "interface" : "axis", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "fb_fft_stream_V_strb_V", "interface" : "axis", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "fb_fft_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "num_frames", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "noisy_chunk", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "fb_chunk", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ noisy_fft_stream_TDATA sc_in sc_lv 16 signal 0 } 
	{ noisy_fft_stream_TVALID sc_in sc_logic 1 invld 3 } 
	{ noisy_fft_stream_TREADY sc_out sc_logic 1 inacc 3 } 
	{ noisy_fft_stream_TKEEP sc_in sc_lv 2 signal 1 } 
	{ noisy_fft_stream_TSTRB sc_in sc_lv 2 signal 2 } 
	{ noisy_fft_stream_TLAST sc_in sc_lv 1 signal 3 } 
	{ fb_fft_stream_TDATA sc_in sc_lv 16 signal 4 } 
	{ fb_fft_stream_TVALID sc_in sc_logic 1 invld 7 } 
	{ fb_fft_stream_TREADY sc_out sc_logic 1 inacc 7 } 
	{ fb_fft_stream_TKEEP sc_in sc_lv 2 signal 5 } 
	{ fb_fft_stream_TSTRB sc_in sc_lv 2 signal 6 } 
	{ fb_fft_stream_TLAST sc_in sc_lv 1 signal 7 } 
	{ num_frames sc_in sc_lv 3 signal 8 } 
	{ noisy_chunk_address1 sc_out sc_lv 10 signal 9 } 
	{ noisy_chunk_ce1 sc_out sc_logic 1 signal 9 } 
	{ noisy_chunk_we1 sc_out sc_logic 1 signal 9 } 
	{ noisy_chunk_d1 sc_out sc_lv 16 signal 9 } 
	{ fb_chunk_address1 sc_out sc_lv 10 signal 10 } 
	{ fb_chunk_ce1 sc_out sc_logic 1 signal 10 } 
	{ fb_chunk_we1 sc_out sc_logic 1 signal 10 } 
	{ fb_chunk_d1 sc_out sc_lv 16 signal 10 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "noisy_fft_stream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "noisy_fft_stream_V_data_V", "role": "default" }} , 
 	{ "name": "noisy_fft_stream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "noisy_fft_stream_V_last_V", "role": "default" }} , 
 	{ "name": "noisy_fft_stream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "noisy_fft_stream_V_last_V", "role": "default" }} , 
 	{ "name": "noisy_fft_stream_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "noisy_fft_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "noisy_fft_stream_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "noisy_fft_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "noisy_fft_stream_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "noisy_fft_stream_V_last_V", "role": "default" }} , 
 	{ "name": "fb_fft_stream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fb_fft_stream_V_data_V", "role": "default" }} , 
 	{ "name": "fb_fft_stream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "fb_fft_stream_V_last_V", "role": "default" }} , 
 	{ "name": "fb_fft_stream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "fb_fft_stream_V_last_V", "role": "default" }} , 
 	{ "name": "fb_fft_stream_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "fb_fft_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "fb_fft_stream_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "fb_fft_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "fb_fft_stream_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_fft_stream_V_last_V", "role": "default" }} , 
 	{ "name": "num_frames", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "num_frames", "role": "default" }} , 
 	{ "name": "noisy_chunk_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "noisy_chunk", "role": "address1" }} , 
 	{ "name": "noisy_chunk_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "noisy_chunk", "role": "ce1" }} , 
 	{ "name": "noisy_chunk_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "noisy_chunk", "role": "we1" }} , 
 	{ "name": "noisy_chunk_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "noisy_chunk", "role": "d1" }} , 
 	{ "name": "fb_chunk_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "fb_chunk", "role": "address1" }} , 
 	{ "name": "fb_chunk_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_chunk", "role": "ce1" }} , 
 	{ "name": "fb_chunk_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb_chunk", "role": "we1" }} , 
 	{ "name": "fb_chunk_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fb_chunk", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3"],
		"CDFG" : "p_anonymous_namespace_ReadRealtimeInputChunkQ610",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "9", "EstimateLatencyMax" : "2085",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "noisy_fft_stream_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "noisy_fft_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2453_2_fu_84", "Port" : "noisy_fft_stream_V_data_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "noisy_fft_stream_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "noisy_fft_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2453_2_fu_84", "Port" : "noisy_fft_stream_V_keep_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "noisy_fft_stream_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "noisy_fft_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2453_2_fu_84", "Port" : "noisy_fft_stream_V_strb_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "noisy_fft_stream_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "noisy_fft_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2453_2_fu_84", "Port" : "noisy_fft_stream_V_last_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "fb_fft_stream_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "fb_fft_stream",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2457_3_fu_99", "Port" : "fb_fft_stream_V_data_V", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "fb_fft_stream_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "fb_fft_stream",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2457_3_fu_99", "Port" : "fb_fft_stream_V_keep_V", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "fb_fft_stream_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "fb_fft_stream",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2457_3_fu_99", "Port" : "fb_fft_stream_V_strb_V", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "fb_fft_stream_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "fb_fft_stream",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2457_3_fu_99", "Port" : "fb_fft_stream_V_last_V", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "num_frames", "Type" : "None", "Direction" : "I"},
			{"Name" : "noisy_chunk", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2453_2_fu_84", "Port" : "noisy_chunk", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "fb_chunk", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2457_3_fu_99", "Port" : "fb_chunk", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_2450_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2453_2_fu_84", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2453_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "258", "EstimateLatencyMax" : "258",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "noisy_fft_stream_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "noisy_fft_stream",
				"BlockSignal" : [
					{"Name" : "noisy_fft_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "noisy_fft_stream_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "noisy_fft_stream"},
			{"Name" : "noisy_fft_stream_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "noisy_fft_stream"},
			{"Name" : "noisy_fft_stream_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "noisy_fft_stream"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "noisy_chunk", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_2453_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2453_2_fu_84.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2457_3_fu_99", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2457_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "258", "EstimateLatencyMax" : "258",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "fb_fft_stream_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "fb_fft_stream",
				"BlockSignal" : [
					{"Name" : "fb_fft_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fb_fft_stream_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "fb_fft_stream"},
			{"Name" : "fb_fft_stream_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "fb_fft_stream"},
			{"Name" : "fb_fft_stream_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "fb_fft_stream"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "fb_chunk", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_2457_3", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2457_3_fu_99.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"}]}


set ArgLastReadFirstWriteLatency {
	p_anonymous_namespace_ReadRealtimeInputChunkQ610 {
		noisy_fft_stream_V_data_V {Type I LastRead 0 FirstWrite -1}
		noisy_fft_stream_V_keep_V {Type I LastRead 0 FirstWrite -1}
		noisy_fft_stream_V_strb_V {Type I LastRead 0 FirstWrite -1}
		noisy_fft_stream_V_last_V {Type I LastRead 0 FirstWrite -1}
		fb_fft_stream_V_data_V {Type I LastRead 0 FirstWrite -1}
		fb_fft_stream_V_keep_V {Type I LastRead 0 FirstWrite -1}
		fb_fft_stream_V_strb_V {Type I LastRead 0 FirstWrite -1}
		fb_fft_stream_V_last_V {Type I LastRead 0 FirstWrite -1}
		num_frames {Type I LastRead 0 FirstWrite -1}
		noisy_chunk {Type O LastRead -1 FirstWrite 0}
		fb_chunk {Type O LastRead -1 FirstWrite 0}}
	p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2453_2 {
		noisy_fft_stream_V_data_V {Type I LastRead 0 FirstWrite -1}
		noisy_fft_stream_V_keep_V {Type I LastRead 0 FirstWrite -1}
		noisy_fft_stream_V_strb_V {Type I LastRead 0 FirstWrite -1}
		noisy_fft_stream_V_last_V {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		noisy_chunk {Type O LastRead -1 FirstWrite 0}}
	p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2457_3 {
		fb_fft_stream_V_data_V {Type I LastRead 0 FirstWrite -1}
		fb_fft_stream_V_keep_V {Type I LastRead 0 FirstWrite -1}
		fb_fft_stream_V_strb_V {Type I LastRead 0 FirstWrite -1}
		fb_fft_stream_V_last_V {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		fb_chunk {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "9", "Max" : "2085"}
	, {"Name" : "Interval", "Min" : "9", "Max" : "2085"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	noisy_fft_stream_V_data_V { axis {  { noisy_fft_stream_TDATA in_data 0 16 } } }
	noisy_fft_stream_V_keep_V { axis {  { noisy_fft_stream_TKEEP in_data 0 2 } } }
	noisy_fft_stream_V_strb_V { axis {  { noisy_fft_stream_TSTRB in_data 0 2 } } }
	noisy_fft_stream_V_last_V { axis {  { noisy_fft_stream_TVALID in_vld 0 1 }  { noisy_fft_stream_TREADY in_acc 1 1 }  { noisy_fft_stream_TLAST in_data 0 1 } } }
	fb_fft_stream_V_data_V { axis {  { fb_fft_stream_TDATA in_data 0 16 } } }
	fb_fft_stream_V_keep_V { axis {  { fb_fft_stream_TKEEP in_data 0 2 } } }
	fb_fft_stream_V_strb_V { axis {  { fb_fft_stream_TSTRB in_data 0 2 } } }
	fb_fft_stream_V_last_V { axis {  { fb_fft_stream_TVALID in_vld 0 1 }  { fb_fft_stream_TREADY in_acc 1 1 }  { fb_fft_stream_TLAST in_data 0 1 } } }
	num_frames { ap_none {  { num_frames in_data 0 3 } } }
	noisy_chunk { ap_memory {  { noisy_chunk_address1 MemPortADDR2 1 10 }  { noisy_chunk_ce1 MemPortCE2 1 1 }  { noisy_chunk_we1 MemPortWE2 1 1 }  { noisy_chunk_d1 MemPortDIN2 1 16 } } }
	fb_chunk { ap_memory {  { fb_chunk_address1 MemPortADDR2 1 10 }  { fb_chunk_ce1 MemPortCE2 1 1 }  { fb_chunk_we1 MemPortWE2 1 1 }  { fb_chunk_d1 MemPortDIN2 1 16 } } }
}

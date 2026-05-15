set moduleName p_anonymous_namespace_RunGSULayer0StreamParallelQ610_Pipeline_VITIS_LOOP_1774_1
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
set C_modelName {(anonymous namespace)RunGSULayer0StreamParallelQ610_Pipeline_VITIS_LOOP_1774_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ output_buffer int 11 regular {array 112 { 1 3 } 1 1 }  }
	{ output_buffer_4 int 11 regular {array 112 { 1 3 } 1 1 }  }
	{ layer0_output_stream int 16 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "output_buffer", "interface" : "memory", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "output_buffer_4", "interface" : "memory", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "layer0_output_stream", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ layer0_output_stream_din sc_out sc_lv 16 signal 2 } 
	{ layer0_output_stream_num_data_valid sc_in sc_lv 10 signal 2 } 
	{ layer0_output_stream_fifo_cap sc_in sc_lv 10 signal 2 } 
	{ layer0_output_stream_full_n sc_in sc_logic 1 signal 2 } 
	{ layer0_output_stream_write sc_out sc_logic 1 signal 2 } 
	{ output_buffer_address0 sc_out sc_lv 7 signal 0 } 
	{ output_buffer_ce0 sc_out sc_logic 1 signal 0 } 
	{ output_buffer_q0 sc_in sc_lv 11 signal 0 } 
	{ output_buffer_4_address0 sc_out sc_lv 7 signal 1 } 
	{ output_buffer_4_ce0 sc_out sc_logic 1 signal 1 } 
	{ output_buffer_4_q0 sc_in sc_lv 11 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "layer0_output_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer0_output_stream", "role": "din" }} , 
 	{ "name": "layer0_output_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "layer0_output_stream", "role": "num_data_valid" }} , 
 	{ "name": "layer0_output_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "layer0_output_stream", "role": "fifo_cap" }} , 
 	{ "name": "layer0_output_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer0_output_stream", "role": "full_n" }} , 
 	{ "name": "layer0_output_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "layer0_output_stream", "role": "write" }} , 
 	{ "name": "output_buffer_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "output_buffer", "role": "address0" }} , 
 	{ "name": "output_buffer_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_buffer", "role": "ce0" }} , 
 	{ "name": "output_buffer_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "output_buffer", "role": "q0" }} , 
 	{ "name": "output_buffer_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "output_buffer_4", "role": "address0" }} , 
 	{ "name": "output_buffer_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_buffer_4", "role": "ce0" }} , 
 	{ "name": "output_buffer_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "output_buffer_4", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "p_anonymous_namespace_RunGSULayer0StreamParallelQ610_Pipeline_VITIS_LOOP_1774_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "227", "EstimateLatencyMax" : "227",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "output_buffer", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output_buffer_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "layer0_output_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "layer0_output_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_1774_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	p_anonymous_namespace_RunGSULayer0StreamParallelQ610_Pipeline_VITIS_LOOP_1774_1 {
		output_buffer {Type I LastRead 0 FirstWrite -1}
		output_buffer_4 {Type I LastRead 0 FirstWrite -1}
		layer0_output_stream {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "227", "Max" : "227"}
	, {"Name" : "Interval", "Min" : "227", "Max" : "227"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	output_buffer { ap_memory {  { output_buffer_address0 mem_address 1 7 }  { output_buffer_ce0 mem_ce 1 1 }  { output_buffer_q0 in_data 0 11 } } }
	output_buffer_4 { ap_memory {  { output_buffer_4_address0 mem_address 1 7 }  { output_buffer_4_ce0 mem_ce 1 1 }  { output_buffer_4_q0 in_data 0 11 } } }
	layer0_output_stream { ap_fifo {  { layer0_output_stream_din fifo_data_in 1 16 }  { layer0_output_stream_num_data_valid fifo_status_num_data_valid 0 10 }  { layer0_output_stream_fifo_cap fifo_update 0 10 }  { layer0_output_stream_full_n fifo_status 0 1 }  { layer0_output_stream_write fifo_port_we 1 1 } } }
}

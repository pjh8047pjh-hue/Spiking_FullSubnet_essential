set moduleName p_anonymous_namespace_RunRealtimeProjectionBandQ610
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
set C_modelName {(anonymous namespace)RunRealtimeProjectionBandQ610}
set C_modelType { void 0 }
set C_modelArgList {
	{ p_read int 2 regular  }
	{ p_read1 int 7 regular  }
	{ p_read2 int 3 regular  }
	{ p_read3 int 4 regular  }
	{ p_read4 int 8 regular  }
	{ num_frames int 3 regular  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1 int 16 regular {array 3584 { 1 3 } 1 1 } {global 0}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la int 16 regular {array 3584 { 1 3 } 1 1 } {global 0}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8 int 16 regular {array 24 { 1 3 } 1 1 } {global 0}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7 int 16 regular {array 24 { 1 3 } 1 1 } {global 0}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6 int 16 regular {array 24 { 1 3 } 1 1 } {global 0}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5 int 16 regular {array 24 { 1 3 } 1 1 } {global 0}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4 int 16 regular {array 24 { 1 3 } 1 1 } {global 0}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3 int 16 regular {array 24 { 1 3 } 1 1 } {global 0}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2 int 16 regular {array 24 { 1 3 } 1 1 } {global 0}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1 int 16 regular {array 24 { 1 3 } 1 1 } {global 0}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr int 512 regular {array 1344 { 1 3 } 1 1 } {global 0}  }
	{ output_chunk int 16 regular {array 4608 { 3 0 } 0 1 } {global 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "p_read1", "interface" : "wire", "bitwidth" : 7, "direction" : "READONLY"} , 
 	{ "Name" : "p_read2", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "p_read3", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "p_read4", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "num_frames", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "output_chunk", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 49
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ p_read sc_in sc_lv 2 signal 0 } 
	{ p_read1 sc_in sc_lv 7 signal 1 } 
	{ p_read2 sc_in sc_lv 3 signal 2 } 
	{ p_read3 sc_in sc_lv 4 signal 3 } 
	{ p_read4 sc_in sc_lv 8 signal 4 } 
	{ num_frames sc_in sc_lv 3 signal 5 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_address0 sc_out sc_lv 12 signal 6 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_q0 sc_in sc_lv 16 signal 6 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_address0 sc_out sc_lv 12 signal 7 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_ce0 sc_out sc_logic 1 signal 7 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_q0 sc_in sc_lv 16 signal 7 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8_address0 sc_out sc_lv 5 signal 8 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8_ce0 sc_out sc_logic 1 signal 8 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8_q0 sc_in sc_lv 16 signal 8 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7_address0 sc_out sc_lv 5 signal 9 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7_ce0 sc_out sc_logic 1 signal 9 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7_q0 sc_in sc_lv 16 signal 9 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6_address0 sc_out sc_lv 5 signal 10 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6_ce0 sc_out sc_logic 1 signal 10 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6_q0 sc_in sc_lv 16 signal 10 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5_address0 sc_out sc_lv 5 signal 11 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5_ce0 sc_out sc_logic 1 signal 11 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5_q0 sc_in sc_lv 16 signal 11 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4_address0 sc_out sc_lv 5 signal 12 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4_ce0 sc_out sc_logic 1 signal 12 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4_q0 sc_in sc_lv 16 signal 12 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3_address0 sc_out sc_lv 5 signal 13 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3_ce0 sc_out sc_logic 1 signal 13 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3_q0 sc_in sc_lv 16 signal 13 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2_address0 sc_out sc_lv 5 signal 14 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2_ce0 sc_out sc_logic 1 signal 14 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2_q0 sc_in sc_lv 16 signal 14 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1_address0 sc_out sc_lv 5 signal 15 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1_ce0 sc_out sc_logic 1 signal 15 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1_q0 sc_in sc_lv 16 signal 15 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_address0 sc_out sc_lv 11 signal 16 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_ce0 sc_out sc_logic 1 signal 16 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_q0 sc_in sc_lv 512 signal 16 } 
	{ output_chunk_address1 sc_out sc_lv 13 signal 17 } 
	{ output_chunk_ce1 sc_out sc_logic 1 signal 17 } 
	{ output_chunk_we1 sc_out sc_logic 1 signal 17 } 
	{ output_chunk_d1 sc_out sc_lv 16 signal 17 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "p_read1", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "p_read1", "role": "default" }} , 
 	{ "name": "p_read2", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p_read2", "role": "default" }} , 
 	{ "name": "p_read3", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p_read3", "role": "default" }} , 
 	{ "name": "p_read4", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_read4", "role": "default" }} , 
 	{ "name": "num_frames", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "num_frames", "role": "default" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1", "role": "q0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la", "role": "q0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8", "role": "q0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7", "role": "q0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6", "role": "q0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5", "role": "q0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4", "role": "q0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3", "role": "q0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2", "role": "q0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1", "role": "q0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr", "role": "q0" }} , 
 	{ "name": "output_chunk_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "output_chunk", "role": "address1" }} , 
 	{ "name": "output_chunk_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_chunk", "role": "ce1" }} , 
 	{ "name": "output_chunk_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_chunk", "role": "we1" }} , 
 	{ "name": "output_chunk_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "output_chunk", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "69", "70", "71"],
		"CDFG" : "p_anonymous_namespace_RunRealtimeProjectionBandQ610",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "9", "EstimateLatencyMax" : "124105",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read4", "Type" : "None", "Direction" : "I"},
			{"Name" : "num_frames", "Type" : "None", "Direction" : "I"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_2801_1_fu_2307", "Port" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_2801_1_fu_2307", "Port" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764", "Port" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "output_chunk", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_3050_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state13"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state3", "ap_ST_fsm_state5"], "PostState" : ["ap_ST_fsm_state3"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_3044_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_3041_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_2801_1_fu_2307", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_2801_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "226", "EstimateLatencyMax" : "226",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "projection_input_447", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_446", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_445", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_444", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_443", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_442", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_441", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_440", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_439", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_438", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_437", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_436", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_435", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_434", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_433", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_432", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_431", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_430", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_429", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_428", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_427", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_426", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_425", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_424", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_423", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_422", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_421", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_420", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_419", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_418", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_417", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_416", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_415", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_414", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_413", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_412", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_411", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_410", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_409", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_408", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_407", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_406", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_405", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_404", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_403", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_402", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_401", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_400", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_399", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_398", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_397", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_396", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_395", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_394", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_393", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_392", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_391", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_390", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_389", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_388", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_387", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_386", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_385", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_384", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_383", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_382", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_381", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_380", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_379", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_378", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_377", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_376", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_375", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_374", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_373", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_372", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_371", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_370", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_369", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_368", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_367", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_366", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_365", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_364", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_363", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_362", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_361", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_360", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_359", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_358", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_357", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_356", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_355", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_354", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_353", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_352", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_351", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_350", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_349", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_348", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_347", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_346", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_345", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_344", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_343", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_342", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_341", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_340", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_339", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_338", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_337", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_336", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_335", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_334", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_333", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_332", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_331", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_330", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_329", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_328", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_327", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_326", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_325", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_324", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_323", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_322", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_321", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_320", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_319", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_318", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_317", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_316", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_315", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_314", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_313", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_312", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_311", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_310", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_309", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_308", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_307", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_306", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_305", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_304", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_303", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_302", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_301", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_300", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_299", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_298", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_297", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_296", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_295", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_294", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_293", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_292", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_291", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_290", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_289", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_288", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_287", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_286", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_285", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_284", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_283", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_282", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_281", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_280", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_279", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_278", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_277", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_276", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_275", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_274", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_273", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_272", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_271", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_270", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_269", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_268", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_267", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_266", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_265", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_264", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_263", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_262", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_261", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_260", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_259", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_258", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_257", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_256", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_255", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_254", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_253", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_252", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_251", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_250", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_249", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_248", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_247", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_246", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_245", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_244", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_243", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_242", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_241", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_240", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_239", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_238", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_237", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_236", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_235", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_234", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_233", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_232", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_231", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_230", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_229", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_228", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_227", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_226", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_225", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_224", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub_ln2803", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_895_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_894_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_893_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_892_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_891_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_890_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_889_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_888_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_887_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_886_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_885_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_884_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_883_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_882_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_881_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_880_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_879_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_878_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_877_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_876_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_875_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_874_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_873_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_872_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_871_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_870_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_869_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_868_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_867_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_866_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_865_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_864_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_863_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_862_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_861_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_860_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_859_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_858_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_857_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_856_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_855_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_854_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_853_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_852_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_851_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_850_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_849_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_848_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_847_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_846_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_845_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_844_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_843_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_842_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_841_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_840_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_839_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_838_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_837_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_836_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_835_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_834_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_833_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_832_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_831_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_830_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_829_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_828_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_827_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_826_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_825_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_824_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_823_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_822_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_821_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_820_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_819_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_818_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_817_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_816_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_815_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_814_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_813_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_812_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_811_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_810_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_809_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_808_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_807_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_806_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_805_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_804_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_803_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_802_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_801_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_800_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_799_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_798_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_797_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_796_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_795_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_794_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_793_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_792_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_791_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_790_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_789_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_788_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_787_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_786_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_785_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_784_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_783_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_782_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_781_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_780_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_779_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_778_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_777_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_776_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_775_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_774_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_773_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_772_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_771_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_770_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_769_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_768_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_767_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_766_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_765_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_764_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_763_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_762_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_761_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_760_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_759_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_758_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_757_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_756_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_755_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_754_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_753_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_752_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_751_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_750_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_749_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_748_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_747_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_746_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_745_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_744_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_743_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_742_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_741_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_740_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_739_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_738_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_737_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_736_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_735_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_734_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_733_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_732_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_731_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_730_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_729_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_728_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_727_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_726_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_725_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_724_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_723_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_722_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_721_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_720_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_719_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_718_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_717_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_716_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_715_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_714_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_713_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_712_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_711_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_710_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_709_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_708_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_707_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_706_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_705_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_704_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_703_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_702_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_701_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_700_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_699_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_698_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_697_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_696_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_695_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_694_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_693_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_692_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_691_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_690_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_689_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_688_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_687_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_686_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_685_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_684_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_683_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_682_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_681_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_680_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_679_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_678_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_677_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_676_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_675_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_674_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_673_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "projection_input_672_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_2801_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_2801_1_fu_2307.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764", "Parent" : "0", "Child" : ["4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68"],
		"CDFG" : "p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "projection_input_672_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_704_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_736_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_768_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_800_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_832_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_864_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub_ln3017", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_673_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_705_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_737_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_769_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_801_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_833_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_865_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_674_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_706_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_738_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_770_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_802_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_834_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_866_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_675_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_707_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_739_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_771_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_803_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_835_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_867_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_676_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_708_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_740_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_772_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_804_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_836_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_868_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_677_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_709_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_741_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_773_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_805_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_837_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_869_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_678_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_710_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_742_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_774_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_806_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_838_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_870_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_679_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_711_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_743_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_775_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_807_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_839_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_871_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_680_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_712_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_744_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_776_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_808_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_840_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_872_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_681_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_713_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_745_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_777_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_809_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_841_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_873_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_682_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_714_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_746_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_778_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_810_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_842_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_874_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_683_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_715_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_747_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_779_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_811_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_843_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_875_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_684_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_716_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_748_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_780_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_812_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_844_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_876_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_685_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_717_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_749_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_781_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_813_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_845_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_877_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_686_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_718_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_750_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_782_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_814_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_846_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_878_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_687_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_719_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_751_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_783_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_815_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_847_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_879_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_688_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_720_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_752_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_784_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_816_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_848_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_880_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_689_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_721_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_753_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_785_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_817_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_849_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_881_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_690_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_722_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_754_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_786_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_818_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_850_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_882_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_691_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_723_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_755_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_787_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_819_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_851_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_883_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_692_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_724_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_756_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_788_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_820_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_852_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_884_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_693_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_725_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_757_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_789_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_821_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_853_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_885_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_694_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_726_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_758_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_790_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_822_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_854_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_886_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_695_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_727_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_759_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_791_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_823_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_855_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_887_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_696_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_728_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_760_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_792_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_824_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_856_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_888_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_697_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_729_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_761_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_793_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_825_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_857_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_889_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_698_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_730_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_762_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_794_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_826_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_858_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_890_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_699_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_731_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_763_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_795_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_827_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_859_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_891_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_700_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_732_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_764_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_796_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_828_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_860_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_892_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_701_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_733_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_765_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_797_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_829_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_861_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_893_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_702_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_734_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_766_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_798_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_830_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_862_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_894_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_703_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_735_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_767_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_799_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_831_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_863_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "projection_input_895_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out4", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out5", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out6", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out7", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out8", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out9", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out10", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out11", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out12", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out13", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out14", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out15", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out16", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out17", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out18", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out19", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out20", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out21", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out22", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out23", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out24", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out25", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out26", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out27", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out28", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out29", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out30", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out31", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_3012_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5165", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5166", "Parent" : "3"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5167", "Parent" : "3"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5168", "Parent" : "3"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5169", "Parent" : "3"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5170", "Parent" : "3"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5171", "Parent" : "3"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5172", "Parent" : "3"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5173", "Parent" : "3"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5174", "Parent" : "3"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5175", "Parent" : "3"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5176", "Parent" : "3"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5177", "Parent" : "3"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5178", "Parent" : "3"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5179", "Parent" : "3"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5180", "Parent" : "3"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5181", "Parent" : "3"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5182", "Parent" : "3"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5183", "Parent" : "3"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5184", "Parent" : "3"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5185", "Parent" : "3"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5186", "Parent" : "3"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5187", "Parent" : "3"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5188", "Parent" : "3"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5189", "Parent" : "3"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5190", "Parent" : "3"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5191", "Parent" : "3"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5192", "Parent" : "3"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5193", "Parent" : "3"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5194", "Parent" : "3"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5195", "Parent" : "3"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.sparsemux_15_8_16_1_1_U5196", "Parent" : "3"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5197", "Parent" : "3"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5198", "Parent" : "3"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5199", "Parent" : "3"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5200", "Parent" : "3"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5201", "Parent" : "3"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5202", "Parent" : "3"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5203", "Parent" : "3"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5204", "Parent" : "3"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5205", "Parent" : "3"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5206", "Parent" : "3"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5207", "Parent" : "3"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5208", "Parent" : "3"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5209", "Parent" : "3"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5210", "Parent" : "3"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5211", "Parent" : "3"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5212", "Parent" : "3"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5213", "Parent" : "3"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5214", "Parent" : "3"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5215", "Parent" : "3"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5216", "Parent" : "3"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5217", "Parent" : "3"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5218", "Parent" : "3"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5219", "Parent" : "3"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5220", "Parent" : "3"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5221", "Parent" : "3"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5222", "Parent" : "3"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5223", "Parent" : "3"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5224", "Parent" : "3"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5225", "Parent" : "3"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5226", "Parent" : "3"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5227", "Parent" : "3"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.mac_muladd_16s_16s_34s_34_3_1_U5228", "Parent" : "3"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_12s_4ns_12_1_1_U5487", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_16_1_1_U5488", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ama_addmuladd_12ns_3ns_7ns_12ns_12_4_1_U5489", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	p_anonymous_namespace_RunRealtimeProjectionBandQ610 {
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		p_read3 {Type I LastRead 0 FirstWrite -1}
		p_read4 {Type I LastRead 0 FirstWrite -1}
		num_frames {Type I LastRead 0 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1 {Type I LastRead 0 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la {Type I LastRead 0 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8 {Type I LastRead 6 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7 {Type I LastRead 6 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6 {Type I LastRead 6 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5 {Type I LastRead 6 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4 {Type I LastRead 6 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3 {Type I LastRead 6 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2 {Type I LastRead 6 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1 {Type I LastRead 6 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr {Type I LastRead 0 FirstWrite -1}
		output_chunk {Type O LastRead -1 FirstWrite 12}}
	p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_2801_1 {
		projection_input_447 {Type I LastRead 0 FirstWrite -1}
		projection_input_446 {Type I LastRead 0 FirstWrite -1}
		projection_input_445 {Type I LastRead 0 FirstWrite -1}
		projection_input_444 {Type I LastRead 0 FirstWrite -1}
		projection_input_443 {Type I LastRead 0 FirstWrite -1}
		projection_input_442 {Type I LastRead 0 FirstWrite -1}
		projection_input_441 {Type I LastRead 0 FirstWrite -1}
		projection_input_440 {Type I LastRead 0 FirstWrite -1}
		projection_input_439 {Type I LastRead 0 FirstWrite -1}
		projection_input_438 {Type I LastRead 0 FirstWrite -1}
		projection_input_437 {Type I LastRead 0 FirstWrite -1}
		projection_input_436 {Type I LastRead 0 FirstWrite -1}
		projection_input_435 {Type I LastRead 0 FirstWrite -1}
		projection_input_434 {Type I LastRead 0 FirstWrite -1}
		projection_input_433 {Type I LastRead 0 FirstWrite -1}
		projection_input_432 {Type I LastRead 0 FirstWrite -1}
		projection_input_431 {Type I LastRead 0 FirstWrite -1}
		projection_input_430 {Type I LastRead 0 FirstWrite -1}
		projection_input_429 {Type I LastRead 0 FirstWrite -1}
		projection_input_428 {Type I LastRead 0 FirstWrite -1}
		projection_input_427 {Type I LastRead 0 FirstWrite -1}
		projection_input_426 {Type I LastRead 0 FirstWrite -1}
		projection_input_425 {Type I LastRead 0 FirstWrite -1}
		projection_input_424 {Type I LastRead 0 FirstWrite -1}
		projection_input_423 {Type I LastRead 0 FirstWrite -1}
		projection_input_422 {Type I LastRead 0 FirstWrite -1}
		projection_input_421 {Type I LastRead 0 FirstWrite -1}
		projection_input_420 {Type I LastRead 0 FirstWrite -1}
		projection_input_419 {Type I LastRead 0 FirstWrite -1}
		projection_input_418 {Type I LastRead 0 FirstWrite -1}
		projection_input_417 {Type I LastRead 0 FirstWrite -1}
		projection_input_416 {Type I LastRead 0 FirstWrite -1}
		projection_input_415 {Type I LastRead 0 FirstWrite -1}
		projection_input_414 {Type I LastRead 0 FirstWrite -1}
		projection_input_413 {Type I LastRead 0 FirstWrite -1}
		projection_input_412 {Type I LastRead 0 FirstWrite -1}
		projection_input_411 {Type I LastRead 0 FirstWrite -1}
		projection_input_410 {Type I LastRead 0 FirstWrite -1}
		projection_input_409 {Type I LastRead 0 FirstWrite -1}
		projection_input_408 {Type I LastRead 0 FirstWrite -1}
		projection_input_407 {Type I LastRead 0 FirstWrite -1}
		projection_input_406 {Type I LastRead 0 FirstWrite -1}
		projection_input_405 {Type I LastRead 0 FirstWrite -1}
		projection_input_404 {Type I LastRead 0 FirstWrite -1}
		projection_input_403 {Type I LastRead 0 FirstWrite -1}
		projection_input_402 {Type I LastRead 0 FirstWrite -1}
		projection_input_401 {Type I LastRead 0 FirstWrite -1}
		projection_input_400 {Type I LastRead 0 FirstWrite -1}
		projection_input_399 {Type I LastRead 0 FirstWrite -1}
		projection_input_398 {Type I LastRead 0 FirstWrite -1}
		projection_input_397 {Type I LastRead 0 FirstWrite -1}
		projection_input_396 {Type I LastRead 0 FirstWrite -1}
		projection_input_395 {Type I LastRead 0 FirstWrite -1}
		projection_input_394 {Type I LastRead 0 FirstWrite -1}
		projection_input_393 {Type I LastRead 0 FirstWrite -1}
		projection_input_392 {Type I LastRead 0 FirstWrite -1}
		projection_input_391 {Type I LastRead 0 FirstWrite -1}
		projection_input_390 {Type I LastRead 0 FirstWrite -1}
		projection_input_389 {Type I LastRead 0 FirstWrite -1}
		projection_input_388 {Type I LastRead 0 FirstWrite -1}
		projection_input_387 {Type I LastRead 0 FirstWrite -1}
		projection_input_386 {Type I LastRead 0 FirstWrite -1}
		projection_input_385 {Type I LastRead 0 FirstWrite -1}
		projection_input_384 {Type I LastRead 0 FirstWrite -1}
		projection_input_383 {Type I LastRead 0 FirstWrite -1}
		projection_input_382 {Type I LastRead 0 FirstWrite -1}
		projection_input_381 {Type I LastRead 0 FirstWrite -1}
		projection_input_380 {Type I LastRead 0 FirstWrite -1}
		projection_input_379 {Type I LastRead 0 FirstWrite -1}
		projection_input_378 {Type I LastRead 0 FirstWrite -1}
		projection_input_377 {Type I LastRead 0 FirstWrite -1}
		projection_input_376 {Type I LastRead 0 FirstWrite -1}
		projection_input_375 {Type I LastRead 0 FirstWrite -1}
		projection_input_374 {Type I LastRead 0 FirstWrite -1}
		projection_input_373 {Type I LastRead 0 FirstWrite -1}
		projection_input_372 {Type I LastRead 0 FirstWrite -1}
		projection_input_371 {Type I LastRead 0 FirstWrite -1}
		projection_input_370 {Type I LastRead 0 FirstWrite -1}
		projection_input_369 {Type I LastRead 0 FirstWrite -1}
		projection_input_368 {Type I LastRead 0 FirstWrite -1}
		projection_input_367 {Type I LastRead 0 FirstWrite -1}
		projection_input_366 {Type I LastRead 0 FirstWrite -1}
		projection_input_365 {Type I LastRead 0 FirstWrite -1}
		projection_input_364 {Type I LastRead 0 FirstWrite -1}
		projection_input_363 {Type I LastRead 0 FirstWrite -1}
		projection_input_362 {Type I LastRead 0 FirstWrite -1}
		projection_input_361 {Type I LastRead 0 FirstWrite -1}
		projection_input_360 {Type I LastRead 0 FirstWrite -1}
		projection_input_359 {Type I LastRead 0 FirstWrite -1}
		projection_input_358 {Type I LastRead 0 FirstWrite -1}
		projection_input_357 {Type I LastRead 0 FirstWrite -1}
		projection_input_356 {Type I LastRead 0 FirstWrite -1}
		projection_input_355 {Type I LastRead 0 FirstWrite -1}
		projection_input_354 {Type I LastRead 0 FirstWrite -1}
		projection_input_353 {Type I LastRead 0 FirstWrite -1}
		projection_input_352 {Type I LastRead 0 FirstWrite -1}
		projection_input_351 {Type I LastRead 0 FirstWrite -1}
		projection_input_350 {Type I LastRead 0 FirstWrite -1}
		projection_input_349 {Type I LastRead 0 FirstWrite -1}
		projection_input_348 {Type I LastRead 0 FirstWrite -1}
		projection_input_347 {Type I LastRead 0 FirstWrite -1}
		projection_input_346 {Type I LastRead 0 FirstWrite -1}
		projection_input_345 {Type I LastRead 0 FirstWrite -1}
		projection_input_344 {Type I LastRead 0 FirstWrite -1}
		projection_input_343 {Type I LastRead 0 FirstWrite -1}
		projection_input_342 {Type I LastRead 0 FirstWrite -1}
		projection_input_341 {Type I LastRead 0 FirstWrite -1}
		projection_input_340 {Type I LastRead 0 FirstWrite -1}
		projection_input_339 {Type I LastRead 0 FirstWrite -1}
		projection_input_338 {Type I LastRead 0 FirstWrite -1}
		projection_input_337 {Type I LastRead 0 FirstWrite -1}
		projection_input_336 {Type I LastRead 0 FirstWrite -1}
		projection_input_335 {Type I LastRead 0 FirstWrite -1}
		projection_input_334 {Type I LastRead 0 FirstWrite -1}
		projection_input_333 {Type I LastRead 0 FirstWrite -1}
		projection_input_332 {Type I LastRead 0 FirstWrite -1}
		projection_input_331 {Type I LastRead 0 FirstWrite -1}
		projection_input_330 {Type I LastRead 0 FirstWrite -1}
		projection_input_329 {Type I LastRead 0 FirstWrite -1}
		projection_input_328 {Type I LastRead 0 FirstWrite -1}
		projection_input_327 {Type I LastRead 0 FirstWrite -1}
		projection_input_326 {Type I LastRead 0 FirstWrite -1}
		projection_input_325 {Type I LastRead 0 FirstWrite -1}
		projection_input_324 {Type I LastRead 0 FirstWrite -1}
		projection_input_323 {Type I LastRead 0 FirstWrite -1}
		projection_input_322 {Type I LastRead 0 FirstWrite -1}
		projection_input_321 {Type I LastRead 0 FirstWrite -1}
		projection_input_320 {Type I LastRead 0 FirstWrite -1}
		projection_input_319 {Type I LastRead 0 FirstWrite -1}
		projection_input_318 {Type I LastRead 0 FirstWrite -1}
		projection_input_317 {Type I LastRead 0 FirstWrite -1}
		projection_input_316 {Type I LastRead 0 FirstWrite -1}
		projection_input_315 {Type I LastRead 0 FirstWrite -1}
		projection_input_314 {Type I LastRead 0 FirstWrite -1}
		projection_input_313 {Type I LastRead 0 FirstWrite -1}
		projection_input_312 {Type I LastRead 0 FirstWrite -1}
		projection_input_311 {Type I LastRead 0 FirstWrite -1}
		projection_input_310 {Type I LastRead 0 FirstWrite -1}
		projection_input_309 {Type I LastRead 0 FirstWrite -1}
		projection_input_308 {Type I LastRead 0 FirstWrite -1}
		projection_input_307 {Type I LastRead 0 FirstWrite -1}
		projection_input_306 {Type I LastRead 0 FirstWrite -1}
		projection_input_305 {Type I LastRead 0 FirstWrite -1}
		projection_input_304 {Type I LastRead 0 FirstWrite -1}
		projection_input_303 {Type I LastRead 0 FirstWrite -1}
		projection_input_302 {Type I LastRead 0 FirstWrite -1}
		projection_input_301 {Type I LastRead 0 FirstWrite -1}
		projection_input_300 {Type I LastRead 0 FirstWrite -1}
		projection_input_299 {Type I LastRead 0 FirstWrite -1}
		projection_input_298 {Type I LastRead 0 FirstWrite -1}
		projection_input_297 {Type I LastRead 0 FirstWrite -1}
		projection_input_296 {Type I LastRead 0 FirstWrite -1}
		projection_input_295 {Type I LastRead 0 FirstWrite -1}
		projection_input_294 {Type I LastRead 0 FirstWrite -1}
		projection_input_293 {Type I LastRead 0 FirstWrite -1}
		projection_input_292 {Type I LastRead 0 FirstWrite -1}
		projection_input_291 {Type I LastRead 0 FirstWrite -1}
		projection_input_290 {Type I LastRead 0 FirstWrite -1}
		projection_input_289 {Type I LastRead 0 FirstWrite -1}
		projection_input_288 {Type I LastRead 0 FirstWrite -1}
		projection_input_287 {Type I LastRead 0 FirstWrite -1}
		projection_input_286 {Type I LastRead 0 FirstWrite -1}
		projection_input_285 {Type I LastRead 0 FirstWrite -1}
		projection_input_284 {Type I LastRead 0 FirstWrite -1}
		projection_input_283 {Type I LastRead 0 FirstWrite -1}
		projection_input_282 {Type I LastRead 0 FirstWrite -1}
		projection_input_281 {Type I LastRead 0 FirstWrite -1}
		projection_input_280 {Type I LastRead 0 FirstWrite -1}
		projection_input_279 {Type I LastRead 0 FirstWrite -1}
		projection_input_278 {Type I LastRead 0 FirstWrite -1}
		projection_input_277 {Type I LastRead 0 FirstWrite -1}
		projection_input_276 {Type I LastRead 0 FirstWrite -1}
		projection_input_275 {Type I LastRead 0 FirstWrite -1}
		projection_input_274 {Type I LastRead 0 FirstWrite -1}
		projection_input_273 {Type I LastRead 0 FirstWrite -1}
		projection_input_272 {Type I LastRead 0 FirstWrite -1}
		projection_input_271 {Type I LastRead 0 FirstWrite -1}
		projection_input_270 {Type I LastRead 0 FirstWrite -1}
		projection_input_269 {Type I LastRead 0 FirstWrite -1}
		projection_input_268 {Type I LastRead 0 FirstWrite -1}
		projection_input_267 {Type I LastRead 0 FirstWrite -1}
		projection_input_266 {Type I LastRead 0 FirstWrite -1}
		projection_input_265 {Type I LastRead 0 FirstWrite -1}
		projection_input_264 {Type I LastRead 0 FirstWrite -1}
		projection_input_263 {Type I LastRead 0 FirstWrite -1}
		projection_input_262 {Type I LastRead 0 FirstWrite -1}
		projection_input_261 {Type I LastRead 0 FirstWrite -1}
		projection_input_260 {Type I LastRead 0 FirstWrite -1}
		projection_input_259 {Type I LastRead 0 FirstWrite -1}
		projection_input_258 {Type I LastRead 0 FirstWrite -1}
		projection_input_257 {Type I LastRead 0 FirstWrite -1}
		projection_input_256 {Type I LastRead 0 FirstWrite -1}
		projection_input_255 {Type I LastRead 0 FirstWrite -1}
		projection_input_254 {Type I LastRead 0 FirstWrite -1}
		projection_input_253 {Type I LastRead 0 FirstWrite -1}
		projection_input_252 {Type I LastRead 0 FirstWrite -1}
		projection_input_251 {Type I LastRead 0 FirstWrite -1}
		projection_input_250 {Type I LastRead 0 FirstWrite -1}
		projection_input_249 {Type I LastRead 0 FirstWrite -1}
		projection_input_248 {Type I LastRead 0 FirstWrite -1}
		projection_input_247 {Type I LastRead 0 FirstWrite -1}
		projection_input_246 {Type I LastRead 0 FirstWrite -1}
		projection_input_245 {Type I LastRead 0 FirstWrite -1}
		projection_input_244 {Type I LastRead 0 FirstWrite -1}
		projection_input_243 {Type I LastRead 0 FirstWrite -1}
		projection_input_242 {Type I LastRead 0 FirstWrite -1}
		projection_input_241 {Type I LastRead 0 FirstWrite -1}
		projection_input_240 {Type I LastRead 0 FirstWrite -1}
		projection_input_239 {Type I LastRead 0 FirstWrite -1}
		projection_input_238 {Type I LastRead 0 FirstWrite -1}
		projection_input_237 {Type I LastRead 0 FirstWrite -1}
		projection_input_236 {Type I LastRead 0 FirstWrite -1}
		projection_input_235 {Type I LastRead 0 FirstWrite -1}
		projection_input_234 {Type I LastRead 0 FirstWrite -1}
		projection_input_233 {Type I LastRead 0 FirstWrite -1}
		projection_input_232 {Type I LastRead 0 FirstWrite -1}
		projection_input_231 {Type I LastRead 0 FirstWrite -1}
		projection_input_230 {Type I LastRead 0 FirstWrite -1}
		projection_input_229 {Type I LastRead 0 FirstWrite -1}
		projection_input_228 {Type I LastRead 0 FirstWrite -1}
		projection_input_227 {Type I LastRead 0 FirstWrite -1}
		projection_input_226 {Type I LastRead 0 FirstWrite -1}
		projection_input_225 {Type I LastRead 0 FirstWrite -1}
		projection_input_224 {Type I LastRead 0 FirstWrite -1}
		sub_ln2803 {Type I LastRead 0 FirstWrite -1}
		projection_input_895_out {Type O LastRead -1 FirstWrite 0}
		projection_input_894_out {Type O LastRead -1 FirstWrite 0}
		projection_input_893_out {Type O LastRead -1 FirstWrite 0}
		projection_input_892_out {Type O LastRead -1 FirstWrite 0}
		projection_input_891_out {Type O LastRead -1 FirstWrite 0}
		projection_input_890_out {Type O LastRead -1 FirstWrite 0}
		projection_input_889_out {Type O LastRead -1 FirstWrite 0}
		projection_input_888_out {Type O LastRead -1 FirstWrite 0}
		projection_input_887_out {Type O LastRead -1 FirstWrite 0}
		projection_input_886_out {Type O LastRead -1 FirstWrite 0}
		projection_input_885_out {Type O LastRead -1 FirstWrite 0}
		projection_input_884_out {Type O LastRead -1 FirstWrite 0}
		projection_input_883_out {Type O LastRead -1 FirstWrite 0}
		projection_input_882_out {Type O LastRead -1 FirstWrite 0}
		projection_input_881_out {Type O LastRead -1 FirstWrite 0}
		projection_input_880_out {Type O LastRead -1 FirstWrite 0}
		projection_input_879_out {Type O LastRead -1 FirstWrite 0}
		projection_input_878_out {Type O LastRead -1 FirstWrite 0}
		projection_input_877_out {Type O LastRead -1 FirstWrite 0}
		projection_input_876_out {Type O LastRead -1 FirstWrite 0}
		projection_input_875_out {Type O LastRead -1 FirstWrite 0}
		projection_input_874_out {Type O LastRead -1 FirstWrite 0}
		projection_input_873_out {Type O LastRead -1 FirstWrite 0}
		projection_input_872_out {Type O LastRead -1 FirstWrite 0}
		projection_input_871_out {Type O LastRead -1 FirstWrite 0}
		projection_input_870_out {Type O LastRead -1 FirstWrite 0}
		projection_input_869_out {Type O LastRead -1 FirstWrite 0}
		projection_input_868_out {Type O LastRead -1 FirstWrite 0}
		projection_input_867_out {Type O LastRead -1 FirstWrite 0}
		projection_input_866_out {Type O LastRead -1 FirstWrite 0}
		projection_input_865_out {Type O LastRead -1 FirstWrite 0}
		projection_input_864_out {Type O LastRead -1 FirstWrite 0}
		projection_input_863_out {Type O LastRead -1 FirstWrite 0}
		projection_input_862_out {Type O LastRead -1 FirstWrite 0}
		projection_input_861_out {Type O LastRead -1 FirstWrite 0}
		projection_input_860_out {Type O LastRead -1 FirstWrite 0}
		projection_input_859_out {Type O LastRead -1 FirstWrite 0}
		projection_input_858_out {Type O LastRead -1 FirstWrite 0}
		projection_input_857_out {Type O LastRead -1 FirstWrite 0}
		projection_input_856_out {Type O LastRead -1 FirstWrite 0}
		projection_input_855_out {Type O LastRead -1 FirstWrite 0}
		projection_input_854_out {Type O LastRead -1 FirstWrite 0}
		projection_input_853_out {Type O LastRead -1 FirstWrite 0}
		projection_input_852_out {Type O LastRead -1 FirstWrite 0}
		projection_input_851_out {Type O LastRead -1 FirstWrite 0}
		projection_input_850_out {Type O LastRead -1 FirstWrite 0}
		projection_input_849_out {Type O LastRead -1 FirstWrite 0}
		projection_input_848_out {Type O LastRead -1 FirstWrite 0}
		projection_input_847_out {Type O LastRead -1 FirstWrite 0}
		projection_input_846_out {Type O LastRead -1 FirstWrite 0}
		projection_input_845_out {Type O LastRead -1 FirstWrite 0}
		projection_input_844_out {Type O LastRead -1 FirstWrite 0}
		projection_input_843_out {Type O LastRead -1 FirstWrite 0}
		projection_input_842_out {Type O LastRead -1 FirstWrite 0}
		projection_input_841_out {Type O LastRead -1 FirstWrite 0}
		projection_input_840_out {Type O LastRead -1 FirstWrite 0}
		projection_input_839_out {Type O LastRead -1 FirstWrite 0}
		projection_input_838_out {Type O LastRead -1 FirstWrite 0}
		projection_input_837_out {Type O LastRead -1 FirstWrite 0}
		projection_input_836_out {Type O LastRead -1 FirstWrite 0}
		projection_input_835_out {Type O LastRead -1 FirstWrite 0}
		projection_input_834_out {Type O LastRead -1 FirstWrite 0}
		projection_input_833_out {Type O LastRead -1 FirstWrite 0}
		projection_input_832_out {Type O LastRead -1 FirstWrite 0}
		projection_input_831_out {Type O LastRead -1 FirstWrite 0}
		projection_input_830_out {Type O LastRead -1 FirstWrite 0}
		projection_input_829_out {Type O LastRead -1 FirstWrite 0}
		projection_input_828_out {Type O LastRead -1 FirstWrite 0}
		projection_input_827_out {Type O LastRead -1 FirstWrite 0}
		projection_input_826_out {Type O LastRead -1 FirstWrite 0}
		projection_input_825_out {Type O LastRead -1 FirstWrite 0}
		projection_input_824_out {Type O LastRead -1 FirstWrite 0}
		projection_input_823_out {Type O LastRead -1 FirstWrite 0}
		projection_input_822_out {Type O LastRead -1 FirstWrite 0}
		projection_input_821_out {Type O LastRead -1 FirstWrite 0}
		projection_input_820_out {Type O LastRead -1 FirstWrite 0}
		projection_input_819_out {Type O LastRead -1 FirstWrite 0}
		projection_input_818_out {Type O LastRead -1 FirstWrite 0}
		projection_input_817_out {Type O LastRead -1 FirstWrite 0}
		projection_input_816_out {Type O LastRead -1 FirstWrite 0}
		projection_input_815_out {Type O LastRead -1 FirstWrite 0}
		projection_input_814_out {Type O LastRead -1 FirstWrite 0}
		projection_input_813_out {Type O LastRead -1 FirstWrite 0}
		projection_input_812_out {Type O LastRead -1 FirstWrite 0}
		projection_input_811_out {Type O LastRead -1 FirstWrite 0}
		projection_input_810_out {Type O LastRead -1 FirstWrite 0}
		projection_input_809_out {Type O LastRead -1 FirstWrite 0}
		projection_input_808_out {Type O LastRead -1 FirstWrite 0}
		projection_input_807_out {Type O LastRead -1 FirstWrite 0}
		projection_input_806_out {Type O LastRead -1 FirstWrite 0}
		projection_input_805_out {Type O LastRead -1 FirstWrite 0}
		projection_input_804_out {Type O LastRead -1 FirstWrite 0}
		projection_input_803_out {Type O LastRead -1 FirstWrite 0}
		projection_input_802_out {Type O LastRead -1 FirstWrite 0}
		projection_input_801_out {Type O LastRead -1 FirstWrite 0}
		projection_input_800_out {Type O LastRead -1 FirstWrite 0}
		projection_input_799_out {Type O LastRead -1 FirstWrite 0}
		projection_input_798_out {Type O LastRead -1 FirstWrite 0}
		projection_input_797_out {Type O LastRead -1 FirstWrite 0}
		projection_input_796_out {Type O LastRead -1 FirstWrite 0}
		projection_input_795_out {Type O LastRead -1 FirstWrite 0}
		projection_input_794_out {Type O LastRead -1 FirstWrite 0}
		projection_input_793_out {Type O LastRead -1 FirstWrite 0}
		projection_input_792_out {Type O LastRead -1 FirstWrite 0}
		projection_input_791_out {Type O LastRead -1 FirstWrite 0}
		projection_input_790_out {Type O LastRead -1 FirstWrite 0}
		projection_input_789_out {Type O LastRead -1 FirstWrite 0}
		projection_input_788_out {Type O LastRead -1 FirstWrite 0}
		projection_input_787_out {Type O LastRead -1 FirstWrite 0}
		projection_input_786_out {Type O LastRead -1 FirstWrite 0}
		projection_input_785_out {Type O LastRead -1 FirstWrite 0}
		projection_input_784_out {Type O LastRead -1 FirstWrite 0}
		projection_input_783_out {Type O LastRead -1 FirstWrite 0}
		projection_input_782_out {Type O LastRead -1 FirstWrite 0}
		projection_input_781_out {Type O LastRead -1 FirstWrite 0}
		projection_input_780_out {Type O LastRead -1 FirstWrite 0}
		projection_input_779_out {Type O LastRead -1 FirstWrite 0}
		projection_input_778_out {Type O LastRead -1 FirstWrite 0}
		projection_input_777_out {Type O LastRead -1 FirstWrite 0}
		projection_input_776_out {Type O LastRead -1 FirstWrite 0}
		projection_input_775_out {Type O LastRead -1 FirstWrite 0}
		projection_input_774_out {Type O LastRead -1 FirstWrite 0}
		projection_input_773_out {Type O LastRead -1 FirstWrite 0}
		projection_input_772_out {Type O LastRead -1 FirstWrite 0}
		projection_input_771_out {Type O LastRead -1 FirstWrite 0}
		projection_input_770_out {Type O LastRead -1 FirstWrite 0}
		projection_input_769_out {Type O LastRead -1 FirstWrite 0}
		projection_input_768_out {Type O LastRead -1 FirstWrite 0}
		projection_input_767_out {Type O LastRead -1 FirstWrite 0}
		projection_input_766_out {Type O LastRead -1 FirstWrite 0}
		projection_input_765_out {Type O LastRead -1 FirstWrite 0}
		projection_input_764_out {Type O LastRead -1 FirstWrite 0}
		projection_input_763_out {Type O LastRead -1 FirstWrite 0}
		projection_input_762_out {Type O LastRead -1 FirstWrite 0}
		projection_input_761_out {Type O LastRead -1 FirstWrite 0}
		projection_input_760_out {Type O LastRead -1 FirstWrite 0}
		projection_input_759_out {Type O LastRead -1 FirstWrite 0}
		projection_input_758_out {Type O LastRead -1 FirstWrite 0}
		projection_input_757_out {Type O LastRead -1 FirstWrite 0}
		projection_input_756_out {Type O LastRead -1 FirstWrite 0}
		projection_input_755_out {Type O LastRead -1 FirstWrite 0}
		projection_input_754_out {Type O LastRead -1 FirstWrite 0}
		projection_input_753_out {Type O LastRead -1 FirstWrite 0}
		projection_input_752_out {Type O LastRead -1 FirstWrite 0}
		projection_input_751_out {Type O LastRead -1 FirstWrite 0}
		projection_input_750_out {Type O LastRead -1 FirstWrite 0}
		projection_input_749_out {Type O LastRead -1 FirstWrite 0}
		projection_input_748_out {Type O LastRead -1 FirstWrite 0}
		projection_input_747_out {Type O LastRead -1 FirstWrite 0}
		projection_input_746_out {Type O LastRead -1 FirstWrite 0}
		projection_input_745_out {Type O LastRead -1 FirstWrite 0}
		projection_input_744_out {Type O LastRead -1 FirstWrite 0}
		projection_input_743_out {Type O LastRead -1 FirstWrite 0}
		projection_input_742_out {Type O LastRead -1 FirstWrite 0}
		projection_input_741_out {Type O LastRead -1 FirstWrite 0}
		projection_input_740_out {Type O LastRead -1 FirstWrite 0}
		projection_input_739_out {Type O LastRead -1 FirstWrite 0}
		projection_input_738_out {Type O LastRead -1 FirstWrite 0}
		projection_input_737_out {Type O LastRead -1 FirstWrite 0}
		projection_input_736_out {Type O LastRead -1 FirstWrite 0}
		projection_input_735_out {Type O LastRead -1 FirstWrite 0}
		projection_input_734_out {Type O LastRead -1 FirstWrite 0}
		projection_input_733_out {Type O LastRead -1 FirstWrite 0}
		projection_input_732_out {Type O LastRead -1 FirstWrite 0}
		projection_input_731_out {Type O LastRead -1 FirstWrite 0}
		projection_input_730_out {Type O LastRead -1 FirstWrite 0}
		projection_input_729_out {Type O LastRead -1 FirstWrite 0}
		projection_input_728_out {Type O LastRead -1 FirstWrite 0}
		projection_input_727_out {Type O LastRead -1 FirstWrite 0}
		projection_input_726_out {Type O LastRead -1 FirstWrite 0}
		projection_input_725_out {Type O LastRead -1 FirstWrite 0}
		projection_input_724_out {Type O LastRead -1 FirstWrite 0}
		projection_input_723_out {Type O LastRead -1 FirstWrite 0}
		projection_input_722_out {Type O LastRead -1 FirstWrite 0}
		projection_input_721_out {Type O LastRead -1 FirstWrite 0}
		projection_input_720_out {Type O LastRead -1 FirstWrite 0}
		projection_input_719_out {Type O LastRead -1 FirstWrite 0}
		projection_input_718_out {Type O LastRead -1 FirstWrite 0}
		projection_input_717_out {Type O LastRead -1 FirstWrite 0}
		projection_input_716_out {Type O LastRead -1 FirstWrite 0}
		projection_input_715_out {Type O LastRead -1 FirstWrite 0}
		projection_input_714_out {Type O LastRead -1 FirstWrite 0}
		projection_input_713_out {Type O LastRead -1 FirstWrite 0}
		projection_input_712_out {Type O LastRead -1 FirstWrite 0}
		projection_input_711_out {Type O LastRead -1 FirstWrite 0}
		projection_input_710_out {Type O LastRead -1 FirstWrite 0}
		projection_input_709_out {Type O LastRead -1 FirstWrite 0}
		projection_input_708_out {Type O LastRead -1 FirstWrite 0}
		projection_input_707_out {Type O LastRead -1 FirstWrite 0}
		projection_input_706_out {Type O LastRead -1 FirstWrite 0}
		projection_input_705_out {Type O LastRead -1 FirstWrite 0}
		projection_input_704_out {Type O LastRead -1 FirstWrite 0}
		projection_input_703_out {Type O LastRead -1 FirstWrite 0}
		projection_input_702_out {Type O LastRead -1 FirstWrite 0}
		projection_input_701_out {Type O LastRead -1 FirstWrite 0}
		projection_input_700_out {Type O LastRead -1 FirstWrite 0}
		projection_input_699_out {Type O LastRead -1 FirstWrite 0}
		projection_input_698_out {Type O LastRead -1 FirstWrite 0}
		projection_input_697_out {Type O LastRead -1 FirstWrite 0}
		projection_input_696_out {Type O LastRead -1 FirstWrite 0}
		projection_input_695_out {Type O LastRead -1 FirstWrite 0}
		projection_input_694_out {Type O LastRead -1 FirstWrite 0}
		projection_input_693_out {Type O LastRead -1 FirstWrite 0}
		projection_input_692_out {Type O LastRead -1 FirstWrite 0}
		projection_input_691_out {Type O LastRead -1 FirstWrite 0}
		projection_input_690_out {Type O LastRead -1 FirstWrite 0}
		projection_input_689_out {Type O LastRead -1 FirstWrite 0}
		projection_input_688_out {Type O LastRead -1 FirstWrite 0}
		projection_input_687_out {Type O LastRead -1 FirstWrite 0}
		projection_input_686_out {Type O LastRead -1 FirstWrite 0}
		projection_input_685_out {Type O LastRead -1 FirstWrite 0}
		projection_input_684_out {Type O LastRead -1 FirstWrite 0}
		projection_input_683_out {Type O LastRead -1 FirstWrite 0}
		projection_input_682_out {Type O LastRead -1 FirstWrite 0}
		projection_input_681_out {Type O LastRead -1 FirstWrite 0}
		projection_input_680_out {Type O LastRead -1 FirstWrite 0}
		projection_input_679_out {Type O LastRead -1 FirstWrite 0}
		projection_input_678_out {Type O LastRead -1 FirstWrite 0}
		projection_input_677_out {Type O LastRead -1 FirstWrite 0}
		projection_input_676_out {Type O LastRead -1 FirstWrite 0}
		projection_input_675_out {Type O LastRead -1 FirstWrite 0}
		projection_input_674_out {Type O LastRead -1 FirstWrite 0}
		projection_input_673_out {Type O LastRead -1 FirstWrite 0}
		projection_input_672_out {Type O LastRead -1 FirstWrite 0}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1 {Type I LastRead 0 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la {Type I LastRead 0 FirstWrite -1}}
	p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2 {
		projection_input_672_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_704_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_736_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_768_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_800_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_832_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_864_reload {Type I LastRead 0 FirstWrite -1}
		sub_ln3017 {Type I LastRead 0 FirstWrite -1}
		projection_input_673_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_705_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_737_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_769_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_801_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_833_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_865_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_674_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_706_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_738_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_770_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_802_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_834_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_866_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_675_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_707_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_739_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_771_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_803_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_835_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_867_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_676_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_708_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_740_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_772_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_804_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_836_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_868_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_677_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_709_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_741_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_773_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_805_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_837_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_869_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_678_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_710_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_742_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_774_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_806_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_838_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_870_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_679_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_711_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_743_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_775_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_807_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_839_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_871_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_680_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_712_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_744_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_776_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_808_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_840_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_872_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_681_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_713_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_745_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_777_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_809_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_841_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_873_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_682_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_714_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_746_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_778_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_810_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_842_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_874_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_683_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_715_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_747_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_779_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_811_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_843_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_875_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_684_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_716_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_748_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_780_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_812_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_844_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_876_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_685_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_717_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_749_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_781_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_813_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_845_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_877_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_686_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_718_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_750_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_782_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_814_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_846_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_878_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_687_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_719_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_751_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_783_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_815_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_847_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_879_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_688_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_720_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_752_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_784_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_816_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_848_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_880_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_689_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_721_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_753_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_785_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_817_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_849_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_881_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_690_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_722_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_754_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_786_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_818_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_850_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_882_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_691_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_723_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_755_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_787_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_819_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_851_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_883_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_692_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_724_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_756_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_788_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_820_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_852_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_884_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_693_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_725_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_757_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_789_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_821_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_853_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_885_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_694_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_726_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_758_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_790_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_822_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_854_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_886_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_695_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_727_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_759_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_791_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_823_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_855_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_887_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_696_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_728_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_760_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_792_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_824_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_856_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_888_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_697_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_729_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_761_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_793_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_825_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_857_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_889_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_698_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_730_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_762_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_794_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_826_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_858_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_890_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_699_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_731_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_763_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_795_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_827_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_859_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_891_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_700_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_732_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_764_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_796_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_828_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_860_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_892_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_701_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_733_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_765_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_797_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_829_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_861_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_893_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_702_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_734_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_766_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_798_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_830_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_862_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_894_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_703_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_735_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_767_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_799_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_831_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_863_reload {Type I LastRead 0 FirstWrite -1}
		projection_input_895_reload {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 2}
		p_out1 {Type O LastRead -1 FirstWrite 2}
		p_out2 {Type O LastRead -1 FirstWrite 2}
		p_out3 {Type O LastRead -1 FirstWrite 2}
		p_out4 {Type O LastRead -1 FirstWrite 2}
		p_out5 {Type O LastRead -1 FirstWrite 2}
		p_out6 {Type O LastRead -1 FirstWrite 2}
		p_out7 {Type O LastRead -1 FirstWrite 2}
		p_out8 {Type O LastRead -1 FirstWrite 2}
		p_out9 {Type O LastRead -1 FirstWrite 2}
		p_out10 {Type O LastRead -1 FirstWrite 2}
		p_out11 {Type O LastRead -1 FirstWrite 2}
		p_out12 {Type O LastRead -1 FirstWrite 2}
		p_out13 {Type O LastRead -1 FirstWrite 2}
		p_out14 {Type O LastRead -1 FirstWrite 2}
		p_out15 {Type O LastRead -1 FirstWrite 2}
		p_out16 {Type O LastRead -1 FirstWrite 2}
		p_out17 {Type O LastRead -1 FirstWrite 2}
		p_out18 {Type O LastRead -1 FirstWrite 2}
		p_out19 {Type O LastRead -1 FirstWrite 2}
		p_out20 {Type O LastRead -1 FirstWrite 2}
		p_out21 {Type O LastRead -1 FirstWrite 2}
		p_out22 {Type O LastRead -1 FirstWrite 2}
		p_out23 {Type O LastRead -1 FirstWrite 2}
		p_out24 {Type O LastRead -1 FirstWrite 2}
		p_out25 {Type O LastRead -1 FirstWrite 2}
		p_out26 {Type O LastRead -1 FirstWrite 2}
		p_out27 {Type O LastRead -1 FirstWrite 2}
		p_out28 {Type O LastRead -1 FirstWrite 2}
		p_out29 {Type O LastRead -1 FirstWrite 2}
		p_out30 {Type O LastRead -1 FirstWrite 2}
		p_out31 {Type O LastRead -1 FirstWrite 2}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "9", "Max" : "124105"}
	, {"Name" : "Interval", "Min" : "9", "Max" : "124105"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	p_read { ap_none {  { p_read in_data 0 2 } } }
	p_read1 { ap_none {  { p_read1 in_data 0 7 } } }
	p_read2 { ap_none {  { p_read2 in_data 0 3 } } }
	p_read3 { ap_none {  { p_read3 in_data 0 4 } } }
	p_read4 { ap_none {  { p_read4 in_data 0 8 } } }
	num_frames { ap_none {  { num_frames in_data 0 3 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_address0 mem_address 1 12 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_q0 mem_dout 0 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_address0 mem_address 1 12 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_q0 mem_dout 0 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8_address0 mem_address 1 5 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8_q0 in_data 0 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7_address0 mem_address 1 5 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7_q0 in_data 0 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6_address0 mem_address 1 5 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6_q0 in_data 0 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5_address0 mem_address 1 5 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5_q0 in_data 0 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4_address0 mem_address 1 5 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4_q0 in_data 0 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3_address0 mem_address 1 5 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3_q0 in_data 0 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2_address0 mem_address 1 5 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2_q0 in_data 0 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1_address0 mem_address 1 5 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1_q0 in_data 0 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_address0 mem_address 1 11 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_q0 mem_dout 0 512 } } }
	output_chunk { ap_memory {  { output_chunk_address1 MemPortADDR2 1 13 }  { output_chunk_ce1 MemPortCE2 1 1 }  { output_chunk_we1 MemPortWE2 1 1 }  { output_chunk_d1 MemPortDIN2 1 16 } } }
}

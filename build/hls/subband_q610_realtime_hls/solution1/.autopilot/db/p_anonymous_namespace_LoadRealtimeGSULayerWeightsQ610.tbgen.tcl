set moduleName p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610
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
set C_modelName {(anonymous namespace)LoadRealtimeGSULayerWeightsQ610}
set C_modelType { int 32 }
set C_modelArgList {
	{ weights int 256 regular {axi_master 0}  }
	{ weights_q610 int 32 regular  }
	{ weight_offset_read int 32 regular  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1 int 512 regular {array 784 { 3 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we int 512 regular {array 784 { 3 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3 int 512 regular {array 784 { 3 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2 int 512 regular {array 784 { 3 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1 int 16 regular {array 224 { 0 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi int 16 regular {array 224 { 0 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1 int 16 regular {array 112 { 0 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn int 16 regular {array 112 { 0 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3 int 16 regular {array 112 { 0 0 } 0 1 } {global 1}  }
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2 int 16 regular {array 112 { 0 0 } 0 1 } {global 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "weights", "interface" : "axi_master", "bitwidth" : 256, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "weights_q610","offset": { "type": "dynamic","port_name": "weights_q610","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "weights_q610", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weight_offset_read", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 119
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_weights_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_weights_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_weights_AWADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_weights_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_weights_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_weights_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_weights_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_weights_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_weights_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_weights_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_weights_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_weights_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_weights_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_weights_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_weights_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_weights_WDATA sc_out sc_lv 256 signal 0 } 
	{ m_axi_weights_WSTRB sc_out sc_lv 32 signal 0 } 
	{ m_axi_weights_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_weights_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_weights_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_weights_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_weights_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_weights_ARADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_weights_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_weights_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_weights_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_weights_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_weights_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_weights_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_weights_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_weights_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_weights_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_weights_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_weights_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_weights_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_weights_RDATA sc_in sc_lv 256 signal 0 } 
	{ m_axi_weights_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_weights_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_weights_RFIFONUM sc_in sc_lv 5 signal 0 } 
	{ m_axi_weights_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_weights_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_weights_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_weights_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_weights_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_weights_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_weights_BUSER sc_in sc_lv 1 signal 0 } 
	{ weights_q610 sc_in sc_lv 32 signal 1 } 
	{ weight_offset_read sc_in sc_lv 32 signal 2 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1_address1 sc_out sc_lv 10 signal 3 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1_ce1 sc_out sc_logic 1 signal 3 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1_we1 sc_out sc_logic 1 signal 3 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1_d1 sc_out sc_lv 512 signal 3 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_address1 sc_out sc_lv 10 signal 4 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_ce1 sc_out sc_logic 1 signal 4 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_we1 sc_out sc_logic 1 signal 4 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_d1 sc_out sc_lv 512 signal 4 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3_address1 sc_out sc_lv 10 signal 5 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3_ce1 sc_out sc_logic 1 signal 5 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3_we1 sc_out sc_logic 1 signal 5 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3_d1 sc_out sc_lv 512 signal 5 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2_address1 sc_out sc_lv 10 signal 6 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2_ce1 sc_out sc_logic 1 signal 6 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2_we1 sc_out sc_logic 1 signal 6 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2_d1 sc_out sc_lv 512 signal 6 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_address0 sc_out sc_lv 8 signal 7 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_ce0 sc_out sc_logic 1 signal 7 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_we0 sc_out sc_logic 1 signal 7 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_d0 sc_out sc_lv 16 signal 7 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_address1 sc_out sc_lv 8 signal 7 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_ce1 sc_out sc_logic 1 signal 7 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_we1 sc_out sc_logic 1 signal 7 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_d1 sc_out sc_lv 16 signal 7 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_address0 sc_out sc_lv 8 signal 8 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_ce0 sc_out sc_logic 1 signal 8 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_we0 sc_out sc_logic 1 signal 8 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_d0 sc_out sc_lv 16 signal 8 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_address1 sc_out sc_lv 8 signal 8 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_ce1 sc_out sc_logic 1 signal 8 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_we1 sc_out sc_logic 1 signal 8 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_d1 sc_out sc_lv 16 signal 8 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_address0 sc_out sc_lv 7 signal 9 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_ce0 sc_out sc_logic 1 signal 9 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_we0 sc_out sc_logic 1 signal 9 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_d0 sc_out sc_lv 16 signal 9 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_address1 sc_out sc_lv 7 signal 9 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_ce1 sc_out sc_logic 1 signal 9 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_we1 sc_out sc_logic 1 signal 9 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_d1 sc_out sc_lv 16 signal 9 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_address0 sc_out sc_lv 7 signal 10 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_ce0 sc_out sc_logic 1 signal 10 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_we0 sc_out sc_logic 1 signal 10 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_d0 sc_out sc_lv 16 signal 10 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_address1 sc_out sc_lv 7 signal 10 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_ce1 sc_out sc_logic 1 signal 10 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_we1 sc_out sc_logic 1 signal 10 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_d1 sc_out sc_lv 16 signal 10 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_address0 sc_out sc_lv 7 signal 11 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_ce0 sc_out sc_logic 1 signal 11 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_we0 sc_out sc_logic 1 signal 11 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_d0 sc_out sc_lv 16 signal 11 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_address1 sc_out sc_lv 7 signal 11 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_ce1 sc_out sc_logic 1 signal 11 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_we1 sc_out sc_logic 1 signal 11 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_d1 sc_out sc_lv 16 signal 11 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_address0 sc_out sc_lv 7 signal 12 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_ce0 sc_out sc_logic 1 signal 12 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_we0 sc_out sc_logic 1 signal 12 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_d0 sc_out sc_lv 16 signal 12 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_address1 sc_out sc_lv 7 signal 12 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_ce1 sc_out sc_logic 1 signal 12 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_we1 sc_out sc_logic 1 signal 12 } 
	{ RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_d1 sc_out sc_lv 16 signal 12 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_weights_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "AWVALID" }} , 
 	{ "name": "m_axi_weights_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "AWREADY" }} , 
 	{ "name": "m_axi_weights_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights", "role": "AWADDR" }} , 
 	{ "name": "m_axi_weights_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "AWID" }} , 
 	{ "name": "m_axi_weights_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights", "role": "AWLEN" }} , 
 	{ "name": "m_axi_weights_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weights", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_weights_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "weights", "role": "AWBURST" }} , 
 	{ "name": "m_axi_weights_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "weights", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_weights_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "weights", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_weights_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weights", "role": "AWPROT" }} , 
 	{ "name": "m_axi_weights_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "weights", "role": "AWQOS" }} , 
 	{ "name": "m_axi_weights_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "weights", "role": "AWREGION" }} , 
 	{ "name": "m_axi_weights_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "AWUSER" }} , 
 	{ "name": "m_axi_weights_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "WVALID" }} , 
 	{ "name": "m_axi_weights_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "WREADY" }} , 
 	{ "name": "m_axi_weights_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "weights", "role": "WDATA" }} , 
 	{ "name": "m_axi_weights_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights", "role": "WSTRB" }} , 
 	{ "name": "m_axi_weights_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "WLAST" }} , 
 	{ "name": "m_axi_weights_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "WID" }} , 
 	{ "name": "m_axi_weights_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "WUSER" }} , 
 	{ "name": "m_axi_weights_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "ARVALID" }} , 
 	{ "name": "m_axi_weights_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "ARREADY" }} , 
 	{ "name": "m_axi_weights_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights", "role": "ARADDR" }} , 
 	{ "name": "m_axi_weights_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "ARID" }} , 
 	{ "name": "m_axi_weights_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights", "role": "ARLEN" }} , 
 	{ "name": "m_axi_weights_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weights", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_weights_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "weights", "role": "ARBURST" }} , 
 	{ "name": "m_axi_weights_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "weights", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_weights_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "weights", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_weights_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weights", "role": "ARPROT" }} , 
 	{ "name": "m_axi_weights_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "weights", "role": "ARQOS" }} , 
 	{ "name": "m_axi_weights_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "weights", "role": "ARREGION" }} , 
 	{ "name": "m_axi_weights_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "ARUSER" }} , 
 	{ "name": "m_axi_weights_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "RVALID" }} , 
 	{ "name": "m_axi_weights_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "RREADY" }} , 
 	{ "name": "m_axi_weights_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "weights", "role": "RDATA" }} , 
 	{ "name": "m_axi_weights_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "RLAST" }} , 
 	{ "name": "m_axi_weights_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "RID" }} , 
 	{ "name": "m_axi_weights_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "weights", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_weights_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "RUSER" }} , 
 	{ "name": "m_axi_weights_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "weights", "role": "RRESP" }} , 
 	{ "name": "m_axi_weights_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "BVALID" }} , 
 	{ "name": "m_axi_weights_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "BREADY" }} , 
 	{ "name": "m_axi_weights_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "weights", "role": "BRESP" }} , 
 	{ "name": "m_axi_weights_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "BID" }} , 
 	{ "name": "m_axi_weights_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "weights", "role": "BUSER" }} , 
 	{ "name": "weights_q610", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weights_q610", "role": "default" }} , 
 	{ "name": "weight_offset_read", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weight_offset_read", "role": "default" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1", "role": "we0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1", "role": "d0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi", "role": "we0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi", "role": "d0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1", "role": "we0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1", "role": "d0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn", "role": "we0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn", "role": "d0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3", "role": "we0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3", "role": "d0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3", "role": "d1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2", "role": "address0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2", "role": "ce0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2", "role": "we0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2", "role": "d0" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2", "role": "address1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2", "role": "ce1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2", "role": "we1" }} , 
 	{ "name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2", "role": "d1" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "7", "9"],
		"CDFG" : "p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6568", "EstimateLatencyMax" : "6568",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weights", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2555_9_s_fu_106", "Port" : "weights", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "7", "SubInstance" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2569_12_fu_118", "Port" : "weights", "Inst_start_state" : "7", "Inst_end_state" : "8"},
					{"ID" : "9", "SubInstance" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2580_14_fu_130", "Port" : "weights", "Inst_start_state" : "9", "Inst_end_state" : "10"},
					{"ID" : "1", "SubInstance" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2513_1_s_fu_80", "Port" : "weights", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "3", "SubInstance" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2534_5_s_fu_94", "Port" : "weights", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weights_q610", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_offset_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2513_1_s_fu_80", "Port" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2513_1_s_fu_80", "Port" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2534_5_s_fu_94", "Port" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2534_5_s_fu_94", "Port" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2555_9_s_fu_106", "Port" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2555_9_s_fu_106", "Port" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2569_12_fu_118", "Port" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2569_12_fu_118", "Port" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn", "Inst_start_state" : "7", "Inst_end_state" : "8"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2580_14_fu_130", "Port" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3", "Inst_start_state" : "9", "Inst_end_state" : "10"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2580_14_fu_130", "Port" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2", "Inst_start_state" : "9", "Inst_end_state" : "10"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2513_1_s_fu_80", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2513_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3149", "EstimateLatencyMax" : "3149",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weight_offset_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_q610", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "weights_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "weights_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_2513_1_VITIS_LOOP_2514_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2513_1_s_fu_80.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2534_5_s_fu_94", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2534_5_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3149", "EstimateLatencyMax" : "3149",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weight_offset_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_q610", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "weights_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "weights_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_2534_5_VITIS_LOOP_2535_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2534_5_s_fu_94.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2555_9_s_fu_106", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2555_9_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "125", "EstimateLatencyMax" : "125",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weight_offset_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_q610", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "weights_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "weights_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_2555_9_VITIS_LOOP_2556_10", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage3", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage3_subdone", "QuitState" : "ap_ST_fsm_pp0_stage3", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage3_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2555_9_s_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2569_12_fu_118", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2569_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "68", "EstimateLatencyMax" : "68",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weight_offset_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_q610", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "weights_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "weights_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_2569_12", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2569_12_fu_118.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2580_14_fu_130", "Parent" : "0", "Child" : ["10"],
		"CDFG" : "p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2580_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "68", "EstimateLatencyMax" : "68",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weight_offset_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights_q610", "Type" : "None", "Direction" : "I"},
			{"Name" : "weights", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "weights_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "weights_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_2580_14", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2580_14_fu_130.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"}]}


set ArgLastReadFirstWriteLatency {
	p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610 {
		weights {Type I LastRead 12 FirstWrite -1}
		weights_q610 {Type I LastRead 0 FirstWrite -1}
		weight_offset_read {Type I LastRead 0 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1 {Type O LastRead -1 FirstWrite 13}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we {Type O LastRead -1 FirstWrite 13}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3 {Type O LastRead -1 FirstWrite 13}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2 {Type O LastRead -1 FirstWrite 13}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1 {Type O LastRead -1 FirstWrite 12}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi {Type O LastRead -1 FirstWrite 12}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1 {Type O LastRead -1 FirstWrite 11}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn {Type O LastRead -1 FirstWrite 11}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3 {Type O LastRead -1 FirstWrite 11}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2 {Type O LastRead -1 FirstWrite 11}}
	p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2513_1_s {
		weight_offset_read {Type I LastRead 0 FirstWrite -1}
		weights_q610 {Type I LastRead 0 FirstWrite -1}
		weights {Type I LastRead 12 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1 {Type O LastRead -1 FirstWrite 13}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we {Type O LastRead -1 FirstWrite 13}}
	p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2534_5_s {
		weight_offset_read {Type I LastRead 0 FirstWrite -1}
		weights_q610 {Type I LastRead 0 FirstWrite -1}
		weights {Type I LastRead 12 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3 {Type O LastRead -1 FirstWrite 13}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2 {Type O LastRead -1 FirstWrite 13}}
	p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2555_9_s {
		weight_offset_read {Type I LastRead 0 FirstWrite -1}
		weights_q610 {Type I LastRead 0 FirstWrite -1}
		weights {Type I LastRead 11 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1 {Type O LastRead -1 FirstWrite 12}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi {Type O LastRead -1 FirstWrite 12}}
	p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2569_12 {
		weight_offset_read {Type I LastRead 0 FirstWrite -1}
		weights_q610 {Type I LastRead 0 FirstWrite -1}
		weights {Type I LastRead 10 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1 {Type O LastRead -1 FirstWrite 11}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn {Type O LastRead -1 FirstWrite 11}}
	p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2580_14 {
		weight_offset_read {Type I LastRead 0 FirstWrite -1}
		weights_q610 {Type I LastRead 0 FirstWrite -1}
		weights {Type I LastRead 10 FirstWrite -1}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3 {Type O LastRead -1 FirstWrite 11}
		RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2 {Type O LastRead -1 FirstWrite 11}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6568", "Max" : "6568"}
	, {"Name" : "Interval", "Min" : "6568", "Max" : "6568"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_weights_AWVALID VALID 1 1 }  { m_axi_weights_AWREADY READY 0 1 }  { m_axi_weights_AWADDR ADDR 1 32 }  { m_axi_weights_AWID ID 1 1 }  { m_axi_weights_AWLEN SIZE 1 32 }  { m_axi_weights_AWSIZE BURST 1 3 }  { m_axi_weights_AWBURST LOCK 1 2 }  { m_axi_weights_AWLOCK CACHE 1 2 }  { m_axi_weights_AWCACHE PROT 1 4 }  { m_axi_weights_AWPROT QOS 1 3 }  { m_axi_weights_AWQOS REGION 1 4 }  { m_axi_weights_AWREGION USER 1 4 }  { m_axi_weights_AWUSER DATA 1 1 }  { m_axi_weights_WVALID VALID 1 1 }  { m_axi_weights_WREADY READY 0 1 }  { m_axi_weights_WDATA FIFONUM 1 256 }  { m_axi_weights_WSTRB STRB 1 32 }  { m_axi_weights_WLAST LAST 1 1 }  { m_axi_weights_WID ID 1 1 }  { m_axi_weights_WUSER DATA 1 1 }  { m_axi_weights_ARVALID VALID 1 1 }  { m_axi_weights_ARREADY READY 0 1 }  { m_axi_weights_ARADDR ADDR 1 32 }  { m_axi_weights_ARID ID 1 1 }  { m_axi_weights_ARLEN SIZE 1 32 }  { m_axi_weights_ARSIZE BURST 1 3 }  { m_axi_weights_ARBURST LOCK 1 2 }  { m_axi_weights_ARLOCK CACHE 1 2 }  { m_axi_weights_ARCACHE PROT 1 4 }  { m_axi_weights_ARPROT QOS 1 3 }  { m_axi_weights_ARQOS REGION 1 4 }  { m_axi_weights_ARREGION USER 1 4 }  { m_axi_weights_ARUSER DATA 1 1 }  { m_axi_weights_RVALID VALID 0 1 }  { m_axi_weights_RREADY READY 1 1 }  { m_axi_weights_RDATA FIFONUM 0 256 }  { m_axi_weights_RLAST LAST 0 1 }  { m_axi_weights_RID ID 0 1 }  { m_axi_weights_RFIFONUM LEN 0 5 }  { m_axi_weights_RUSER DATA 0 1 }  { m_axi_weights_RRESP RESP 0 2 }  { m_axi_weights_BVALID VALID 0 1 }  { m_axi_weights_BREADY READY 1 1 }  { m_axi_weights_BRESP RESP 0 2 }  { m_axi_weights_BID ID 0 1 }  { m_axi_weights_BUSER DATA 0 1 } } }
	weights_q610 { ap_none {  { weights_q610 in_data 0 32 } } }
	weight_offset_read { ap_none {  { weight_offset_read in_data 0 32 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1_address1 MemPortADDR2 1 10 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_1_d1 MemPortDIN2 1 512 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_address1 MemPortADDR2 1 10 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_d1 MemPortDIN2 1 512 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3_address1 MemPortADDR2 1 10 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_3_d1 MemPortDIN2 1 512 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2_address1 MemPortADDR2 1 10 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_we_2_d1 MemPortDIN2 1 512 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_address0 mem_address 1 8 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_we0 mem_we 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_d0 mem_din 1 16 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_address1 MemPortADDR2 1 8 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_1_d1 MemPortDIN2 1 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_address0 mem_address 1 8 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_we0 mem_we 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_d0 mem_din 1 16 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_address1 MemPortADDR2 1 8 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bi_d1 MemPortDIN2 1 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_address0 mem_address 1 7 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_we0 mem_we 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_d0 mem_din 1 16 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_address1 MemPortADDR2 1 7 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_1_d1 MemPortDIN2 1 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_address0 mem_address 1 7 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_we0 mem_we 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_d0 mem_din 1 16 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_address1 MemPortADDR2 1 7 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_d1 MemPortDIN2 1 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_address0 mem_address 1 7 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_we0 mem_we 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_d0 mem_din 1 16 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_address1 MemPortADDR2 1 7 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_3_d1 MemPortDIN2 1 16 } } }
	RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2 { ap_memory {  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_address0 mem_address 1 7 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_ce0 mem_ce 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_we0 mem_we 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_d0 mem_din 1 16 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_address1 MemPortADDR2 1 7 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_ce1 MemPortCE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_we1 MemPortWE2 1 1 }  { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_bn_2_d1 MemPortDIN2 1 16 } } }
}

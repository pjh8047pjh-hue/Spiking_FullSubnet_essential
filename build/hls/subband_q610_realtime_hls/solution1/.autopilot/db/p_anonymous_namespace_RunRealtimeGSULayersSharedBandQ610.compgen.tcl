# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandRealtimeTopQ610Ip_p_anonymous_namespace_RunRealtimeGSULayersSharedBandQ610_RunSubbandRealtimeTodEe BINDTYPE {storage} TYPE {ram_2p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandRealtimeTopQ610Ip_p_anonymous_namespace_RunRealtimeGSULayersSharedBandQ610_RunSubbandRealtimeTohbi BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandRealtimeTopQ610Ip_p_anonymous_namespace_RunRealtimeGSULayersSharedBandQ610_RunSubbandRealtimeTojbC BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandRealtimeTopQ610Ip_p_anonymous_namespace_RunRealtimeGSULayersSharedBandQ610_RunSubbandRealtimeToncg BINDTYPE {storage} TYPE {ram_2p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4671 \
    name noisy_chunk \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename noisy_chunk \
    op interface \
    ports { noisy_chunk_address0 { O 10 vector } noisy_chunk_ce0 { O 1 bit } noisy_chunk_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'noisy_chunk'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4672 \
    name fb_chunk \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename fb_chunk \
    op interface \
    ports { fb_chunk_address0 { O 10 vector } fb_chunk_ce0 { O 1 bit } fb_chunk_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'fb_chunk'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4673 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_address0 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_q0 { I 16 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_address1 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_ce1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_we1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4674 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_address0 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_q0 { I 16 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_address1 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_ce1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_we1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4675 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_address0 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_q0 { I 16 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_address1 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_ce1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_we1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4676 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_address0 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_q0 { I 16 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_address1 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_ce1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_we1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4677 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_address0 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_q0 { I 16 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_address1 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_ce1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_we1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4678 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_address0 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_q0 { I 16 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_address1 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_ce1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_we1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4679 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_address0 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_q0 { I 16 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_address1 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_ce1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_we1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4680 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_address0 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_q0 { I 16 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_address1 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_ce1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_we1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4681 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_address1 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_ce1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_we1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4682 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_address1 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_ce1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_we1 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4661 \
    name p_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read \
    op interface \
    ports { p_read { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4662 \
    name p_read1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read1 \
    op interface \
    ports { p_read1 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4663 \
    name p_read2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read2 \
    op interface \
    ports { p_read2 { I 7 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4664 \
    name p_read14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read14 \
    op interface \
    ports { p_read14 { I 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4665 \
    name p_read5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read5 \
    op interface \
    ports { p_read5 { I 7 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4666 \
    name p_read6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read6 \
    op interface \
    ports { p_read6 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4667 \
    name weights \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights \
    op interface \
    ports { m_axi_weights_AWVALID { O 1 bit } m_axi_weights_AWREADY { I 1 bit } m_axi_weights_AWADDR { O 32 vector } m_axi_weights_AWID { O 1 vector } m_axi_weights_AWLEN { O 32 vector } m_axi_weights_AWSIZE { O 3 vector } m_axi_weights_AWBURST { O 2 vector } m_axi_weights_AWLOCK { O 2 vector } m_axi_weights_AWCACHE { O 4 vector } m_axi_weights_AWPROT { O 3 vector } m_axi_weights_AWQOS { O 4 vector } m_axi_weights_AWREGION { O 4 vector } m_axi_weights_AWUSER { O 1 vector } m_axi_weights_WVALID { O 1 bit } m_axi_weights_WREADY { I 1 bit } m_axi_weights_WDATA { O 256 vector } m_axi_weights_WSTRB { O 32 vector } m_axi_weights_WLAST { O 1 bit } m_axi_weights_WID { O 1 vector } m_axi_weights_WUSER { O 1 vector } m_axi_weights_ARVALID { O 1 bit } m_axi_weights_ARREADY { I 1 bit } m_axi_weights_ARADDR { O 32 vector } m_axi_weights_ARID { O 1 vector } m_axi_weights_ARLEN { O 32 vector } m_axi_weights_ARSIZE { O 3 vector } m_axi_weights_ARBURST { O 2 vector } m_axi_weights_ARLOCK { O 2 vector } m_axi_weights_ARCACHE { O 4 vector } m_axi_weights_ARPROT { O 3 vector } m_axi_weights_ARQOS { O 4 vector } m_axi_weights_ARREGION { O 4 vector } m_axi_weights_ARUSER { O 1 vector } m_axi_weights_RVALID { I 1 bit } m_axi_weights_RREADY { O 1 bit } m_axi_weights_RDATA { I 256 vector } m_axi_weights_RLAST { I 1 bit } m_axi_weights_RID { I 1 vector } m_axi_weights_RFIFONUM { I 5 vector } m_axi_weights_RUSER { I 1 vector } m_axi_weights_RRESP { I 2 vector } m_axi_weights_BVALID { I 1 bit } m_axi_weights_BREADY { O 1 bit } m_axi_weights_BRESP { I 2 vector } m_axi_weights_BID { I 1 vector } m_axi_weights_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4668 \
    name weights_q610 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weights_q610 \
    op interface \
    ports { weights_q610 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4669 \
    name p_read4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read4 \
    op interface \
    ports { p_read4 { I 19 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4670 \
    name num_frames \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_num_frames \
    op interface \
    ports { num_frames { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 32 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -4 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}



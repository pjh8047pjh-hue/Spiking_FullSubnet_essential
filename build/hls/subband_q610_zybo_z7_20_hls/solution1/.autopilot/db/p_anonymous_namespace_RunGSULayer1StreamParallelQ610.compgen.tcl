# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_p_anonymous_namespace_RunGSULayer1StreamParallelQ610_output_buffer_RAM_AUTO_1ncg BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
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
    id 5115 \
    name SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_2 \
    op interface \
    ports { SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_2_address0 { O 10 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_2_ce0 { O 1 bit } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_2_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5116 \
    name SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_4 \
    op interface \
    ports { SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_4_address0 { O 10 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_4_ce0 { O 1 bit } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_4_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5117 \
    name SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_1 \
    op interface \
    ports { SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_1_address0 { O 10 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_1_ce0 { O 1 bit } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_1_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5118 \
    name SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_3 \
    op interface \
    ports { SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_3_address0 { O 10 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_3_ce0 { O 1 bit } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_3_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5119 \
    name SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_10 \
    op interface \
    ports { SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_10_address0 { O 8 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_10_ce0 { O 1 bit } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_10_q0 { I 16 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_10_address1 { O 8 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_10_ce1 { O 1 bit } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_10_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5120 \
    name SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_9 \
    op interface \
    ports { SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_9_address0 { O 8 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_9_ce0 { O 1 bit } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_9_q0 { I 16 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_9_address1 { O 8 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_9_ce1 { O 1 bit } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_9_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5121 \
    name SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_6 \
    op interface \
    ports { SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_6_address0 { O 7 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_6_ce0 { O 1 bit } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_6_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5122 \
    name SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_5 \
    op interface \
    ports { SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_5_address0 { O 7 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_5_ce0 { O 1 bit } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_5_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5123 \
    name SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_8 \
    op interface \
    ports { SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_8_address0 { O 7 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_8_ce0 { O 1 bit } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_8_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5124 \
    name SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_7 \
    op interface \
    ports { SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_7_address0 { O 7 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_7_ce0 { O 1 bit } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_7_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_7'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5113 \
    name layer0_output_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_layer0_output_stream \
    op interface \
    ports { layer0_output_stream_dout { I 16 vector } layer0_output_stream_num_data_valid { I 10 vector } layer0_output_stream_fifo_cap { I 10 vector } layer0_output_stream_empty_n { I 1 bit } layer0_output_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5114 \
    name layer1_output_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_layer1_output_stream \
    op interface \
    ports { layer1_output_stream_din { O 16 vector } layer1_output_stream_num_data_valid { I 10 vector } layer1_output_stream_fifo_cap { I 10 vector } layer1_output_stream_full_n { I 1 bit } layer1_output_stream_write { O 1 bit } } \
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
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
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
    id -3 \
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



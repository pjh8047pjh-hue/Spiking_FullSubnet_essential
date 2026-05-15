# This script segment is generated automatically by AutoPilot

set name SubbandRealtimeTopQ610Ip_mul_12s_4ns_12_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandRealtimeTopQ610Ip_sparsemux_17_3_16_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {auto}
}


set id 5489
set name SubbandRealtimeTopQ610Ip_ama_addmuladd_12ns_3ns_7ns_12ns_12_4_1
set corename simcore_ama
set op ama
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 12
set in0_signed 0
set in1_width 3
set in1_signed 0
set in2_width 7
set in2_signed 0
set in3_width 12
set in3_signed 0
set ce_width 1
set ce_signed 0
set out_width 12
set arg_lists {i0 {12 0 +} i1 {3 0 +} s {12 0 +} i2 {7 0 +} m {12 1 +} i3 {12 0 +} p {12 0 +} c_expval {c} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3 ALLOW_PRAGMA 1
}


set op ama
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    in3_width ${in3_width} \
    in3_signed ${in3_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
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
    id 5499 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_address0 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5500 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_address0 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5501 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8_address0 { O 5 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5502 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7_address0 { O 5 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5503 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6_address0 { O 5 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5504 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5_address0 { O 5 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5505 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4_address0 { O 5 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5506 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3_address0 { O 5 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5507 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2_address0 { O 5 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5508 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1_address0 { O 5 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5509 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_address0 { O 11 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5510 \
    name output_chunk \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename output_chunk \
    op interface \
    ports { output_chunk_address1 { O 13 vector } output_chunk_ce1 { O 1 bit } output_chunk_we1 { O 1 bit } output_chunk_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'output_chunk'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5493 \
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
    id 5494 \
    name p_read1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read1 \
    op interface \
    ports { p_read1 { I 7 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5495 \
    name p_read2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read2 \
    op interface \
    ports { p_read2 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5496 \
    name p_read3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read3 \
    op interface \
    ports { p_read3 { I 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5497 \
    name p_read4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read4 \
    op interface \
    ports { p_read4 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5498 \
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



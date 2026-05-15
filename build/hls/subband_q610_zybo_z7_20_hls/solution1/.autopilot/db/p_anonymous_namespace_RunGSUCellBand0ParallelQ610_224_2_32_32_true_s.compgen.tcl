# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_p_anonymous_namespace_RunGSUCellBand0ParallelQ610_224_2_32_32_true_s_p_anonymjbC BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_p_anonymous_namespace_RunGSUCellBand0ParallelQ610_224_2_32_32_true_s_p_anonymlbW BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_fifo_w96_d2_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {common_sum_stream_U}
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
    id 5097 \
    name output_hy_q610_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename output_hy_q610_0 \
    op interface \
    ports { output_hy_q610_0_address0 { O 7 vector } output_hy_q610_0_ce0 { O 1 bit } output_hy_q610_0_we0 { O 1 bit } output_hy_q610_0_d0 { O 11 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'output_hy_q610_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5098 \
    name output_hy_q610_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename output_hy_q610_1 \
    op interface \
    ports { output_hy_q610_1_address0 { O 7 vector } output_hy_q610_1_ce0 { O 1 bit } output_hy_q610_1_we0 { O 1 bit } output_hy_q610_1_d0 { O 11 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'output_hy_q610_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5099 \
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
    id 5100 \
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
    id 5101 \
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
    id 5102 \
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
    id 5103 \
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
    id 5104 \
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
    id 5105 \
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
    id 5106 \
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
    id 5107 \
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
    id 5108 \
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
    id 4872 \
    name input_ptr_0_val1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_0_val1 \
    op interface \
    ports { input_ptr_0_val1 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4873 \
    name input_ptr_1_val2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_1_val2 \
    op interface \
    ports { input_ptr_1_val2 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4874 \
    name input_ptr_2_val3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_2_val3 \
    op interface \
    ports { input_ptr_2_val3 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4875 \
    name input_ptr_3_val4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_3_val4 \
    op interface \
    ports { input_ptr_3_val4 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4876 \
    name input_ptr_4_val5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_4_val5 \
    op interface \
    ports { input_ptr_4_val5 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4877 \
    name input_ptr_5_val6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_5_val6 \
    op interface \
    ports { input_ptr_5_val6 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4878 \
    name input_ptr_6_val7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_6_val7 \
    op interface \
    ports { input_ptr_6_val7 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4879 \
    name input_ptr_7_val8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_7_val8 \
    op interface \
    ports { input_ptr_7_val8 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4880 \
    name input_ptr_8_val9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_8_val9 \
    op interface \
    ports { input_ptr_8_val9 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4881 \
    name input_ptr_9_val10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_9_val10 \
    op interface \
    ports { input_ptr_9_val10 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4882 \
    name input_ptr_10_val11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_10_val11 \
    op interface \
    ports { input_ptr_10_val11 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4883 \
    name input_ptr_11_val12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_11_val12 \
    op interface \
    ports { input_ptr_11_val12 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4884 \
    name input_ptr_12_val13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_12_val13 \
    op interface \
    ports { input_ptr_12_val13 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4885 \
    name input_ptr_13_val14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_13_val14 \
    op interface \
    ports { input_ptr_13_val14 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4886 \
    name input_ptr_14_val15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_14_val15 \
    op interface \
    ports { input_ptr_14_val15 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4887 \
    name input_ptr_15_val16 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_15_val16 \
    op interface \
    ports { input_ptr_15_val16 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4888 \
    name input_ptr_16_val17 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_16_val17 \
    op interface \
    ports { input_ptr_16_val17 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4889 \
    name input_ptr_17_val18 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_17_val18 \
    op interface \
    ports { input_ptr_17_val18 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4890 \
    name input_ptr_18_val19 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_18_val19 \
    op interface \
    ports { input_ptr_18_val19 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4891 \
    name input_ptr_19_val20 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_19_val20 \
    op interface \
    ports { input_ptr_19_val20 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4892 \
    name input_ptr_20_val21 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_20_val21 \
    op interface \
    ports { input_ptr_20_val21 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4893 \
    name input_ptr_21_val22 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_21_val22 \
    op interface \
    ports { input_ptr_21_val22 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4894 \
    name input_ptr_22_val23 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_22_val23 \
    op interface \
    ports { input_ptr_22_val23 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4895 \
    name input_ptr_23_val24 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_23_val24 \
    op interface \
    ports { input_ptr_23_val24 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4896 \
    name input_ptr_24_val25 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_24_val25 \
    op interface \
    ports { input_ptr_24_val25 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4897 \
    name input_ptr_25_val26 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_25_val26 \
    op interface \
    ports { input_ptr_25_val26 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4898 \
    name input_ptr_26_val27 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_26_val27 \
    op interface \
    ports { input_ptr_26_val27 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4899 \
    name input_ptr_27_val28 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_27_val28 \
    op interface \
    ports { input_ptr_27_val28 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4900 \
    name input_ptr_28_val29 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_28_val29 \
    op interface \
    ports { input_ptr_28_val29 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4901 \
    name input_ptr_29_val30 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_29_val30 \
    op interface \
    ports { input_ptr_29_val30 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4902 \
    name input_ptr_30_val31 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_30_val31 \
    op interface \
    ports { input_ptr_30_val31 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4903 \
    name input_ptr_31_val32 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_31_val32 \
    op interface \
    ports { input_ptr_31_val32 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4904 \
    name input_ptr_32_val33 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_32_val33 \
    op interface \
    ports { input_ptr_32_val33 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4905 \
    name input_ptr_33_val34 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_33_val34 \
    op interface \
    ports { input_ptr_33_val34 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4906 \
    name input_ptr_34_val35 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_34_val35 \
    op interface \
    ports { input_ptr_34_val35 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4907 \
    name input_ptr_35_val36 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_35_val36 \
    op interface \
    ports { input_ptr_35_val36 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4908 \
    name input_ptr_36_val37 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_36_val37 \
    op interface \
    ports { input_ptr_36_val37 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4909 \
    name input_ptr_37_val38 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_37_val38 \
    op interface \
    ports { input_ptr_37_val38 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4910 \
    name input_ptr_38_val39 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_38_val39 \
    op interface \
    ports { input_ptr_38_val39 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4911 \
    name input_ptr_39_val40 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_39_val40 \
    op interface \
    ports { input_ptr_39_val40 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4912 \
    name input_ptr_40_val41 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_40_val41 \
    op interface \
    ports { input_ptr_40_val41 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4913 \
    name input_ptr_41_val42 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_41_val42 \
    op interface \
    ports { input_ptr_41_val42 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4914 \
    name input_ptr_42_val43 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_42_val43 \
    op interface \
    ports { input_ptr_42_val43 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4915 \
    name input_ptr_43_val44 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_43_val44 \
    op interface \
    ports { input_ptr_43_val44 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4916 \
    name input_ptr_44_val45 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_44_val45 \
    op interface \
    ports { input_ptr_44_val45 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4917 \
    name input_ptr_45_val46 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_45_val46 \
    op interface \
    ports { input_ptr_45_val46 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4918 \
    name input_ptr_46_val47 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_46_val47 \
    op interface \
    ports { input_ptr_46_val47 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4919 \
    name input_ptr_47_val48 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_47_val48 \
    op interface \
    ports { input_ptr_47_val48 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4920 \
    name input_ptr_48_val49 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_48_val49 \
    op interface \
    ports { input_ptr_48_val49 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4921 \
    name input_ptr_49_val50 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_49_val50 \
    op interface \
    ports { input_ptr_49_val50 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4922 \
    name input_ptr_50_val51 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_50_val51 \
    op interface \
    ports { input_ptr_50_val51 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4923 \
    name input_ptr_51_val52 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_51_val52 \
    op interface \
    ports { input_ptr_51_val52 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4924 \
    name input_ptr_52_val53 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_52_val53 \
    op interface \
    ports { input_ptr_52_val53 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4925 \
    name input_ptr_53_val54 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_53_val54 \
    op interface \
    ports { input_ptr_53_val54 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4926 \
    name input_ptr_54_val55 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_54_val55 \
    op interface \
    ports { input_ptr_54_val55 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4927 \
    name input_ptr_55_val56 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_55_val56 \
    op interface \
    ports { input_ptr_55_val56 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4928 \
    name input_ptr_56_val57 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_56_val57 \
    op interface \
    ports { input_ptr_56_val57 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4929 \
    name input_ptr_57_val58 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_57_val58 \
    op interface \
    ports { input_ptr_57_val58 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4930 \
    name input_ptr_58_val59 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_58_val59 \
    op interface \
    ports { input_ptr_58_val59 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4931 \
    name input_ptr_59_val60 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_59_val60 \
    op interface \
    ports { input_ptr_59_val60 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4932 \
    name input_ptr_60_val61 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_60_val61 \
    op interface \
    ports { input_ptr_60_val61 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4933 \
    name input_ptr_61_val62 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_61_val62 \
    op interface \
    ports { input_ptr_61_val62 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4934 \
    name input_ptr_62_val63 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_62_val63 \
    op interface \
    ports { input_ptr_62_val63 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4935 \
    name input_ptr_63_val64 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_63_val64 \
    op interface \
    ports { input_ptr_63_val64 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4936 \
    name input_ptr_64_val65 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_64_val65 \
    op interface \
    ports { input_ptr_64_val65 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4937 \
    name input_ptr_65_val66 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_65_val66 \
    op interface \
    ports { input_ptr_65_val66 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4938 \
    name input_ptr_66_val67 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_66_val67 \
    op interface \
    ports { input_ptr_66_val67 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4939 \
    name input_ptr_67_val68 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_67_val68 \
    op interface \
    ports { input_ptr_67_val68 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4940 \
    name input_ptr_68_val69 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_68_val69 \
    op interface \
    ports { input_ptr_68_val69 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4941 \
    name input_ptr_69_val70 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_69_val70 \
    op interface \
    ports { input_ptr_69_val70 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4942 \
    name input_ptr_70_val71 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_70_val71 \
    op interface \
    ports { input_ptr_70_val71 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4943 \
    name input_ptr_71_val72 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_71_val72 \
    op interface \
    ports { input_ptr_71_val72 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4944 \
    name input_ptr_72_val73 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_72_val73 \
    op interface \
    ports { input_ptr_72_val73 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4945 \
    name input_ptr_73_val74 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_73_val74 \
    op interface \
    ports { input_ptr_73_val74 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4946 \
    name input_ptr_74_val75 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_74_val75 \
    op interface \
    ports { input_ptr_74_val75 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4947 \
    name input_ptr_75_val76 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_75_val76 \
    op interface \
    ports { input_ptr_75_val76 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4948 \
    name input_ptr_76_val77 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_76_val77 \
    op interface \
    ports { input_ptr_76_val77 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4949 \
    name input_ptr_77_val78 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_77_val78 \
    op interface \
    ports { input_ptr_77_val78 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4950 \
    name input_ptr_78_val79 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_78_val79 \
    op interface \
    ports { input_ptr_78_val79 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4951 \
    name input_ptr_79_val80 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_79_val80 \
    op interface \
    ports { input_ptr_79_val80 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4952 \
    name input_ptr_80_val81 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_80_val81 \
    op interface \
    ports { input_ptr_80_val81 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4953 \
    name input_ptr_81_val82 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_81_val82 \
    op interface \
    ports { input_ptr_81_val82 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4954 \
    name input_ptr_82_val83 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_82_val83 \
    op interface \
    ports { input_ptr_82_val83 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4955 \
    name input_ptr_83_val84 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_83_val84 \
    op interface \
    ports { input_ptr_83_val84 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4956 \
    name input_ptr_84_val85 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_84_val85 \
    op interface \
    ports { input_ptr_84_val85 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4957 \
    name input_ptr_85_val86 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_85_val86 \
    op interface \
    ports { input_ptr_85_val86 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4958 \
    name input_ptr_86_val87 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_86_val87 \
    op interface \
    ports { input_ptr_86_val87 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4959 \
    name input_ptr_87_val88 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_87_val88 \
    op interface \
    ports { input_ptr_87_val88 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4960 \
    name input_ptr_88_val89 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_88_val89 \
    op interface \
    ports { input_ptr_88_val89 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4961 \
    name input_ptr_89_val90 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_89_val90 \
    op interface \
    ports { input_ptr_89_val90 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4962 \
    name input_ptr_90_val91 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_90_val91 \
    op interface \
    ports { input_ptr_90_val91 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4963 \
    name input_ptr_91_val92 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_91_val92 \
    op interface \
    ports { input_ptr_91_val92 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4964 \
    name input_ptr_92_val93 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_92_val93 \
    op interface \
    ports { input_ptr_92_val93 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4965 \
    name input_ptr_93_val94 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_93_val94 \
    op interface \
    ports { input_ptr_93_val94 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4966 \
    name input_ptr_94_val95 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_94_val95 \
    op interface \
    ports { input_ptr_94_val95 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4967 \
    name input_ptr_95_val96 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_95_val96 \
    op interface \
    ports { input_ptr_95_val96 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4968 \
    name input_ptr_96_val97 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_96_val97 \
    op interface \
    ports { input_ptr_96_val97 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4969 \
    name input_ptr_97_val98 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_97_val98 \
    op interface \
    ports { input_ptr_97_val98 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4970 \
    name input_ptr_98_val99 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_98_val99 \
    op interface \
    ports { input_ptr_98_val99 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4971 \
    name input_ptr_99_val100 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_99_val100 \
    op interface \
    ports { input_ptr_99_val100 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4972 \
    name input_ptr_100_val101 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_100_val101 \
    op interface \
    ports { input_ptr_100_val101 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4973 \
    name input_ptr_101_val102 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_101_val102 \
    op interface \
    ports { input_ptr_101_val102 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4974 \
    name input_ptr_102_val103 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_102_val103 \
    op interface \
    ports { input_ptr_102_val103 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4975 \
    name input_ptr_103_val104 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_103_val104 \
    op interface \
    ports { input_ptr_103_val104 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4976 \
    name input_ptr_104_val105 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_104_val105 \
    op interface \
    ports { input_ptr_104_val105 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4977 \
    name input_ptr_105_val106 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_105_val106 \
    op interface \
    ports { input_ptr_105_val106 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4978 \
    name input_ptr_106_val107 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_106_val107 \
    op interface \
    ports { input_ptr_106_val107 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4979 \
    name input_ptr_107_val108 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_107_val108 \
    op interface \
    ports { input_ptr_107_val108 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4980 \
    name input_ptr_108_val109 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_108_val109 \
    op interface \
    ports { input_ptr_108_val109 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4981 \
    name input_ptr_109_val110 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_109_val110 \
    op interface \
    ports { input_ptr_109_val110 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4982 \
    name input_ptr_110_val111 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_110_val111 \
    op interface \
    ports { input_ptr_110_val111 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4983 \
    name input_ptr_111_val112 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_111_val112 \
    op interface \
    ports { input_ptr_111_val112 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4984 \
    name input_ptr_112_val113 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_112_val113 \
    op interface \
    ports { input_ptr_112_val113 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4985 \
    name input_ptr_113_val114 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_113_val114 \
    op interface \
    ports { input_ptr_113_val114 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4986 \
    name input_ptr_114_val115 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_114_val115 \
    op interface \
    ports { input_ptr_114_val115 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4987 \
    name input_ptr_115_val116 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_115_val116 \
    op interface \
    ports { input_ptr_115_val116 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4988 \
    name input_ptr_116_val117 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_116_val117 \
    op interface \
    ports { input_ptr_116_val117 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4989 \
    name input_ptr_117_val118 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_117_val118 \
    op interface \
    ports { input_ptr_117_val118 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4990 \
    name input_ptr_118_val119 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_118_val119 \
    op interface \
    ports { input_ptr_118_val119 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4991 \
    name input_ptr_119_val120 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_119_val120 \
    op interface \
    ports { input_ptr_119_val120 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4992 \
    name input_ptr_120_val121 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_120_val121 \
    op interface \
    ports { input_ptr_120_val121 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4993 \
    name input_ptr_121_val122 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_121_val122 \
    op interface \
    ports { input_ptr_121_val122 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4994 \
    name input_ptr_122_val123 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_122_val123 \
    op interface \
    ports { input_ptr_122_val123 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4995 \
    name input_ptr_123_val124 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_123_val124 \
    op interface \
    ports { input_ptr_123_val124 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4996 \
    name input_ptr_124_val125 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_124_val125 \
    op interface \
    ports { input_ptr_124_val125 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4997 \
    name input_ptr_125_val126 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_125_val126 \
    op interface \
    ports { input_ptr_125_val126 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4998 \
    name input_ptr_126_val127 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_126_val127 \
    op interface \
    ports { input_ptr_126_val127 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4999 \
    name input_ptr_127_val128 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_127_val128 \
    op interface \
    ports { input_ptr_127_val128 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5000 \
    name input_ptr_128_val129 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_128_val129 \
    op interface \
    ports { input_ptr_128_val129 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5001 \
    name input_ptr_129_val130 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_129_val130 \
    op interface \
    ports { input_ptr_129_val130 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5002 \
    name input_ptr_130_val131 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_130_val131 \
    op interface \
    ports { input_ptr_130_val131 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5003 \
    name input_ptr_131_val132 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_131_val132 \
    op interface \
    ports { input_ptr_131_val132 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5004 \
    name input_ptr_132_val133 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_132_val133 \
    op interface \
    ports { input_ptr_132_val133 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5005 \
    name input_ptr_133_val134 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_133_val134 \
    op interface \
    ports { input_ptr_133_val134 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5006 \
    name input_ptr_134_val135 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_134_val135 \
    op interface \
    ports { input_ptr_134_val135 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5007 \
    name input_ptr_135_val136 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_135_val136 \
    op interface \
    ports { input_ptr_135_val136 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5008 \
    name input_ptr_136_val137 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_136_val137 \
    op interface \
    ports { input_ptr_136_val137 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5009 \
    name input_ptr_137_val138 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_137_val138 \
    op interface \
    ports { input_ptr_137_val138 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5010 \
    name input_ptr_138_val139 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_138_val139 \
    op interface \
    ports { input_ptr_138_val139 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5011 \
    name input_ptr_139_val140 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_139_val140 \
    op interface \
    ports { input_ptr_139_val140 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5012 \
    name input_ptr_140_val141 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_140_val141 \
    op interface \
    ports { input_ptr_140_val141 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5013 \
    name input_ptr_141_val142 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_141_val142 \
    op interface \
    ports { input_ptr_141_val142 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5014 \
    name input_ptr_142_val143 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_142_val143 \
    op interface \
    ports { input_ptr_142_val143 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5015 \
    name input_ptr_143_val144 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_143_val144 \
    op interface \
    ports { input_ptr_143_val144 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5016 \
    name input_ptr_144_val145 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_144_val145 \
    op interface \
    ports { input_ptr_144_val145 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5017 \
    name input_ptr_145_val146 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_145_val146 \
    op interface \
    ports { input_ptr_145_val146 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5018 \
    name input_ptr_146_val147 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_146_val147 \
    op interface \
    ports { input_ptr_146_val147 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5019 \
    name input_ptr_147_val148 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_147_val148 \
    op interface \
    ports { input_ptr_147_val148 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5020 \
    name input_ptr_148_val149 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_148_val149 \
    op interface \
    ports { input_ptr_148_val149 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5021 \
    name input_ptr_149_val150 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_149_val150 \
    op interface \
    ports { input_ptr_149_val150 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5022 \
    name input_ptr_150_val151 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_150_val151 \
    op interface \
    ports { input_ptr_150_val151 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5023 \
    name input_ptr_151_val152 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_151_val152 \
    op interface \
    ports { input_ptr_151_val152 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5024 \
    name input_ptr_152_val153 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_152_val153 \
    op interface \
    ports { input_ptr_152_val153 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5025 \
    name input_ptr_153_val154 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_153_val154 \
    op interface \
    ports { input_ptr_153_val154 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5026 \
    name input_ptr_154_val155 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_154_val155 \
    op interface \
    ports { input_ptr_154_val155 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5027 \
    name input_ptr_155_val156 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_155_val156 \
    op interface \
    ports { input_ptr_155_val156 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5028 \
    name input_ptr_156_val157 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_156_val157 \
    op interface \
    ports { input_ptr_156_val157 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5029 \
    name input_ptr_157_val158 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_157_val158 \
    op interface \
    ports { input_ptr_157_val158 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5030 \
    name input_ptr_158_val159 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_158_val159 \
    op interface \
    ports { input_ptr_158_val159 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5031 \
    name input_ptr_159_val160 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_159_val160 \
    op interface \
    ports { input_ptr_159_val160 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5032 \
    name input_ptr_160_val161 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_160_val161 \
    op interface \
    ports { input_ptr_160_val161 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5033 \
    name input_ptr_161_val162 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_161_val162 \
    op interface \
    ports { input_ptr_161_val162 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5034 \
    name input_ptr_162_val163 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_162_val163 \
    op interface \
    ports { input_ptr_162_val163 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5035 \
    name input_ptr_163_val164 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_163_val164 \
    op interface \
    ports { input_ptr_163_val164 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5036 \
    name input_ptr_164_val165 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_164_val165 \
    op interface \
    ports { input_ptr_164_val165 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5037 \
    name input_ptr_165_val166 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_165_val166 \
    op interface \
    ports { input_ptr_165_val166 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5038 \
    name input_ptr_166_val167 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_166_val167 \
    op interface \
    ports { input_ptr_166_val167 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5039 \
    name input_ptr_167_val168 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_167_val168 \
    op interface \
    ports { input_ptr_167_val168 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5040 \
    name input_ptr_168_val169 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_168_val169 \
    op interface \
    ports { input_ptr_168_val169 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5041 \
    name input_ptr_169_val170 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_169_val170 \
    op interface \
    ports { input_ptr_169_val170 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5042 \
    name input_ptr_170_val171 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_170_val171 \
    op interface \
    ports { input_ptr_170_val171 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5043 \
    name input_ptr_171_val172 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_171_val172 \
    op interface \
    ports { input_ptr_171_val172 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5044 \
    name input_ptr_172_val173 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_172_val173 \
    op interface \
    ports { input_ptr_172_val173 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5045 \
    name input_ptr_173_val174 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_173_val174 \
    op interface \
    ports { input_ptr_173_val174 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5046 \
    name input_ptr_174_val175 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_174_val175 \
    op interface \
    ports { input_ptr_174_val175 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5047 \
    name input_ptr_175_val176 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_175_val176 \
    op interface \
    ports { input_ptr_175_val176 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5048 \
    name input_ptr_176_val177 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_176_val177 \
    op interface \
    ports { input_ptr_176_val177 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5049 \
    name input_ptr_177_val178 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_177_val178 \
    op interface \
    ports { input_ptr_177_val178 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5050 \
    name input_ptr_178_val179 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_178_val179 \
    op interface \
    ports { input_ptr_178_val179 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5051 \
    name input_ptr_179_val180 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_179_val180 \
    op interface \
    ports { input_ptr_179_val180 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5052 \
    name input_ptr_180_val181 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_180_val181 \
    op interface \
    ports { input_ptr_180_val181 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5053 \
    name input_ptr_181_val182 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_181_val182 \
    op interface \
    ports { input_ptr_181_val182 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5054 \
    name input_ptr_182_val183 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_182_val183 \
    op interface \
    ports { input_ptr_182_val183 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5055 \
    name input_ptr_183_val184 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_183_val184 \
    op interface \
    ports { input_ptr_183_val184 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5056 \
    name input_ptr_184_val185 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_184_val185 \
    op interface \
    ports { input_ptr_184_val185 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5057 \
    name input_ptr_185_val186 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_185_val186 \
    op interface \
    ports { input_ptr_185_val186 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5058 \
    name input_ptr_186_val187 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_186_val187 \
    op interface \
    ports { input_ptr_186_val187 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5059 \
    name input_ptr_187_val188 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_187_val188 \
    op interface \
    ports { input_ptr_187_val188 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5060 \
    name input_ptr_188_val189 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_188_val189 \
    op interface \
    ports { input_ptr_188_val189 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5061 \
    name input_ptr_189_val190 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_189_val190 \
    op interface \
    ports { input_ptr_189_val190 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5062 \
    name input_ptr_190_val191 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_190_val191 \
    op interface \
    ports { input_ptr_190_val191 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5063 \
    name input_ptr_191_val192 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_191_val192 \
    op interface \
    ports { input_ptr_191_val192 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5064 \
    name input_ptr_192_val193 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_192_val193 \
    op interface \
    ports { input_ptr_192_val193 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5065 \
    name input_ptr_193_val194 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_193_val194 \
    op interface \
    ports { input_ptr_193_val194 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5066 \
    name input_ptr_194_val195 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_194_val195 \
    op interface \
    ports { input_ptr_194_val195 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5067 \
    name input_ptr_195_val196 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_195_val196 \
    op interface \
    ports { input_ptr_195_val196 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5068 \
    name input_ptr_196_val197 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_196_val197 \
    op interface \
    ports { input_ptr_196_val197 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5069 \
    name input_ptr_197_val198 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_197_val198 \
    op interface \
    ports { input_ptr_197_val198 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5070 \
    name input_ptr_198_val199 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_198_val199 \
    op interface \
    ports { input_ptr_198_val199 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5071 \
    name input_ptr_199_val200 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_199_val200 \
    op interface \
    ports { input_ptr_199_val200 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5072 \
    name input_ptr_200_val201 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_200_val201 \
    op interface \
    ports { input_ptr_200_val201 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5073 \
    name input_ptr_201_val202 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_201_val202 \
    op interface \
    ports { input_ptr_201_val202 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5074 \
    name input_ptr_202_val203 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_202_val203 \
    op interface \
    ports { input_ptr_202_val203 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5075 \
    name input_ptr_203_val204 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_203_val204 \
    op interface \
    ports { input_ptr_203_val204 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5076 \
    name input_ptr_204_val205 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_204_val205 \
    op interface \
    ports { input_ptr_204_val205 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5077 \
    name input_ptr_205_val206 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_205_val206 \
    op interface \
    ports { input_ptr_205_val206 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5078 \
    name input_ptr_206_val207 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_206_val207 \
    op interface \
    ports { input_ptr_206_val207 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5079 \
    name input_ptr_207_val208 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_207_val208 \
    op interface \
    ports { input_ptr_207_val208 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5080 \
    name input_ptr_208_val209 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_208_val209 \
    op interface \
    ports { input_ptr_208_val209 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5081 \
    name input_ptr_209_val210 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_209_val210 \
    op interface \
    ports { input_ptr_209_val210 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5082 \
    name input_ptr_210_val211 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_210_val211 \
    op interface \
    ports { input_ptr_210_val211 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5083 \
    name input_ptr_211_val212 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_211_val212 \
    op interface \
    ports { input_ptr_211_val212 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5084 \
    name input_ptr_212_val213 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_212_val213 \
    op interface \
    ports { input_ptr_212_val213 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5085 \
    name input_ptr_213_val214 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_213_val214 \
    op interface \
    ports { input_ptr_213_val214 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5086 \
    name input_ptr_214_val215 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_214_val215 \
    op interface \
    ports { input_ptr_214_val215 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5087 \
    name input_ptr_215_val216 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_215_val216 \
    op interface \
    ports { input_ptr_215_val216 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5088 \
    name input_ptr_216_val217 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_216_val217 \
    op interface \
    ports { input_ptr_216_val217 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5089 \
    name input_ptr_217_val218 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_217_val218 \
    op interface \
    ports { input_ptr_217_val218 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5090 \
    name input_ptr_218_val219 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_218_val219 \
    op interface \
    ports { input_ptr_218_val219 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5091 \
    name input_ptr_219_val220 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_219_val220 \
    op interface \
    ports { input_ptr_219_val220 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5092 \
    name input_ptr_220_val221 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_220_val221 \
    op interface \
    ports { input_ptr_220_val221 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5093 \
    name input_ptr_221_val222 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_221_val222 \
    op interface \
    ports { input_ptr_221_val222 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5094 \
    name input_ptr_222_val223 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_222_val223 \
    op interface \
    ports { input_ptr_222_val223 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5095 \
    name input_ptr_223_val224 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_223_val224 \
    op interface \
    ports { input_ptr_223_val224 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5096 \
    name hx_state_q610_0_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hx_state_q610_0_offset \
    op interface \
    ports { hx_state_q610_0_offset { I 3 vector } } \
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



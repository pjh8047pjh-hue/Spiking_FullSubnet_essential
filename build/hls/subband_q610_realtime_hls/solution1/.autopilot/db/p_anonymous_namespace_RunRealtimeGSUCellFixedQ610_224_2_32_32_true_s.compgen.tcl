# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandRealtimeTopQ610Ip_fifo_w96_d2_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {common_sum_stream_U}
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
    id 3912 \
    name weight_ih_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weight_ih_0 \
    op interface \
    ports { weight_ih_0_address0 { O 10 vector } weight_ih_0_ce0 { O 1 bit } weight_ih_0_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weight_ih_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3913 \
    name weight_ih_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weight_ih_1 \
    op interface \
    ports { weight_ih_1_address0 { O 10 vector } weight_ih_1_ce0 { O 1 bit } weight_ih_1_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weight_ih_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3914 \
    name weight_hh_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weight_hh_0 \
    op interface \
    ports { weight_hh_0_address0 { O 10 vector } weight_hh_0_ce0 { O 1 bit } weight_hh_0_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weight_hh_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3915 \
    name weight_hh_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weight_hh_1 \
    op interface \
    ports { weight_hh_1_address0 { O 10 vector } weight_hh_1_ce0 { O 1 bit } weight_hh_1_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weight_hh_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3916 \
    name bias_ih_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_ih_0 \
    op interface \
    ports { bias_ih_0_address0 { O 8 vector } bias_ih_0_ce0 { O 1 bit } bias_ih_0_q0 { I 16 vector } bias_ih_0_address1 { O 8 vector } bias_ih_0_ce1 { O 1 bit } bias_ih_0_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_ih_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3917 \
    name bias_ih_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_ih_1 \
    op interface \
    ports { bias_ih_1_address0 { O 8 vector } bias_ih_1_ce0 { O 1 bit } bias_ih_1_q0 { I 16 vector } bias_ih_1_address1 { O 8 vector } bias_ih_1_ce1 { O 1 bit } bias_ih_1_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_ih_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3918 \
    name bn_mul_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bn_mul_0 \
    op interface \
    ports { bn_mul_0_address0 { O 7 vector } bn_mul_0_ce0 { O 1 bit } bn_mul_0_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bn_mul_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3919 \
    name bn_mul_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bn_mul_1 \
    op interface \
    ports { bn_mul_1_address0 { O 7 vector } bn_mul_1_ce0 { O 1 bit } bn_mul_1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bn_mul_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3920 \
    name bn_add_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bn_add_0 \
    op interface \
    ports { bn_add_0_address0 { O 7 vector } bn_add_0_ce0 { O 1 bit } bn_add_0_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bn_add_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3921 \
    name bn_add_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bn_add_1 \
    op interface \
    ports { bn_add_1_address0 { O 7 vector } bn_add_1_ce0 { O 1 bit } bn_add_1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bn_add_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3922 \
    name hx_state_q610_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename hx_state_q610_0 \
    op interface \
    ports { hx_state_q610_0_address0 { O 12 vector } hx_state_q610_0_ce0 { O 1 bit } hx_state_q610_0_q0 { I 16 vector } hx_state_q610_0_address1 { O 12 vector } hx_state_q610_0_ce1 { O 1 bit } hx_state_q610_0_we1 { O 1 bit } hx_state_q610_0_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hx_state_q610_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3925 \
    name hx_state_q610_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename hx_state_q610_1 \
    op interface \
    ports { hx_state_q610_1_address0 { O 12 vector } hx_state_q610_1_ce0 { O 1 bit } hx_state_q610_1_q0 { I 16 vector } hx_state_q610_1_address1 { O 12 vector } hx_state_q610_1_ce1 { O 1 bit } hx_state_q610_1_we1 { O 1 bit } hx_state_q610_1_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hx_state_q610_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3928 \
    name cx_state_q610_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename cx_state_q610_0 \
    op interface \
    ports { cx_state_q610_0_address0 { O 12 vector } cx_state_q610_0_ce0 { O 1 bit } cx_state_q610_0_q0 { I 16 vector } cx_state_q610_0_address1 { O 12 vector } cx_state_q610_0_ce1 { O 1 bit } cx_state_q610_0_we1 { O 1 bit } cx_state_q610_0_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'cx_state_q610_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3931 \
    name cx_state_q610_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename cx_state_q610_1 \
    op interface \
    ports { cx_state_q610_1_address0 { O 12 vector } cx_state_q610_1_ce0 { O 1 bit } cx_state_q610_1_q0 { I 16 vector } cx_state_q610_1_address1 { O 12 vector } cx_state_q610_1_ce1 { O 1 bit } cx_state_q610_1_we1 { O 1 bit } cx_state_q610_1_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'cx_state_q610_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3934 \
    name output_hy_q610_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename output_hy_q610_0 \
    op interface \
    ports { output_hy_q610_0_address1 { O 12 vector } output_hy_q610_0_ce1 { O 1 bit } output_hy_q610_0_we1 { O 1 bit } output_hy_q610_0_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'output_hy_q610_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3937 \
    name output_hy_q610_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename output_hy_q610_1 \
    op interface \
    ports { output_hy_q610_1_address1 { O 12 vector } output_hy_q610_1_ce1 { O 1 bit } output_hy_q610_1_we1 { O 1 bit } output_hy_q610_1_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'output_hy_q610_1'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3688 \
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
    id 3689 \
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
    id 3690 \
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
    id 3691 \
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
    id 3692 \
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
    id 3693 \
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
    id 3694 \
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
    id 3695 \
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
    id 3696 \
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
    id 3697 \
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
    id 3698 \
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
    id 3699 \
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
    id 3700 \
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
    id 3701 \
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
    id 3702 \
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
    id 3703 \
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
    id 3704 \
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
    id 3705 \
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
    id 3706 \
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
    id 3707 \
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
    id 3708 \
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
    id 3709 \
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
    id 3710 \
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
    id 3711 \
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
    id 3712 \
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
    id 3713 \
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
    id 3714 \
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
    id 3715 \
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
    id 3716 \
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
    id 3717 \
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
    id 3718 \
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
    id 3719 \
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
    id 3720 \
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
    id 3721 \
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
    id 3722 \
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
    id 3723 \
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
    id 3724 \
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
    id 3725 \
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
    id 3726 \
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
    id 3727 \
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
    id 3728 \
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
    id 3729 \
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
    id 3730 \
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
    id 3731 \
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
    id 3732 \
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
    id 3733 \
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
    id 3734 \
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
    id 3735 \
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
    id 3736 \
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
    id 3737 \
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
    id 3738 \
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
    id 3739 \
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
    id 3740 \
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
    id 3741 \
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
    id 3742 \
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
    id 3743 \
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
    id 3744 \
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
    id 3745 \
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
    id 3746 \
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
    id 3747 \
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
    id 3748 \
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
    id 3749 \
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
    id 3750 \
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
    id 3751 \
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
    id 3752 \
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
    id 3753 \
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
    id 3754 \
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
    id 3755 \
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
    id 3756 \
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
    id 3757 \
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
    id 3758 \
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
    id 3759 \
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
    id 3760 \
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
    id 3761 \
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
    id 3762 \
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
    id 3763 \
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
    id 3764 \
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
    id 3765 \
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
    id 3766 \
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
    id 3767 \
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
    id 3768 \
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
    id 3769 \
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
    id 3770 \
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
    id 3771 \
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
    id 3772 \
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
    id 3773 \
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
    id 3774 \
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
    id 3775 \
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
    id 3776 \
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
    id 3777 \
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
    id 3778 \
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
    id 3779 \
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
    id 3780 \
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
    id 3781 \
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
    id 3782 \
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
    id 3783 \
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
    id 3784 \
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
    id 3785 \
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
    id 3786 \
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
    id 3787 \
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
    id 3788 \
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
    id 3789 \
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
    id 3790 \
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
    id 3791 \
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
    id 3792 \
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
    id 3793 \
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
    id 3794 \
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
    id 3795 \
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
    id 3796 \
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
    id 3797 \
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
    id 3798 \
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
    id 3799 \
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
    id 3800 \
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
    id 3801 \
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
    id 3802 \
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
    id 3803 \
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
    id 3804 \
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
    id 3805 \
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
    id 3806 \
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
    id 3807 \
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
    id 3808 \
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
    id 3809 \
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
    id 3810 \
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
    id 3811 \
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
    id 3812 \
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
    id 3813 \
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
    id 3814 \
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
    id 3815 \
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
    id 3816 \
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
    id 3817 \
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
    id 3818 \
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
    id 3819 \
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
    id 3820 \
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
    id 3821 \
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
    id 3822 \
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
    id 3823 \
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
    id 3824 \
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
    id 3825 \
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
    id 3826 \
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
    id 3827 \
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
    id 3828 \
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
    id 3829 \
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
    id 3830 \
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
    id 3831 \
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
    id 3832 \
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
    id 3833 \
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
    id 3834 \
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
    id 3835 \
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
    id 3836 \
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
    id 3837 \
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
    id 3838 \
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
    id 3839 \
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
    id 3840 \
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
    id 3841 \
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
    id 3842 \
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
    id 3843 \
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
    id 3844 \
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
    id 3845 \
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
    id 3846 \
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
    id 3847 \
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
    id 3848 \
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
    id 3849 \
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
    id 3850 \
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
    id 3851 \
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
    id 3852 \
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
    id 3853 \
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
    id 3854 \
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
    id 3855 \
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
    id 3856 \
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
    id 3857 \
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
    id 3858 \
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
    id 3859 \
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
    id 3860 \
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
    id 3861 \
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
    id 3862 \
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
    id 3863 \
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
    id 3864 \
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
    id 3865 \
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
    id 3866 \
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
    id 3867 \
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
    id 3868 \
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
    id 3869 \
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
    id 3870 \
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
    id 3871 \
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
    id 3872 \
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
    id 3873 \
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
    id 3874 \
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
    id 3875 \
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
    id 3876 \
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
    id 3877 \
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
    id 3878 \
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
    id 3879 \
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
    id 3880 \
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
    id 3881 \
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
    id 3882 \
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
    id 3883 \
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
    id 3884 \
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
    id 3885 \
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
    id 3886 \
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
    id 3887 \
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
    id 3888 \
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
    id 3889 \
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
    id 3890 \
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
    id 3891 \
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
    id 3892 \
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
    id 3893 \
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
    id 3894 \
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
    id 3895 \
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
    id 3896 \
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
    id 3897 \
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
    id 3898 \
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
    id 3899 \
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
    id 3900 \
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
    id 3901 \
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
    id 3902 \
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
    id 3903 \
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
    id 3904 \
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
    id 3905 \
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
    id 3906 \
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
    id 3907 \
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
    id 3908 \
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
    id 3909 \
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
    id 3910 \
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
    id 3911 \
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
    id 3923 \
    name hx_state_q610_0_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hx_state_q610_0_offset \
    op interface \
    ports { hx_state_q610_0_offset { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3924 \
    name hx_state_q610_0_offset1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hx_state_q610_0_offset1 \
    op interface \
    ports { hx_state_q610_0_offset1 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3926 \
    name hx_state_q610_1_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hx_state_q610_1_offset \
    op interface \
    ports { hx_state_q610_1_offset { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3927 \
    name hx_state_q610_1_offset2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hx_state_q610_1_offset2 \
    op interface \
    ports { hx_state_q610_1_offset2 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3929 \
    name cx_state_q610_0_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cx_state_q610_0_offset \
    op interface \
    ports { cx_state_q610_0_offset { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3930 \
    name cx_state_q610_0_offset3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cx_state_q610_0_offset3 \
    op interface \
    ports { cx_state_q610_0_offset3 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3932 \
    name cx_state_q610_1_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cx_state_q610_1_offset \
    op interface \
    ports { cx_state_q610_1_offset { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3933 \
    name cx_state_q610_1_offset4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cx_state_q610_1_offset4 \
    op interface \
    ports { cx_state_q610_1_offset4 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3935 \
    name output_hy_q610_0_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_output_hy_q610_0_offset \
    op interface \
    ports { output_hy_q610_0_offset { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3936 \
    name output_hy_q610_0_offset5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_output_hy_q610_0_offset5 \
    op interface \
    ports { output_hy_q610_0_offset5 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3938 \
    name output_hy_q610_1_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_output_hy_q610_1_offset \
    op interface \
    ports { output_hy_q610_1_offset { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3939 \
    name output_hy_q610_1_offset6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_output_hy_q610_1_offset6 \
    op interface \
    ports { output_hy_q610_1_offset6 { I 3 vector } } \
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



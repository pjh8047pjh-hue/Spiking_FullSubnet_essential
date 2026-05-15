# This script segment is generated automatically by AutoPilot

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
    id 977 \
    name hx_state_q610_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename hx_state_q610_0 \
    op interface \
    ports { hx_state_q610_0_address0 { O 12 vector } hx_state_q610_0_ce0 { O 1 bit } hx_state_q610_0_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hx_state_q610_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 980 \
    name hx_state_q610_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename hx_state_q610_1 \
    op interface \
    ports { hx_state_q610_1_address0 { O 12 vector } hx_state_q610_1_ce0 { O 1 bit } hx_state_q610_1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hx_state_q610_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 983 \
    name cx_state_q610_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename cx_state_q610_0 \
    op interface \
    ports { cx_state_q610_0_address0 { O 12 vector } cx_state_q610_0_ce0 { O 1 bit } cx_state_q610_0_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'cx_state_q610_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 986 \
    name cx_state_q610_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename cx_state_q610_1 \
    op interface \
    ports { cx_state_q610_1_address0 { O 12 vector } cx_state_q610_1_ce0 { O 1 bit } cx_state_q610_1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'cx_state_q610_1'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 978 \
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
    id 979 \
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
    id 981 \
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
    id 982 \
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
    id 984 \
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
    id 985 \
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
    id 987 \
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
    id 988 \
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
    id 989 \
    name prev_hx_q610_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_0 \
    op interface \
    ports { prev_hx_q610_0 { O 16 vector } prev_hx_q610_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 990 \
    name prev_hx_q610_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_1 \
    op interface \
    ports { prev_hx_q610_1 { O 16 vector } prev_hx_q610_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 991 \
    name prev_hx_q610_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_2 \
    op interface \
    ports { prev_hx_q610_2 { O 16 vector } prev_hx_q610_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 992 \
    name prev_hx_q610_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_3 \
    op interface \
    ports { prev_hx_q610_3 { O 16 vector } prev_hx_q610_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 993 \
    name prev_hx_q610_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_4 \
    op interface \
    ports { prev_hx_q610_4 { O 16 vector } prev_hx_q610_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 994 \
    name prev_hx_q610_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_5 \
    op interface \
    ports { prev_hx_q610_5 { O 16 vector } prev_hx_q610_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 995 \
    name prev_hx_q610_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_6 \
    op interface \
    ports { prev_hx_q610_6 { O 16 vector } prev_hx_q610_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 996 \
    name prev_hx_q610_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_7 \
    op interface \
    ports { prev_hx_q610_7 { O 16 vector } prev_hx_q610_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 997 \
    name prev_hx_q610_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_8 \
    op interface \
    ports { prev_hx_q610_8 { O 16 vector } prev_hx_q610_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 998 \
    name prev_hx_q610_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_9 \
    op interface \
    ports { prev_hx_q610_9 { O 16 vector } prev_hx_q610_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 999 \
    name prev_hx_q610_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_10 \
    op interface \
    ports { prev_hx_q610_10 { O 16 vector } prev_hx_q610_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1000 \
    name prev_hx_q610_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_11 \
    op interface \
    ports { prev_hx_q610_11 { O 16 vector } prev_hx_q610_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1001 \
    name prev_hx_q610_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_12 \
    op interface \
    ports { prev_hx_q610_12 { O 16 vector } prev_hx_q610_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1002 \
    name prev_hx_q610_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_13 \
    op interface \
    ports { prev_hx_q610_13 { O 16 vector } prev_hx_q610_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1003 \
    name prev_hx_q610_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_14 \
    op interface \
    ports { prev_hx_q610_14 { O 16 vector } prev_hx_q610_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1004 \
    name prev_hx_q610_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_15 \
    op interface \
    ports { prev_hx_q610_15 { O 16 vector } prev_hx_q610_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1005 \
    name prev_hx_q610_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_16 \
    op interface \
    ports { prev_hx_q610_16 { O 16 vector } prev_hx_q610_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1006 \
    name prev_hx_q610_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_17 \
    op interface \
    ports { prev_hx_q610_17 { O 16 vector } prev_hx_q610_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1007 \
    name prev_hx_q610_18 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_18 \
    op interface \
    ports { prev_hx_q610_18 { O 16 vector } prev_hx_q610_18_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1008 \
    name prev_hx_q610_19 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_19 \
    op interface \
    ports { prev_hx_q610_19 { O 16 vector } prev_hx_q610_19_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1009 \
    name prev_hx_q610_20 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_20 \
    op interface \
    ports { prev_hx_q610_20 { O 16 vector } prev_hx_q610_20_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1010 \
    name prev_hx_q610_21 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_21 \
    op interface \
    ports { prev_hx_q610_21 { O 16 vector } prev_hx_q610_21_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1011 \
    name prev_hx_q610_22 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_22 \
    op interface \
    ports { prev_hx_q610_22 { O 16 vector } prev_hx_q610_22_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1012 \
    name prev_hx_q610_23 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_23 \
    op interface \
    ports { prev_hx_q610_23 { O 16 vector } prev_hx_q610_23_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1013 \
    name prev_hx_q610_24 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_24 \
    op interface \
    ports { prev_hx_q610_24 { O 16 vector } prev_hx_q610_24_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1014 \
    name prev_hx_q610_25 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_25 \
    op interface \
    ports { prev_hx_q610_25 { O 16 vector } prev_hx_q610_25_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1015 \
    name prev_hx_q610_26 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_26 \
    op interface \
    ports { prev_hx_q610_26 { O 16 vector } prev_hx_q610_26_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1016 \
    name prev_hx_q610_27 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_27 \
    op interface \
    ports { prev_hx_q610_27 { O 16 vector } prev_hx_q610_27_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1017 \
    name prev_hx_q610_28 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_28 \
    op interface \
    ports { prev_hx_q610_28 { O 16 vector } prev_hx_q610_28_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1018 \
    name prev_hx_q610_29 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_29 \
    op interface \
    ports { prev_hx_q610_29 { O 16 vector } prev_hx_q610_29_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1019 \
    name prev_hx_q610_30 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_30 \
    op interface \
    ports { prev_hx_q610_30 { O 16 vector } prev_hx_q610_30_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1020 \
    name prev_hx_q610_31 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_31 \
    op interface \
    ports { prev_hx_q610_31 { O 16 vector } prev_hx_q610_31_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1021 \
    name prev_hx_q610_32 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_32 \
    op interface \
    ports { prev_hx_q610_32 { O 16 vector } prev_hx_q610_32_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1022 \
    name prev_hx_q610_33 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_33 \
    op interface \
    ports { prev_hx_q610_33 { O 16 vector } prev_hx_q610_33_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1023 \
    name prev_hx_q610_34 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_34 \
    op interface \
    ports { prev_hx_q610_34 { O 16 vector } prev_hx_q610_34_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1024 \
    name prev_hx_q610_35 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_35 \
    op interface \
    ports { prev_hx_q610_35 { O 16 vector } prev_hx_q610_35_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1025 \
    name prev_hx_q610_36 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_36 \
    op interface \
    ports { prev_hx_q610_36 { O 16 vector } prev_hx_q610_36_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1026 \
    name prev_hx_q610_37 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_37 \
    op interface \
    ports { prev_hx_q610_37 { O 16 vector } prev_hx_q610_37_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1027 \
    name prev_hx_q610_38 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_38 \
    op interface \
    ports { prev_hx_q610_38 { O 16 vector } prev_hx_q610_38_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1028 \
    name prev_hx_q610_39 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_39 \
    op interface \
    ports { prev_hx_q610_39 { O 16 vector } prev_hx_q610_39_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1029 \
    name prev_hx_q610_40 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_40 \
    op interface \
    ports { prev_hx_q610_40 { O 16 vector } prev_hx_q610_40_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1030 \
    name prev_hx_q610_41 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_41 \
    op interface \
    ports { prev_hx_q610_41 { O 16 vector } prev_hx_q610_41_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1031 \
    name prev_hx_q610_42 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_42 \
    op interface \
    ports { prev_hx_q610_42 { O 16 vector } prev_hx_q610_42_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1032 \
    name prev_hx_q610_43 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_43 \
    op interface \
    ports { prev_hx_q610_43 { O 16 vector } prev_hx_q610_43_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1033 \
    name prev_hx_q610_44 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_44 \
    op interface \
    ports { prev_hx_q610_44 { O 16 vector } prev_hx_q610_44_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1034 \
    name prev_hx_q610_45 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_45 \
    op interface \
    ports { prev_hx_q610_45 { O 16 vector } prev_hx_q610_45_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1035 \
    name prev_hx_q610_46 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_46 \
    op interface \
    ports { prev_hx_q610_46 { O 16 vector } prev_hx_q610_46_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1036 \
    name prev_hx_q610_47 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_47 \
    op interface \
    ports { prev_hx_q610_47 { O 16 vector } prev_hx_q610_47_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1037 \
    name prev_hx_q610_48 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_48 \
    op interface \
    ports { prev_hx_q610_48 { O 16 vector } prev_hx_q610_48_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1038 \
    name prev_hx_q610_49 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_49 \
    op interface \
    ports { prev_hx_q610_49 { O 16 vector } prev_hx_q610_49_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1039 \
    name prev_hx_q610_50 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_50 \
    op interface \
    ports { prev_hx_q610_50 { O 16 vector } prev_hx_q610_50_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1040 \
    name prev_hx_q610_51 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_51 \
    op interface \
    ports { prev_hx_q610_51 { O 16 vector } prev_hx_q610_51_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1041 \
    name prev_hx_q610_52 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_52 \
    op interface \
    ports { prev_hx_q610_52 { O 16 vector } prev_hx_q610_52_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1042 \
    name prev_hx_q610_53 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_53 \
    op interface \
    ports { prev_hx_q610_53 { O 16 vector } prev_hx_q610_53_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1043 \
    name prev_hx_q610_54 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_54 \
    op interface \
    ports { prev_hx_q610_54 { O 16 vector } prev_hx_q610_54_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1044 \
    name prev_hx_q610_55 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_55 \
    op interface \
    ports { prev_hx_q610_55 { O 16 vector } prev_hx_q610_55_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1045 \
    name prev_hx_q610_56 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_56 \
    op interface \
    ports { prev_hx_q610_56 { O 16 vector } prev_hx_q610_56_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1046 \
    name prev_hx_q610_57 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_57 \
    op interface \
    ports { prev_hx_q610_57 { O 16 vector } prev_hx_q610_57_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1047 \
    name prev_hx_q610_58 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_58 \
    op interface \
    ports { prev_hx_q610_58 { O 16 vector } prev_hx_q610_58_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1048 \
    name prev_hx_q610_59 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_59 \
    op interface \
    ports { prev_hx_q610_59 { O 16 vector } prev_hx_q610_59_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1049 \
    name prev_hx_q610_60 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_60 \
    op interface \
    ports { prev_hx_q610_60 { O 16 vector } prev_hx_q610_60_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1050 \
    name prev_hx_q610_61 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_61 \
    op interface \
    ports { prev_hx_q610_61 { O 16 vector } prev_hx_q610_61_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1051 \
    name prev_hx_q610_62 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_62 \
    op interface \
    ports { prev_hx_q610_62 { O 16 vector } prev_hx_q610_62_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1052 \
    name prev_hx_q610_63 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_63 \
    op interface \
    ports { prev_hx_q610_63 { O 16 vector } prev_hx_q610_63_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1053 \
    name prev_hx_q610_64 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_64 \
    op interface \
    ports { prev_hx_q610_64 { O 16 vector } prev_hx_q610_64_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1054 \
    name prev_hx_q610_65 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_65 \
    op interface \
    ports { prev_hx_q610_65 { O 16 vector } prev_hx_q610_65_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1055 \
    name prev_hx_q610_66 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_66 \
    op interface \
    ports { prev_hx_q610_66 { O 16 vector } prev_hx_q610_66_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1056 \
    name prev_hx_q610_67 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_67 \
    op interface \
    ports { prev_hx_q610_67 { O 16 vector } prev_hx_q610_67_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1057 \
    name prev_hx_q610_68 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_68 \
    op interface \
    ports { prev_hx_q610_68 { O 16 vector } prev_hx_q610_68_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1058 \
    name prev_hx_q610_69 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_69 \
    op interface \
    ports { prev_hx_q610_69 { O 16 vector } prev_hx_q610_69_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1059 \
    name prev_hx_q610_70 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_70 \
    op interface \
    ports { prev_hx_q610_70 { O 16 vector } prev_hx_q610_70_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1060 \
    name prev_hx_q610_71 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_71 \
    op interface \
    ports { prev_hx_q610_71 { O 16 vector } prev_hx_q610_71_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1061 \
    name prev_hx_q610_72 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_72 \
    op interface \
    ports { prev_hx_q610_72 { O 16 vector } prev_hx_q610_72_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1062 \
    name prev_hx_q610_73 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_73 \
    op interface \
    ports { prev_hx_q610_73 { O 16 vector } prev_hx_q610_73_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1063 \
    name prev_hx_q610_74 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_74 \
    op interface \
    ports { prev_hx_q610_74 { O 16 vector } prev_hx_q610_74_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1064 \
    name prev_hx_q610_75 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_75 \
    op interface \
    ports { prev_hx_q610_75 { O 16 vector } prev_hx_q610_75_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1065 \
    name prev_hx_q610_76 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_76 \
    op interface \
    ports { prev_hx_q610_76 { O 16 vector } prev_hx_q610_76_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1066 \
    name prev_hx_q610_77 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_77 \
    op interface \
    ports { prev_hx_q610_77 { O 16 vector } prev_hx_q610_77_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1067 \
    name prev_hx_q610_78 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_78 \
    op interface \
    ports { prev_hx_q610_78 { O 16 vector } prev_hx_q610_78_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1068 \
    name prev_hx_q610_79 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_79 \
    op interface \
    ports { prev_hx_q610_79 { O 16 vector } prev_hx_q610_79_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1069 \
    name prev_hx_q610_80 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_80 \
    op interface \
    ports { prev_hx_q610_80 { O 16 vector } prev_hx_q610_80_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1070 \
    name prev_hx_q610_81 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_81 \
    op interface \
    ports { prev_hx_q610_81 { O 16 vector } prev_hx_q610_81_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1071 \
    name prev_hx_q610_82 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_82 \
    op interface \
    ports { prev_hx_q610_82 { O 16 vector } prev_hx_q610_82_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1072 \
    name prev_hx_q610_83 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_83 \
    op interface \
    ports { prev_hx_q610_83 { O 16 vector } prev_hx_q610_83_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1073 \
    name prev_hx_q610_84 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_84 \
    op interface \
    ports { prev_hx_q610_84 { O 16 vector } prev_hx_q610_84_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1074 \
    name prev_hx_q610_85 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_85 \
    op interface \
    ports { prev_hx_q610_85 { O 16 vector } prev_hx_q610_85_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1075 \
    name prev_hx_q610_86 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_86 \
    op interface \
    ports { prev_hx_q610_86 { O 16 vector } prev_hx_q610_86_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1076 \
    name prev_hx_q610_87 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_87 \
    op interface \
    ports { prev_hx_q610_87 { O 16 vector } prev_hx_q610_87_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1077 \
    name prev_hx_q610_88 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_88 \
    op interface \
    ports { prev_hx_q610_88 { O 16 vector } prev_hx_q610_88_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1078 \
    name prev_hx_q610_89 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_89 \
    op interface \
    ports { prev_hx_q610_89 { O 16 vector } prev_hx_q610_89_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1079 \
    name prev_hx_q610_90 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_90 \
    op interface \
    ports { prev_hx_q610_90 { O 16 vector } prev_hx_q610_90_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1080 \
    name prev_hx_q610_91 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_91 \
    op interface \
    ports { prev_hx_q610_91 { O 16 vector } prev_hx_q610_91_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1081 \
    name prev_hx_q610_92 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_92 \
    op interface \
    ports { prev_hx_q610_92 { O 16 vector } prev_hx_q610_92_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1082 \
    name prev_hx_q610_93 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_93 \
    op interface \
    ports { prev_hx_q610_93 { O 16 vector } prev_hx_q610_93_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1083 \
    name prev_hx_q610_94 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_94 \
    op interface \
    ports { prev_hx_q610_94 { O 16 vector } prev_hx_q610_94_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1084 \
    name prev_hx_q610_95 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_95 \
    op interface \
    ports { prev_hx_q610_95 { O 16 vector } prev_hx_q610_95_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1085 \
    name prev_hx_q610_96 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_96 \
    op interface \
    ports { prev_hx_q610_96 { O 16 vector } prev_hx_q610_96_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1086 \
    name prev_hx_q610_97 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_97 \
    op interface \
    ports { prev_hx_q610_97 { O 16 vector } prev_hx_q610_97_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1087 \
    name prev_hx_q610_98 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_98 \
    op interface \
    ports { prev_hx_q610_98 { O 16 vector } prev_hx_q610_98_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1088 \
    name prev_hx_q610_99 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_99 \
    op interface \
    ports { prev_hx_q610_99 { O 16 vector } prev_hx_q610_99_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1089 \
    name prev_hx_q610_100 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_100 \
    op interface \
    ports { prev_hx_q610_100 { O 16 vector } prev_hx_q610_100_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1090 \
    name prev_hx_q610_101 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_101 \
    op interface \
    ports { prev_hx_q610_101 { O 16 vector } prev_hx_q610_101_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1091 \
    name prev_hx_q610_102 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_102 \
    op interface \
    ports { prev_hx_q610_102 { O 16 vector } prev_hx_q610_102_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1092 \
    name prev_hx_q610_103 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_103 \
    op interface \
    ports { prev_hx_q610_103 { O 16 vector } prev_hx_q610_103_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1093 \
    name prev_hx_q610_104 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_104 \
    op interface \
    ports { prev_hx_q610_104 { O 16 vector } prev_hx_q610_104_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1094 \
    name prev_hx_q610_105 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_105 \
    op interface \
    ports { prev_hx_q610_105 { O 16 vector } prev_hx_q610_105_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1095 \
    name prev_hx_q610_106 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_106 \
    op interface \
    ports { prev_hx_q610_106 { O 16 vector } prev_hx_q610_106_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1096 \
    name prev_hx_q610_107 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_107 \
    op interface \
    ports { prev_hx_q610_107 { O 16 vector } prev_hx_q610_107_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1097 \
    name prev_hx_q610_108 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_108 \
    op interface \
    ports { prev_hx_q610_108 { O 16 vector } prev_hx_q610_108_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1098 \
    name prev_hx_q610_109 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_109 \
    op interface \
    ports { prev_hx_q610_109 { O 16 vector } prev_hx_q610_109_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1099 \
    name prev_hx_q610_110 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_110 \
    op interface \
    ports { prev_hx_q610_110 { O 16 vector } prev_hx_q610_110_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1100 \
    name prev_hx_q610_111 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_111 \
    op interface \
    ports { prev_hx_q610_111 { O 16 vector } prev_hx_q610_111_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1101 \
    name prev_hx_q610_112 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_112 \
    op interface \
    ports { prev_hx_q610_112 { O 16 vector } prev_hx_q610_112_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1102 \
    name prev_hx_q610_113 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_113 \
    op interface \
    ports { prev_hx_q610_113 { O 16 vector } prev_hx_q610_113_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1103 \
    name prev_hx_q610_114 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_114 \
    op interface \
    ports { prev_hx_q610_114 { O 16 vector } prev_hx_q610_114_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1104 \
    name prev_hx_q610_115 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_115 \
    op interface \
    ports { prev_hx_q610_115 { O 16 vector } prev_hx_q610_115_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1105 \
    name prev_hx_q610_116 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_116 \
    op interface \
    ports { prev_hx_q610_116 { O 16 vector } prev_hx_q610_116_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1106 \
    name prev_hx_q610_117 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_117 \
    op interface \
    ports { prev_hx_q610_117 { O 16 vector } prev_hx_q610_117_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1107 \
    name prev_hx_q610_118 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_118 \
    op interface \
    ports { prev_hx_q610_118 { O 16 vector } prev_hx_q610_118_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1108 \
    name prev_hx_q610_119 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_119 \
    op interface \
    ports { prev_hx_q610_119 { O 16 vector } prev_hx_q610_119_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1109 \
    name prev_hx_q610_120 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_120 \
    op interface \
    ports { prev_hx_q610_120 { O 16 vector } prev_hx_q610_120_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1110 \
    name prev_hx_q610_121 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_121 \
    op interface \
    ports { prev_hx_q610_121 { O 16 vector } prev_hx_q610_121_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1111 \
    name prev_hx_q610_122 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_122 \
    op interface \
    ports { prev_hx_q610_122 { O 16 vector } prev_hx_q610_122_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1112 \
    name prev_hx_q610_123 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_123 \
    op interface \
    ports { prev_hx_q610_123 { O 16 vector } prev_hx_q610_123_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1113 \
    name prev_hx_q610_124 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_124 \
    op interface \
    ports { prev_hx_q610_124 { O 16 vector } prev_hx_q610_124_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1114 \
    name prev_hx_q610_125 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_125 \
    op interface \
    ports { prev_hx_q610_125 { O 16 vector } prev_hx_q610_125_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1115 \
    name prev_hx_q610_126 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_126 \
    op interface \
    ports { prev_hx_q610_126 { O 16 vector } prev_hx_q610_126_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1116 \
    name prev_hx_q610_127 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_127 \
    op interface \
    ports { prev_hx_q610_127 { O 16 vector } prev_hx_q610_127_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1117 \
    name prev_hx_q610_128 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_128 \
    op interface \
    ports { prev_hx_q610_128 { O 16 vector } prev_hx_q610_128_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1118 \
    name prev_hx_q610_129 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_129 \
    op interface \
    ports { prev_hx_q610_129 { O 16 vector } prev_hx_q610_129_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1119 \
    name prev_hx_q610_130 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_130 \
    op interface \
    ports { prev_hx_q610_130 { O 16 vector } prev_hx_q610_130_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1120 \
    name prev_hx_q610_131 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_131 \
    op interface \
    ports { prev_hx_q610_131 { O 16 vector } prev_hx_q610_131_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1121 \
    name prev_hx_q610_132 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_132 \
    op interface \
    ports { prev_hx_q610_132 { O 16 vector } prev_hx_q610_132_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1122 \
    name prev_hx_q610_133 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_133 \
    op interface \
    ports { prev_hx_q610_133 { O 16 vector } prev_hx_q610_133_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1123 \
    name prev_hx_q610_134 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_134 \
    op interface \
    ports { prev_hx_q610_134 { O 16 vector } prev_hx_q610_134_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1124 \
    name prev_hx_q610_135 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_135 \
    op interface \
    ports { prev_hx_q610_135 { O 16 vector } prev_hx_q610_135_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1125 \
    name prev_hx_q610_136 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_136 \
    op interface \
    ports { prev_hx_q610_136 { O 16 vector } prev_hx_q610_136_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1126 \
    name prev_hx_q610_137 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_137 \
    op interface \
    ports { prev_hx_q610_137 { O 16 vector } prev_hx_q610_137_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1127 \
    name prev_hx_q610_138 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_138 \
    op interface \
    ports { prev_hx_q610_138 { O 16 vector } prev_hx_q610_138_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1128 \
    name prev_hx_q610_139 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_139 \
    op interface \
    ports { prev_hx_q610_139 { O 16 vector } prev_hx_q610_139_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1129 \
    name prev_hx_q610_140 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_140 \
    op interface \
    ports { prev_hx_q610_140 { O 16 vector } prev_hx_q610_140_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1130 \
    name prev_hx_q610_141 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_141 \
    op interface \
    ports { prev_hx_q610_141 { O 16 vector } prev_hx_q610_141_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1131 \
    name prev_hx_q610_142 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_142 \
    op interface \
    ports { prev_hx_q610_142 { O 16 vector } prev_hx_q610_142_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1132 \
    name prev_hx_q610_143 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_143 \
    op interface \
    ports { prev_hx_q610_143 { O 16 vector } prev_hx_q610_143_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1133 \
    name prev_hx_q610_144 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_144 \
    op interface \
    ports { prev_hx_q610_144 { O 16 vector } prev_hx_q610_144_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1134 \
    name prev_hx_q610_145 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_145 \
    op interface \
    ports { prev_hx_q610_145 { O 16 vector } prev_hx_q610_145_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1135 \
    name prev_hx_q610_146 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_146 \
    op interface \
    ports { prev_hx_q610_146 { O 16 vector } prev_hx_q610_146_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1136 \
    name prev_hx_q610_147 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_147 \
    op interface \
    ports { prev_hx_q610_147 { O 16 vector } prev_hx_q610_147_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1137 \
    name prev_hx_q610_148 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_148 \
    op interface \
    ports { prev_hx_q610_148 { O 16 vector } prev_hx_q610_148_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1138 \
    name prev_hx_q610_149 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_149 \
    op interface \
    ports { prev_hx_q610_149 { O 16 vector } prev_hx_q610_149_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1139 \
    name prev_hx_q610_150 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_150 \
    op interface \
    ports { prev_hx_q610_150 { O 16 vector } prev_hx_q610_150_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1140 \
    name prev_hx_q610_151 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_151 \
    op interface \
    ports { prev_hx_q610_151 { O 16 vector } prev_hx_q610_151_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1141 \
    name prev_hx_q610_152 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_152 \
    op interface \
    ports { prev_hx_q610_152 { O 16 vector } prev_hx_q610_152_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1142 \
    name prev_hx_q610_153 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_153 \
    op interface \
    ports { prev_hx_q610_153 { O 16 vector } prev_hx_q610_153_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1143 \
    name prev_hx_q610_154 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_154 \
    op interface \
    ports { prev_hx_q610_154 { O 16 vector } prev_hx_q610_154_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1144 \
    name prev_hx_q610_155 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_155 \
    op interface \
    ports { prev_hx_q610_155 { O 16 vector } prev_hx_q610_155_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1145 \
    name prev_hx_q610_156 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_156 \
    op interface \
    ports { prev_hx_q610_156 { O 16 vector } prev_hx_q610_156_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1146 \
    name prev_hx_q610_157 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_157 \
    op interface \
    ports { prev_hx_q610_157 { O 16 vector } prev_hx_q610_157_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1147 \
    name prev_hx_q610_158 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_158 \
    op interface \
    ports { prev_hx_q610_158 { O 16 vector } prev_hx_q610_158_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1148 \
    name prev_hx_q610_159 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_159 \
    op interface \
    ports { prev_hx_q610_159 { O 16 vector } prev_hx_q610_159_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1149 \
    name prev_hx_q610_160 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_160 \
    op interface \
    ports { prev_hx_q610_160 { O 16 vector } prev_hx_q610_160_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1150 \
    name prev_hx_q610_161 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_161 \
    op interface \
    ports { prev_hx_q610_161 { O 16 vector } prev_hx_q610_161_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1151 \
    name prev_hx_q610_162 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_162 \
    op interface \
    ports { prev_hx_q610_162 { O 16 vector } prev_hx_q610_162_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1152 \
    name prev_hx_q610_163 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_163 \
    op interface \
    ports { prev_hx_q610_163 { O 16 vector } prev_hx_q610_163_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1153 \
    name prev_hx_q610_164 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_164 \
    op interface \
    ports { prev_hx_q610_164 { O 16 vector } prev_hx_q610_164_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1154 \
    name prev_hx_q610_165 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_165 \
    op interface \
    ports { prev_hx_q610_165 { O 16 vector } prev_hx_q610_165_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1155 \
    name prev_hx_q610_166 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_166 \
    op interface \
    ports { prev_hx_q610_166 { O 16 vector } prev_hx_q610_166_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1156 \
    name prev_hx_q610_167 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_167 \
    op interface \
    ports { prev_hx_q610_167 { O 16 vector } prev_hx_q610_167_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1157 \
    name prev_hx_q610_168 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_168 \
    op interface \
    ports { prev_hx_q610_168 { O 16 vector } prev_hx_q610_168_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1158 \
    name prev_hx_q610_169 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_169 \
    op interface \
    ports { prev_hx_q610_169 { O 16 vector } prev_hx_q610_169_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1159 \
    name prev_hx_q610_170 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_170 \
    op interface \
    ports { prev_hx_q610_170 { O 16 vector } prev_hx_q610_170_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1160 \
    name prev_hx_q610_171 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_171 \
    op interface \
    ports { prev_hx_q610_171 { O 16 vector } prev_hx_q610_171_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1161 \
    name prev_hx_q610_172 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_172 \
    op interface \
    ports { prev_hx_q610_172 { O 16 vector } prev_hx_q610_172_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1162 \
    name prev_hx_q610_173 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_173 \
    op interface \
    ports { prev_hx_q610_173 { O 16 vector } prev_hx_q610_173_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1163 \
    name prev_hx_q610_174 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_174 \
    op interface \
    ports { prev_hx_q610_174 { O 16 vector } prev_hx_q610_174_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1164 \
    name prev_hx_q610_175 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_175 \
    op interface \
    ports { prev_hx_q610_175 { O 16 vector } prev_hx_q610_175_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1165 \
    name prev_hx_q610_176 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_176 \
    op interface \
    ports { prev_hx_q610_176 { O 16 vector } prev_hx_q610_176_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1166 \
    name prev_hx_q610_177 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_177 \
    op interface \
    ports { prev_hx_q610_177 { O 16 vector } prev_hx_q610_177_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1167 \
    name prev_hx_q610_178 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_178 \
    op interface \
    ports { prev_hx_q610_178 { O 16 vector } prev_hx_q610_178_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1168 \
    name prev_hx_q610_179 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_179 \
    op interface \
    ports { prev_hx_q610_179 { O 16 vector } prev_hx_q610_179_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1169 \
    name prev_hx_q610_180 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_180 \
    op interface \
    ports { prev_hx_q610_180 { O 16 vector } prev_hx_q610_180_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1170 \
    name prev_hx_q610_181 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_181 \
    op interface \
    ports { prev_hx_q610_181 { O 16 vector } prev_hx_q610_181_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1171 \
    name prev_hx_q610_182 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_182 \
    op interface \
    ports { prev_hx_q610_182 { O 16 vector } prev_hx_q610_182_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1172 \
    name prev_hx_q610_183 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_183 \
    op interface \
    ports { prev_hx_q610_183 { O 16 vector } prev_hx_q610_183_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1173 \
    name prev_hx_q610_184 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_184 \
    op interface \
    ports { prev_hx_q610_184 { O 16 vector } prev_hx_q610_184_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1174 \
    name prev_hx_q610_185 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_185 \
    op interface \
    ports { prev_hx_q610_185 { O 16 vector } prev_hx_q610_185_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1175 \
    name prev_hx_q610_186 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_186 \
    op interface \
    ports { prev_hx_q610_186 { O 16 vector } prev_hx_q610_186_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1176 \
    name prev_hx_q610_187 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_187 \
    op interface \
    ports { prev_hx_q610_187 { O 16 vector } prev_hx_q610_187_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1177 \
    name prev_hx_q610_188 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_188 \
    op interface \
    ports { prev_hx_q610_188 { O 16 vector } prev_hx_q610_188_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1178 \
    name prev_hx_q610_189 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_189 \
    op interface \
    ports { prev_hx_q610_189 { O 16 vector } prev_hx_q610_189_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1179 \
    name prev_hx_q610_190 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_190 \
    op interface \
    ports { prev_hx_q610_190 { O 16 vector } prev_hx_q610_190_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1180 \
    name prev_hx_q610_191 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_191 \
    op interface \
    ports { prev_hx_q610_191 { O 16 vector } prev_hx_q610_191_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1181 \
    name prev_hx_q610_192 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_192 \
    op interface \
    ports { prev_hx_q610_192 { O 16 vector } prev_hx_q610_192_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1182 \
    name prev_hx_q610_193 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_193 \
    op interface \
    ports { prev_hx_q610_193 { O 16 vector } prev_hx_q610_193_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1183 \
    name prev_hx_q610_194 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_194 \
    op interface \
    ports { prev_hx_q610_194 { O 16 vector } prev_hx_q610_194_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1184 \
    name prev_hx_q610_195 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_195 \
    op interface \
    ports { prev_hx_q610_195 { O 16 vector } prev_hx_q610_195_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1185 \
    name prev_hx_q610_196 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_196 \
    op interface \
    ports { prev_hx_q610_196 { O 16 vector } prev_hx_q610_196_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1186 \
    name prev_hx_q610_197 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_197 \
    op interface \
    ports { prev_hx_q610_197 { O 16 vector } prev_hx_q610_197_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1187 \
    name prev_hx_q610_198 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_198 \
    op interface \
    ports { prev_hx_q610_198 { O 16 vector } prev_hx_q610_198_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1188 \
    name prev_hx_q610_199 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_199 \
    op interface \
    ports { prev_hx_q610_199 { O 16 vector } prev_hx_q610_199_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1189 \
    name prev_hx_q610_200 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_200 \
    op interface \
    ports { prev_hx_q610_200 { O 16 vector } prev_hx_q610_200_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1190 \
    name prev_hx_q610_201 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_201 \
    op interface \
    ports { prev_hx_q610_201 { O 16 vector } prev_hx_q610_201_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1191 \
    name prev_hx_q610_202 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_202 \
    op interface \
    ports { prev_hx_q610_202 { O 16 vector } prev_hx_q610_202_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1192 \
    name prev_hx_q610_203 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_203 \
    op interface \
    ports { prev_hx_q610_203 { O 16 vector } prev_hx_q610_203_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1193 \
    name prev_hx_q610_204 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_204 \
    op interface \
    ports { prev_hx_q610_204 { O 16 vector } prev_hx_q610_204_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1194 \
    name prev_hx_q610_205 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_205 \
    op interface \
    ports { prev_hx_q610_205 { O 16 vector } prev_hx_q610_205_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1195 \
    name prev_hx_q610_206 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_206 \
    op interface \
    ports { prev_hx_q610_206 { O 16 vector } prev_hx_q610_206_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1196 \
    name prev_hx_q610_207 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_207 \
    op interface \
    ports { prev_hx_q610_207 { O 16 vector } prev_hx_q610_207_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1197 \
    name prev_hx_q610_208 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_208 \
    op interface \
    ports { prev_hx_q610_208 { O 16 vector } prev_hx_q610_208_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1198 \
    name prev_hx_q610_209 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_209 \
    op interface \
    ports { prev_hx_q610_209 { O 16 vector } prev_hx_q610_209_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1199 \
    name prev_hx_q610_210 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_210 \
    op interface \
    ports { prev_hx_q610_210 { O 16 vector } prev_hx_q610_210_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1200 \
    name prev_hx_q610_211 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_211 \
    op interface \
    ports { prev_hx_q610_211 { O 16 vector } prev_hx_q610_211_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1201 \
    name prev_hx_q610_212 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_212 \
    op interface \
    ports { prev_hx_q610_212 { O 16 vector } prev_hx_q610_212_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1202 \
    name prev_hx_q610_213 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_213 \
    op interface \
    ports { prev_hx_q610_213 { O 16 vector } prev_hx_q610_213_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1203 \
    name prev_hx_q610_214 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_214 \
    op interface \
    ports { prev_hx_q610_214 { O 16 vector } prev_hx_q610_214_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1204 \
    name prev_hx_q610_215 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_215 \
    op interface \
    ports { prev_hx_q610_215 { O 16 vector } prev_hx_q610_215_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1205 \
    name prev_hx_q610_216 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_216 \
    op interface \
    ports { prev_hx_q610_216 { O 16 vector } prev_hx_q610_216_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1206 \
    name prev_hx_q610_217 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_217 \
    op interface \
    ports { prev_hx_q610_217 { O 16 vector } prev_hx_q610_217_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1207 \
    name prev_hx_q610_218 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_218 \
    op interface \
    ports { prev_hx_q610_218 { O 16 vector } prev_hx_q610_218_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1208 \
    name prev_hx_q610_219 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_219 \
    op interface \
    ports { prev_hx_q610_219 { O 16 vector } prev_hx_q610_219_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1209 \
    name prev_hx_q610_220 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_220 \
    op interface \
    ports { prev_hx_q610_220 { O 16 vector } prev_hx_q610_220_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1210 \
    name prev_hx_q610_221 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_221 \
    op interface \
    ports { prev_hx_q610_221 { O 16 vector } prev_hx_q610_221_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1211 \
    name prev_hx_q610_222 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_222 \
    op interface \
    ports { prev_hx_q610_222 { O 16 vector } prev_hx_q610_222_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1212 \
    name prev_hx_q610_223 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_223 \
    op interface \
    ports { prev_hx_q610_223 { O 16 vector } prev_hx_q610_223_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1213 \
    name prev_cx_q610_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_0 \
    op interface \
    ports { prev_cx_q610_0 { O 16 vector } prev_cx_q610_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1214 \
    name prev_cx_q610_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_1 \
    op interface \
    ports { prev_cx_q610_1 { O 16 vector } prev_cx_q610_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1215 \
    name prev_cx_q610_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_2 \
    op interface \
    ports { prev_cx_q610_2 { O 16 vector } prev_cx_q610_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1216 \
    name prev_cx_q610_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_3 \
    op interface \
    ports { prev_cx_q610_3 { O 16 vector } prev_cx_q610_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1217 \
    name prev_cx_q610_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_4 \
    op interface \
    ports { prev_cx_q610_4 { O 16 vector } prev_cx_q610_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1218 \
    name prev_cx_q610_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_5 \
    op interface \
    ports { prev_cx_q610_5 { O 16 vector } prev_cx_q610_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1219 \
    name prev_cx_q610_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_6 \
    op interface \
    ports { prev_cx_q610_6 { O 16 vector } prev_cx_q610_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1220 \
    name prev_cx_q610_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_7 \
    op interface \
    ports { prev_cx_q610_7 { O 16 vector } prev_cx_q610_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1221 \
    name prev_cx_q610_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_8 \
    op interface \
    ports { prev_cx_q610_8 { O 16 vector } prev_cx_q610_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1222 \
    name prev_cx_q610_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_9 \
    op interface \
    ports { prev_cx_q610_9 { O 16 vector } prev_cx_q610_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1223 \
    name prev_cx_q610_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_10 \
    op interface \
    ports { prev_cx_q610_10 { O 16 vector } prev_cx_q610_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1224 \
    name prev_cx_q610_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_11 \
    op interface \
    ports { prev_cx_q610_11 { O 16 vector } prev_cx_q610_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1225 \
    name prev_cx_q610_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_12 \
    op interface \
    ports { prev_cx_q610_12 { O 16 vector } prev_cx_q610_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1226 \
    name prev_cx_q610_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_13 \
    op interface \
    ports { prev_cx_q610_13 { O 16 vector } prev_cx_q610_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1227 \
    name prev_cx_q610_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_14 \
    op interface \
    ports { prev_cx_q610_14 { O 16 vector } prev_cx_q610_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1228 \
    name prev_cx_q610_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_15 \
    op interface \
    ports { prev_cx_q610_15 { O 16 vector } prev_cx_q610_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1229 \
    name prev_cx_q610_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_16 \
    op interface \
    ports { prev_cx_q610_16 { O 16 vector } prev_cx_q610_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1230 \
    name prev_cx_q610_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_17 \
    op interface \
    ports { prev_cx_q610_17 { O 16 vector } prev_cx_q610_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1231 \
    name prev_cx_q610_18 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_18 \
    op interface \
    ports { prev_cx_q610_18 { O 16 vector } prev_cx_q610_18_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1232 \
    name prev_cx_q610_19 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_19 \
    op interface \
    ports { prev_cx_q610_19 { O 16 vector } prev_cx_q610_19_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1233 \
    name prev_cx_q610_20 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_20 \
    op interface \
    ports { prev_cx_q610_20 { O 16 vector } prev_cx_q610_20_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1234 \
    name prev_cx_q610_21 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_21 \
    op interface \
    ports { prev_cx_q610_21 { O 16 vector } prev_cx_q610_21_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1235 \
    name prev_cx_q610_22 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_22 \
    op interface \
    ports { prev_cx_q610_22 { O 16 vector } prev_cx_q610_22_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1236 \
    name prev_cx_q610_23 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_23 \
    op interface \
    ports { prev_cx_q610_23 { O 16 vector } prev_cx_q610_23_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1237 \
    name prev_cx_q610_24 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_24 \
    op interface \
    ports { prev_cx_q610_24 { O 16 vector } prev_cx_q610_24_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1238 \
    name prev_cx_q610_25 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_25 \
    op interface \
    ports { prev_cx_q610_25 { O 16 vector } prev_cx_q610_25_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1239 \
    name prev_cx_q610_26 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_26 \
    op interface \
    ports { prev_cx_q610_26 { O 16 vector } prev_cx_q610_26_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1240 \
    name prev_cx_q610_27 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_27 \
    op interface \
    ports { prev_cx_q610_27 { O 16 vector } prev_cx_q610_27_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1241 \
    name prev_cx_q610_28 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_28 \
    op interface \
    ports { prev_cx_q610_28 { O 16 vector } prev_cx_q610_28_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1242 \
    name prev_cx_q610_29 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_29 \
    op interface \
    ports { prev_cx_q610_29 { O 16 vector } prev_cx_q610_29_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1243 \
    name prev_cx_q610_30 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_30 \
    op interface \
    ports { prev_cx_q610_30 { O 16 vector } prev_cx_q610_30_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1244 \
    name prev_cx_q610_31 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_31 \
    op interface \
    ports { prev_cx_q610_31 { O 16 vector } prev_cx_q610_31_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1245 \
    name prev_cx_q610_32 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_32 \
    op interface \
    ports { prev_cx_q610_32 { O 16 vector } prev_cx_q610_32_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1246 \
    name prev_cx_q610_33 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_33 \
    op interface \
    ports { prev_cx_q610_33 { O 16 vector } prev_cx_q610_33_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1247 \
    name prev_cx_q610_34 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_34 \
    op interface \
    ports { prev_cx_q610_34 { O 16 vector } prev_cx_q610_34_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1248 \
    name prev_cx_q610_35 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_35 \
    op interface \
    ports { prev_cx_q610_35 { O 16 vector } prev_cx_q610_35_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1249 \
    name prev_cx_q610_36 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_36 \
    op interface \
    ports { prev_cx_q610_36 { O 16 vector } prev_cx_q610_36_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1250 \
    name prev_cx_q610_37 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_37 \
    op interface \
    ports { prev_cx_q610_37 { O 16 vector } prev_cx_q610_37_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1251 \
    name prev_cx_q610_38 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_38 \
    op interface \
    ports { prev_cx_q610_38 { O 16 vector } prev_cx_q610_38_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1252 \
    name prev_cx_q610_39 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_39 \
    op interface \
    ports { prev_cx_q610_39 { O 16 vector } prev_cx_q610_39_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1253 \
    name prev_cx_q610_40 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_40 \
    op interface \
    ports { prev_cx_q610_40 { O 16 vector } prev_cx_q610_40_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1254 \
    name prev_cx_q610_41 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_41 \
    op interface \
    ports { prev_cx_q610_41 { O 16 vector } prev_cx_q610_41_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1255 \
    name prev_cx_q610_42 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_42 \
    op interface \
    ports { prev_cx_q610_42 { O 16 vector } prev_cx_q610_42_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1256 \
    name prev_cx_q610_43 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_43 \
    op interface \
    ports { prev_cx_q610_43 { O 16 vector } prev_cx_q610_43_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1257 \
    name prev_cx_q610_44 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_44 \
    op interface \
    ports { prev_cx_q610_44 { O 16 vector } prev_cx_q610_44_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1258 \
    name prev_cx_q610_45 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_45 \
    op interface \
    ports { prev_cx_q610_45 { O 16 vector } prev_cx_q610_45_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1259 \
    name prev_cx_q610_46 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_46 \
    op interface \
    ports { prev_cx_q610_46 { O 16 vector } prev_cx_q610_46_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1260 \
    name prev_cx_q610_47 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_47 \
    op interface \
    ports { prev_cx_q610_47 { O 16 vector } prev_cx_q610_47_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1261 \
    name prev_cx_q610_48 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_48 \
    op interface \
    ports { prev_cx_q610_48 { O 16 vector } prev_cx_q610_48_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1262 \
    name prev_cx_q610_49 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_49 \
    op interface \
    ports { prev_cx_q610_49 { O 16 vector } prev_cx_q610_49_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1263 \
    name prev_cx_q610_50 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_50 \
    op interface \
    ports { prev_cx_q610_50 { O 16 vector } prev_cx_q610_50_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1264 \
    name prev_cx_q610_51 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_51 \
    op interface \
    ports { prev_cx_q610_51 { O 16 vector } prev_cx_q610_51_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1265 \
    name prev_cx_q610_52 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_52 \
    op interface \
    ports { prev_cx_q610_52 { O 16 vector } prev_cx_q610_52_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1266 \
    name prev_cx_q610_53 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_53 \
    op interface \
    ports { prev_cx_q610_53 { O 16 vector } prev_cx_q610_53_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1267 \
    name prev_cx_q610_54 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_54 \
    op interface \
    ports { prev_cx_q610_54 { O 16 vector } prev_cx_q610_54_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1268 \
    name prev_cx_q610_55 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_55 \
    op interface \
    ports { prev_cx_q610_55 { O 16 vector } prev_cx_q610_55_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1269 \
    name prev_cx_q610_56 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_56 \
    op interface \
    ports { prev_cx_q610_56 { O 16 vector } prev_cx_q610_56_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1270 \
    name prev_cx_q610_57 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_57 \
    op interface \
    ports { prev_cx_q610_57 { O 16 vector } prev_cx_q610_57_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1271 \
    name prev_cx_q610_58 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_58 \
    op interface \
    ports { prev_cx_q610_58 { O 16 vector } prev_cx_q610_58_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1272 \
    name prev_cx_q610_59 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_59 \
    op interface \
    ports { prev_cx_q610_59 { O 16 vector } prev_cx_q610_59_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1273 \
    name prev_cx_q610_60 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_60 \
    op interface \
    ports { prev_cx_q610_60 { O 16 vector } prev_cx_q610_60_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1274 \
    name prev_cx_q610_61 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_61 \
    op interface \
    ports { prev_cx_q610_61 { O 16 vector } prev_cx_q610_61_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1275 \
    name prev_cx_q610_62 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_62 \
    op interface \
    ports { prev_cx_q610_62 { O 16 vector } prev_cx_q610_62_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1276 \
    name prev_cx_q610_63 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_63 \
    op interface \
    ports { prev_cx_q610_63 { O 16 vector } prev_cx_q610_63_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1277 \
    name prev_cx_q610_64 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_64 \
    op interface \
    ports { prev_cx_q610_64 { O 16 vector } prev_cx_q610_64_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1278 \
    name prev_cx_q610_65 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_65 \
    op interface \
    ports { prev_cx_q610_65 { O 16 vector } prev_cx_q610_65_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1279 \
    name prev_cx_q610_66 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_66 \
    op interface \
    ports { prev_cx_q610_66 { O 16 vector } prev_cx_q610_66_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1280 \
    name prev_cx_q610_67 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_67 \
    op interface \
    ports { prev_cx_q610_67 { O 16 vector } prev_cx_q610_67_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1281 \
    name prev_cx_q610_68 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_68 \
    op interface \
    ports { prev_cx_q610_68 { O 16 vector } prev_cx_q610_68_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1282 \
    name prev_cx_q610_69 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_69 \
    op interface \
    ports { prev_cx_q610_69 { O 16 vector } prev_cx_q610_69_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1283 \
    name prev_cx_q610_70 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_70 \
    op interface \
    ports { prev_cx_q610_70 { O 16 vector } prev_cx_q610_70_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1284 \
    name prev_cx_q610_71 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_71 \
    op interface \
    ports { prev_cx_q610_71 { O 16 vector } prev_cx_q610_71_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1285 \
    name prev_cx_q610_72 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_72 \
    op interface \
    ports { prev_cx_q610_72 { O 16 vector } prev_cx_q610_72_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1286 \
    name prev_cx_q610_73 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_73 \
    op interface \
    ports { prev_cx_q610_73 { O 16 vector } prev_cx_q610_73_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1287 \
    name prev_cx_q610_74 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_74 \
    op interface \
    ports { prev_cx_q610_74 { O 16 vector } prev_cx_q610_74_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1288 \
    name prev_cx_q610_75 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_75 \
    op interface \
    ports { prev_cx_q610_75 { O 16 vector } prev_cx_q610_75_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1289 \
    name prev_cx_q610_76 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_76 \
    op interface \
    ports { prev_cx_q610_76 { O 16 vector } prev_cx_q610_76_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1290 \
    name prev_cx_q610_77 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_77 \
    op interface \
    ports { prev_cx_q610_77 { O 16 vector } prev_cx_q610_77_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1291 \
    name prev_cx_q610_78 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_78 \
    op interface \
    ports { prev_cx_q610_78 { O 16 vector } prev_cx_q610_78_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1292 \
    name prev_cx_q610_79 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_79 \
    op interface \
    ports { prev_cx_q610_79 { O 16 vector } prev_cx_q610_79_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1293 \
    name prev_cx_q610_80 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_80 \
    op interface \
    ports { prev_cx_q610_80 { O 16 vector } prev_cx_q610_80_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1294 \
    name prev_cx_q610_81 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_81 \
    op interface \
    ports { prev_cx_q610_81 { O 16 vector } prev_cx_q610_81_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1295 \
    name prev_cx_q610_82 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_82 \
    op interface \
    ports { prev_cx_q610_82 { O 16 vector } prev_cx_q610_82_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1296 \
    name prev_cx_q610_83 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_83 \
    op interface \
    ports { prev_cx_q610_83 { O 16 vector } prev_cx_q610_83_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1297 \
    name prev_cx_q610_84 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_84 \
    op interface \
    ports { prev_cx_q610_84 { O 16 vector } prev_cx_q610_84_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1298 \
    name prev_cx_q610_85 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_85 \
    op interface \
    ports { prev_cx_q610_85 { O 16 vector } prev_cx_q610_85_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1299 \
    name prev_cx_q610_86 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_86 \
    op interface \
    ports { prev_cx_q610_86 { O 16 vector } prev_cx_q610_86_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1300 \
    name prev_cx_q610_87 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_87 \
    op interface \
    ports { prev_cx_q610_87 { O 16 vector } prev_cx_q610_87_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1301 \
    name prev_cx_q610_88 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_88 \
    op interface \
    ports { prev_cx_q610_88 { O 16 vector } prev_cx_q610_88_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1302 \
    name prev_cx_q610_89 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_89 \
    op interface \
    ports { prev_cx_q610_89 { O 16 vector } prev_cx_q610_89_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1303 \
    name prev_cx_q610_90 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_90 \
    op interface \
    ports { prev_cx_q610_90 { O 16 vector } prev_cx_q610_90_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1304 \
    name prev_cx_q610_91 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_91 \
    op interface \
    ports { prev_cx_q610_91 { O 16 vector } prev_cx_q610_91_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1305 \
    name prev_cx_q610_92 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_92 \
    op interface \
    ports { prev_cx_q610_92 { O 16 vector } prev_cx_q610_92_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1306 \
    name prev_cx_q610_93 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_93 \
    op interface \
    ports { prev_cx_q610_93 { O 16 vector } prev_cx_q610_93_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1307 \
    name prev_cx_q610_94 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_94 \
    op interface \
    ports { prev_cx_q610_94 { O 16 vector } prev_cx_q610_94_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1308 \
    name prev_cx_q610_95 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_95 \
    op interface \
    ports { prev_cx_q610_95 { O 16 vector } prev_cx_q610_95_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1309 \
    name prev_cx_q610_96 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_96 \
    op interface \
    ports { prev_cx_q610_96 { O 16 vector } prev_cx_q610_96_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1310 \
    name prev_cx_q610_97 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_97 \
    op interface \
    ports { prev_cx_q610_97 { O 16 vector } prev_cx_q610_97_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1311 \
    name prev_cx_q610_98 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_98 \
    op interface \
    ports { prev_cx_q610_98 { O 16 vector } prev_cx_q610_98_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1312 \
    name prev_cx_q610_99 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_99 \
    op interface \
    ports { prev_cx_q610_99 { O 16 vector } prev_cx_q610_99_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1313 \
    name prev_cx_q610_100 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_100 \
    op interface \
    ports { prev_cx_q610_100 { O 16 vector } prev_cx_q610_100_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1314 \
    name prev_cx_q610_101 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_101 \
    op interface \
    ports { prev_cx_q610_101 { O 16 vector } prev_cx_q610_101_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1315 \
    name prev_cx_q610_102 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_102 \
    op interface \
    ports { prev_cx_q610_102 { O 16 vector } prev_cx_q610_102_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1316 \
    name prev_cx_q610_103 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_103 \
    op interface \
    ports { prev_cx_q610_103 { O 16 vector } prev_cx_q610_103_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1317 \
    name prev_cx_q610_104 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_104 \
    op interface \
    ports { prev_cx_q610_104 { O 16 vector } prev_cx_q610_104_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1318 \
    name prev_cx_q610_105 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_105 \
    op interface \
    ports { prev_cx_q610_105 { O 16 vector } prev_cx_q610_105_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1319 \
    name prev_cx_q610_106 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_106 \
    op interface \
    ports { prev_cx_q610_106 { O 16 vector } prev_cx_q610_106_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1320 \
    name prev_cx_q610_107 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_107 \
    op interface \
    ports { prev_cx_q610_107 { O 16 vector } prev_cx_q610_107_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1321 \
    name prev_cx_q610_108 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_108 \
    op interface \
    ports { prev_cx_q610_108 { O 16 vector } prev_cx_q610_108_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1322 \
    name prev_cx_q610_109 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_109 \
    op interface \
    ports { prev_cx_q610_109 { O 16 vector } prev_cx_q610_109_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1323 \
    name prev_cx_q610_110 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_110 \
    op interface \
    ports { prev_cx_q610_110 { O 16 vector } prev_cx_q610_110_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1324 \
    name prev_cx_q610_111 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_111 \
    op interface \
    ports { prev_cx_q610_111 { O 16 vector } prev_cx_q610_111_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1325 \
    name prev_cx_q610_112 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_112 \
    op interface \
    ports { prev_cx_q610_112 { O 16 vector } prev_cx_q610_112_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1326 \
    name prev_cx_q610_113 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_113 \
    op interface \
    ports { prev_cx_q610_113 { O 16 vector } prev_cx_q610_113_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1327 \
    name prev_cx_q610_114 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_114 \
    op interface \
    ports { prev_cx_q610_114 { O 16 vector } prev_cx_q610_114_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1328 \
    name prev_cx_q610_115 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_115 \
    op interface \
    ports { prev_cx_q610_115 { O 16 vector } prev_cx_q610_115_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1329 \
    name prev_cx_q610_116 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_116 \
    op interface \
    ports { prev_cx_q610_116 { O 16 vector } prev_cx_q610_116_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1330 \
    name prev_cx_q610_117 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_117 \
    op interface \
    ports { prev_cx_q610_117 { O 16 vector } prev_cx_q610_117_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1331 \
    name prev_cx_q610_118 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_118 \
    op interface \
    ports { prev_cx_q610_118 { O 16 vector } prev_cx_q610_118_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1332 \
    name prev_cx_q610_119 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_119 \
    op interface \
    ports { prev_cx_q610_119 { O 16 vector } prev_cx_q610_119_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1333 \
    name prev_cx_q610_120 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_120 \
    op interface \
    ports { prev_cx_q610_120 { O 16 vector } prev_cx_q610_120_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1334 \
    name prev_cx_q610_121 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_121 \
    op interface \
    ports { prev_cx_q610_121 { O 16 vector } prev_cx_q610_121_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1335 \
    name prev_cx_q610_122 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_122 \
    op interface \
    ports { prev_cx_q610_122 { O 16 vector } prev_cx_q610_122_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1336 \
    name prev_cx_q610_123 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_123 \
    op interface \
    ports { prev_cx_q610_123 { O 16 vector } prev_cx_q610_123_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1337 \
    name prev_cx_q610_124 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_124 \
    op interface \
    ports { prev_cx_q610_124 { O 16 vector } prev_cx_q610_124_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1338 \
    name prev_cx_q610_125 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_125 \
    op interface \
    ports { prev_cx_q610_125 { O 16 vector } prev_cx_q610_125_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1339 \
    name prev_cx_q610_126 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_126 \
    op interface \
    ports { prev_cx_q610_126 { O 16 vector } prev_cx_q610_126_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1340 \
    name prev_cx_q610_127 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_127 \
    op interface \
    ports { prev_cx_q610_127 { O 16 vector } prev_cx_q610_127_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1341 \
    name prev_cx_q610_128 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_128 \
    op interface \
    ports { prev_cx_q610_128 { O 16 vector } prev_cx_q610_128_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1342 \
    name prev_cx_q610_129 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_129 \
    op interface \
    ports { prev_cx_q610_129 { O 16 vector } prev_cx_q610_129_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1343 \
    name prev_cx_q610_130 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_130 \
    op interface \
    ports { prev_cx_q610_130 { O 16 vector } prev_cx_q610_130_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1344 \
    name prev_cx_q610_131 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_131 \
    op interface \
    ports { prev_cx_q610_131 { O 16 vector } prev_cx_q610_131_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1345 \
    name prev_cx_q610_132 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_132 \
    op interface \
    ports { prev_cx_q610_132 { O 16 vector } prev_cx_q610_132_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1346 \
    name prev_cx_q610_133 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_133 \
    op interface \
    ports { prev_cx_q610_133 { O 16 vector } prev_cx_q610_133_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1347 \
    name prev_cx_q610_134 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_134 \
    op interface \
    ports { prev_cx_q610_134 { O 16 vector } prev_cx_q610_134_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1348 \
    name prev_cx_q610_135 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_135 \
    op interface \
    ports { prev_cx_q610_135 { O 16 vector } prev_cx_q610_135_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1349 \
    name prev_cx_q610_136 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_136 \
    op interface \
    ports { prev_cx_q610_136 { O 16 vector } prev_cx_q610_136_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1350 \
    name prev_cx_q610_137 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_137 \
    op interface \
    ports { prev_cx_q610_137 { O 16 vector } prev_cx_q610_137_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1351 \
    name prev_cx_q610_138 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_138 \
    op interface \
    ports { prev_cx_q610_138 { O 16 vector } prev_cx_q610_138_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1352 \
    name prev_cx_q610_139 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_139 \
    op interface \
    ports { prev_cx_q610_139 { O 16 vector } prev_cx_q610_139_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1353 \
    name prev_cx_q610_140 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_140 \
    op interface \
    ports { prev_cx_q610_140 { O 16 vector } prev_cx_q610_140_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1354 \
    name prev_cx_q610_141 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_141 \
    op interface \
    ports { prev_cx_q610_141 { O 16 vector } prev_cx_q610_141_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1355 \
    name prev_cx_q610_142 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_142 \
    op interface \
    ports { prev_cx_q610_142 { O 16 vector } prev_cx_q610_142_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1356 \
    name prev_cx_q610_143 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_143 \
    op interface \
    ports { prev_cx_q610_143 { O 16 vector } prev_cx_q610_143_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1357 \
    name prev_cx_q610_144 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_144 \
    op interface \
    ports { prev_cx_q610_144 { O 16 vector } prev_cx_q610_144_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1358 \
    name prev_cx_q610_145 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_145 \
    op interface \
    ports { prev_cx_q610_145 { O 16 vector } prev_cx_q610_145_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1359 \
    name prev_cx_q610_146 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_146 \
    op interface \
    ports { prev_cx_q610_146 { O 16 vector } prev_cx_q610_146_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1360 \
    name prev_cx_q610_147 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_147 \
    op interface \
    ports { prev_cx_q610_147 { O 16 vector } prev_cx_q610_147_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1361 \
    name prev_cx_q610_148 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_148 \
    op interface \
    ports { prev_cx_q610_148 { O 16 vector } prev_cx_q610_148_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1362 \
    name prev_cx_q610_149 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_149 \
    op interface \
    ports { prev_cx_q610_149 { O 16 vector } prev_cx_q610_149_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1363 \
    name prev_cx_q610_150 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_150 \
    op interface \
    ports { prev_cx_q610_150 { O 16 vector } prev_cx_q610_150_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1364 \
    name prev_cx_q610_151 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_151 \
    op interface \
    ports { prev_cx_q610_151 { O 16 vector } prev_cx_q610_151_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1365 \
    name prev_cx_q610_152 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_152 \
    op interface \
    ports { prev_cx_q610_152 { O 16 vector } prev_cx_q610_152_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1366 \
    name prev_cx_q610_153 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_153 \
    op interface \
    ports { prev_cx_q610_153 { O 16 vector } prev_cx_q610_153_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1367 \
    name prev_cx_q610_154 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_154 \
    op interface \
    ports { prev_cx_q610_154 { O 16 vector } prev_cx_q610_154_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1368 \
    name prev_cx_q610_155 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_155 \
    op interface \
    ports { prev_cx_q610_155 { O 16 vector } prev_cx_q610_155_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1369 \
    name prev_cx_q610_156 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_156 \
    op interface \
    ports { prev_cx_q610_156 { O 16 vector } prev_cx_q610_156_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1370 \
    name prev_cx_q610_157 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_157 \
    op interface \
    ports { prev_cx_q610_157 { O 16 vector } prev_cx_q610_157_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1371 \
    name prev_cx_q610_158 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_158 \
    op interface \
    ports { prev_cx_q610_158 { O 16 vector } prev_cx_q610_158_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1372 \
    name prev_cx_q610_159 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_159 \
    op interface \
    ports { prev_cx_q610_159 { O 16 vector } prev_cx_q610_159_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1373 \
    name prev_cx_q610_160 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_160 \
    op interface \
    ports { prev_cx_q610_160 { O 16 vector } prev_cx_q610_160_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1374 \
    name prev_cx_q610_161 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_161 \
    op interface \
    ports { prev_cx_q610_161 { O 16 vector } prev_cx_q610_161_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1375 \
    name prev_cx_q610_162 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_162 \
    op interface \
    ports { prev_cx_q610_162 { O 16 vector } prev_cx_q610_162_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1376 \
    name prev_cx_q610_163 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_163 \
    op interface \
    ports { prev_cx_q610_163 { O 16 vector } prev_cx_q610_163_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1377 \
    name prev_cx_q610_164 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_164 \
    op interface \
    ports { prev_cx_q610_164 { O 16 vector } prev_cx_q610_164_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1378 \
    name prev_cx_q610_165 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_165 \
    op interface \
    ports { prev_cx_q610_165 { O 16 vector } prev_cx_q610_165_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1379 \
    name prev_cx_q610_166 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_166 \
    op interface \
    ports { prev_cx_q610_166 { O 16 vector } prev_cx_q610_166_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1380 \
    name prev_cx_q610_167 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_167 \
    op interface \
    ports { prev_cx_q610_167 { O 16 vector } prev_cx_q610_167_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1381 \
    name prev_cx_q610_168 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_168 \
    op interface \
    ports { prev_cx_q610_168 { O 16 vector } prev_cx_q610_168_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1382 \
    name prev_cx_q610_169 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_169 \
    op interface \
    ports { prev_cx_q610_169 { O 16 vector } prev_cx_q610_169_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1383 \
    name prev_cx_q610_170 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_170 \
    op interface \
    ports { prev_cx_q610_170 { O 16 vector } prev_cx_q610_170_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1384 \
    name prev_cx_q610_171 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_171 \
    op interface \
    ports { prev_cx_q610_171 { O 16 vector } prev_cx_q610_171_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1385 \
    name prev_cx_q610_172 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_172 \
    op interface \
    ports { prev_cx_q610_172 { O 16 vector } prev_cx_q610_172_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1386 \
    name prev_cx_q610_173 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_173 \
    op interface \
    ports { prev_cx_q610_173 { O 16 vector } prev_cx_q610_173_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1387 \
    name prev_cx_q610_174 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_174 \
    op interface \
    ports { prev_cx_q610_174 { O 16 vector } prev_cx_q610_174_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1388 \
    name prev_cx_q610_175 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_175 \
    op interface \
    ports { prev_cx_q610_175 { O 16 vector } prev_cx_q610_175_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1389 \
    name prev_cx_q610_176 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_176 \
    op interface \
    ports { prev_cx_q610_176 { O 16 vector } prev_cx_q610_176_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1390 \
    name prev_cx_q610_177 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_177 \
    op interface \
    ports { prev_cx_q610_177 { O 16 vector } prev_cx_q610_177_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1391 \
    name prev_cx_q610_178 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_178 \
    op interface \
    ports { prev_cx_q610_178 { O 16 vector } prev_cx_q610_178_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1392 \
    name prev_cx_q610_179 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_179 \
    op interface \
    ports { prev_cx_q610_179 { O 16 vector } prev_cx_q610_179_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1393 \
    name prev_cx_q610_180 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_180 \
    op interface \
    ports { prev_cx_q610_180 { O 16 vector } prev_cx_q610_180_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1394 \
    name prev_cx_q610_181 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_181 \
    op interface \
    ports { prev_cx_q610_181 { O 16 vector } prev_cx_q610_181_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1395 \
    name prev_cx_q610_182 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_182 \
    op interface \
    ports { prev_cx_q610_182 { O 16 vector } prev_cx_q610_182_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1396 \
    name prev_cx_q610_183 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_183 \
    op interface \
    ports { prev_cx_q610_183 { O 16 vector } prev_cx_q610_183_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1397 \
    name prev_cx_q610_184 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_184 \
    op interface \
    ports { prev_cx_q610_184 { O 16 vector } prev_cx_q610_184_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1398 \
    name prev_cx_q610_185 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_185 \
    op interface \
    ports { prev_cx_q610_185 { O 16 vector } prev_cx_q610_185_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1399 \
    name prev_cx_q610_186 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_186 \
    op interface \
    ports { prev_cx_q610_186 { O 16 vector } prev_cx_q610_186_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1400 \
    name prev_cx_q610_187 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_187 \
    op interface \
    ports { prev_cx_q610_187 { O 16 vector } prev_cx_q610_187_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1401 \
    name prev_cx_q610_188 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_188 \
    op interface \
    ports { prev_cx_q610_188 { O 16 vector } prev_cx_q610_188_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1402 \
    name prev_cx_q610_189 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_189 \
    op interface \
    ports { prev_cx_q610_189 { O 16 vector } prev_cx_q610_189_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1403 \
    name prev_cx_q610_190 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_190 \
    op interface \
    ports { prev_cx_q610_190 { O 16 vector } prev_cx_q610_190_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1404 \
    name prev_cx_q610_191 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_191 \
    op interface \
    ports { prev_cx_q610_191 { O 16 vector } prev_cx_q610_191_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1405 \
    name prev_cx_q610_192 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_192 \
    op interface \
    ports { prev_cx_q610_192 { O 16 vector } prev_cx_q610_192_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1406 \
    name prev_cx_q610_193 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_193 \
    op interface \
    ports { prev_cx_q610_193 { O 16 vector } prev_cx_q610_193_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1407 \
    name prev_cx_q610_194 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_194 \
    op interface \
    ports { prev_cx_q610_194 { O 16 vector } prev_cx_q610_194_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1408 \
    name prev_cx_q610_195 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_195 \
    op interface \
    ports { prev_cx_q610_195 { O 16 vector } prev_cx_q610_195_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1409 \
    name prev_cx_q610_196 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_196 \
    op interface \
    ports { prev_cx_q610_196 { O 16 vector } prev_cx_q610_196_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1410 \
    name prev_cx_q610_197 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_197 \
    op interface \
    ports { prev_cx_q610_197 { O 16 vector } prev_cx_q610_197_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1411 \
    name prev_cx_q610_198 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_198 \
    op interface \
    ports { prev_cx_q610_198 { O 16 vector } prev_cx_q610_198_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1412 \
    name prev_cx_q610_199 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_199 \
    op interface \
    ports { prev_cx_q610_199 { O 16 vector } prev_cx_q610_199_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1413 \
    name prev_cx_q610_200 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_200 \
    op interface \
    ports { prev_cx_q610_200 { O 16 vector } prev_cx_q610_200_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1414 \
    name prev_cx_q610_201 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_201 \
    op interface \
    ports { prev_cx_q610_201 { O 16 vector } prev_cx_q610_201_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1415 \
    name prev_cx_q610_202 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_202 \
    op interface \
    ports { prev_cx_q610_202 { O 16 vector } prev_cx_q610_202_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1416 \
    name prev_cx_q610_203 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_203 \
    op interface \
    ports { prev_cx_q610_203 { O 16 vector } prev_cx_q610_203_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1417 \
    name prev_cx_q610_204 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_204 \
    op interface \
    ports { prev_cx_q610_204 { O 16 vector } prev_cx_q610_204_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1418 \
    name prev_cx_q610_205 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_205 \
    op interface \
    ports { prev_cx_q610_205 { O 16 vector } prev_cx_q610_205_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1419 \
    name prev_cx_q610_206 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_206 \
    op interface \
    ports { prev_cx_q610_206 { O 16 vector } prev_cx_q610_206_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1420 \
    name prev_cx_q610_207 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_207 \
    op interface \
    ports { prev_cx_q610_207 { O 16 vector } prev_cx_q610_207_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1421 \
    name prev_cx_q610_208 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_208 \
    op interface \
    ports { prev_cx_q610_208 { O 16 vector } prev_cx_q610_208_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1422 \
    name prev_cx_q610_209 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_209 \
    op interface \
    ports { prev_cx_q610_209 { O 16 vector } prev_cx_q610_209_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1423 \
    name prev_cx_q610_210 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_210 \
    op interface \
    ports { prev_cx_q610_210 { O 16 vector } prev_cx_q610_210_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1424 \
    name prev_cx_q610_211 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_211 \
    op interface \
    ports { prev_cx_q610_211 { O 16 vector } prev_cx_q610_211_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1425 \
    name prev_cx_q610_212 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_212 \
    op interface \
    ports { prev_cx_q610_212 { O 16 vector } prev_cx_q610_212_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1426 \
    name prev_cx_q610_213 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_213 \
    op interface \
    ports { prev_cx_q610_213 { O 16 vector } prev_cx_q610_213_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1427 \
    name prev_cx_q610_214 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_214 \
    op interface \
    ports { prev_cx_q610_214 { O 16 vector } prev_cx_q610_214_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1428 \
    name prev_cx_q610_215 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_215 \
    op interface \
    ports { prev_cx_q610_215 { O 16 vector } prev_cx_q610_215_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1429 \
    name prev_cx_q610_216 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_216 \
    op interface \
    ports { prev_cx_q610_216 { O 16 vector } prev_cx_q610_216_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1430 \
    name prev_cx_q610_217 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_217 \
    op interface \
    ports { prev_cx_q610_217 { O 16 vector } prev_cx_q610_217_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1431 \
    name prev_cx_q610_218 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_218 \
    op interface \
    ports { prev_cx_q610_218 { O 16 vector } prev_cx_q610_218_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1432 \
    name prev_cx_q610_219 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_219 \
    op interface \
    ports { prev_cx_q610_219 { O 16 vector } prev_cx_q610_219_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1433 \
    name prev_cx_q610_220 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_220 \
    op interface \
    ports { prev_cx_q610_220 { O 16 vector } prev_cx_q610_220_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1434 \
    name prev_cx_q610_221 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_221 \
    op interface \
    ports { prev_cx_q610_221 { O 16 vector } prev_cx_q610_221_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1435 \
    name prev_cx_q610_222 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_222 \
    op interface \
    ports { prev_cx_q610_222 { O 16 vector } prev_cx_q610_222_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1436 \
    name prev_cx_q610_223 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_223 \
    op interface \
    ports { prev_cx_q610_223 { O 16 vector } prev_cx_q610_223_ap_vld { O 1 bit } } \
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



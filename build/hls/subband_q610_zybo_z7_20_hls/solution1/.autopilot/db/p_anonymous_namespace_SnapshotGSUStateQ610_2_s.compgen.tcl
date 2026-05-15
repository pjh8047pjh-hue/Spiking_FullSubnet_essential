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
    id 633 \
    name hx_state_q610_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename hx_state_q610_0 \
    op interface \
    ports { hx_state_q610_0_address0 { O 10 vector } hx_state_q610_0_ce0 { O 1 bit } hx_state_q610_0_q0 { I 11 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hx_state_q610_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 635 \
    name hx_state_q610_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename hx_state_q610_1 \
    op interface \
    ports { hx_state_q610_1_address0 { O 10 vector } hx_state_q610_1_ce0 { O 1 bit } hx_state_q610_1_q0 { I 11 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hx_state_q610_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 637 \
    name cx_state_q610_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename cx_state_q610_0 \
    op interface \
    ports { cx_state_q610_0_address0 { O 10 vector } cx_state_q610_0_ce0 { O 1 bit } cx_state_q610_0_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'cx_state_q610_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 639 \
    name cx_state_q610_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename cx_state_q610_1 \
    op interface \
    ports { cx_state_q610_1_address0 { O 10 vector } cx_state_q610_1_ce0 { O 1 bit } cx_state_q610_1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'cx_state_q610_1'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 634 \
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
    id 636 \
    name hx_state_q610_1_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_hx_state_q610_1_offset \
    op interface \
    ports { hx_state_q610_1_offset { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 638 \
    name cx_state_q610_0_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cx_state_q610_0_offset \
    op interface \
    ports { cx_state_q610_0_offset { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 640 \
    name cx_state_q610_1_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cx_state_q610_1_offset \
    op interface \
    ports { cx_state_q610_1_offset { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 641 \
    name prev_hx_q610_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_0 \
    op interface \
    ports { prev_hx_q610_0 { O 11 vector } prev_hx_q610_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 642 \
    name prev_hx_q610_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_1 \
    op interface \
    ports { prev_hx_q610_1 { O 11 vector } prev_hx_q610_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 643 \
    name prev_hx_q610_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_2 \
    op interface \
    ports { prev_hx_q610_2 { O 11 vector } prev_hx_q610_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 644 \
    name prev_hx_q610_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_3 \
    op interface \
    ports { prev_hx_q610_3 { O 11 vector } prev_hx_q610_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 645 \
    name prev_hx_q610_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_4 \
    op interface \
    ports { prev_hx_q610_4 { O 11 vector } prev_hx_q610_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 646 \
    name prev_hx_q610_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_5 \
    op interface \
    ports { prev_hx_q610_5 { O 11 vector } prev_hx_q610_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 647 \
    name prev_hx_q610_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_6 \
    op interface \
    ports { prev_hx_q610_6 { O 11 vector } prev_hx_q610_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 648 \
    name prev_hx_q610_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_7 \
    op interface \
    ports { prev_hx_q610_7 { O 11 vector } prev_hx_q610_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 649 \
    name prev_hx_q610_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_8 \
    op interface \
    ports { prev_hx_q610_8 { O 11 vector } prev_hx_q610_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 650 \
    name prev_hx_q610_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_9 \
    op interface \
    ports { prev_hx_q610_9 { O 11 vector } prev_hx_q610_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 651 \
    name prev_hx_q610_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_10 \
    op interface \
    ports { prev_hx_q610_10 { O 11 vector } prev_hx_q610_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 652 \
    name prev_hx_q610_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_11 \
    op interface \
    ports { prev_hx_q610_11 { O 11 vector } prev_hx_q610_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 653 \
    name prev_hx_q610_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_12 \
    op interface \
    ports { prev_hx_q610_12 { O 11 vector } prev_hx_q610_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 654 \
    name prev_hx_q610_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_13 \
    op interface \
    ports { prev_hx_q610_13 { O 11 vector } prev_hx_q610_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 655 \
    name prev_hx_q610_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_14 \
    op interface \
    ports { prev_hx_q610_14 { O 11 vector } prev_hx_q610_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 656 \
    name prev_hx_q610_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_15 \
    op interface \
    ports { prev_hx_q610_15 { O 11 vector } prev_hx_q610_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 657 \
    name prev_hx_q610_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_16 \
    op interface \
    ports { prev_hx_q610_16 { O 11 vector } prev_hx_q610_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 658 \
    name prev_hx_q610_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_17 \
    op interface \
    ports { prev_hx_q610_17 { O 11 vector } prev_hx_q610_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 659 \
    name prev_hx_q610_18 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_18 \
    op interface \
    ports { prev_hx_q610_18 { O 11 vector } prev_hx_q610_18_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 660 \
    name prev_hx_q610_19 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_19 \
    op interface \
    ports { prev_hx_q610_19 { O 11 vector } prev_hx_q610_19_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 661 \
    name prev_hx_q610_20 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_20 \
    op interface \
    ports { prev_hx_q610_20 { O 11 vector } prev_hx_q610_20_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 662 \
    name prev_hx_q610_21 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_21 \
    op interface \
    ports { prev_hx_q610_21 { O 11 vector } prev_hx_q610_21_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 663 \
    name prev_hx_q610_22 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_22 \
    op interface \
    ports { prev_hx_q610_22 { O 11 vector } prev_hx_q610_22_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 664 \
    name prev_hx_q610_23 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_23 \
    op interface \
    ports { prev_hx_q610_23 { O 11 vector } prev_hx_q610_23_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 665 \
    name prev_hx_q610_24 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_24 \
    op interface \
    ports { prev_hx_q610_24 { O 11 vector } prev_hx_q610_24_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 666 \
    name prev_hx_q610_25 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_25 \
    op interface \
    ports { prev_hx_q610_25 { O 11 vector } prev_hx_q610_25_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 667 \
    name prev_hx_q610_26 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_26 \
    op interface \
    ports { prev_hx_q610_26 { O 11 vector } prev_hx_q610_26_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 668 \
    name prev_hx_q610_27 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_27 \
    op interface \
    ports { prev_hx_q610_27 { O 11 vector } prev_hx_q610_27_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 669 \
    name prev_hx_q610_28 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_28 \
    op interface \
    ports { prev_hx_q610_28 { O 11 vector } prev_hx_q610_28_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 670 \
    name prev_hx_q610_29 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_29 \
    op interface \
    ports { prev_hx_q610_29 { O 11 vector } prev_hx_q610_29_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 671 \
    name prev_hx_q610_30 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_30 \
    op interface \
    ports { prev_hx_q610_30 { O 11 vector } prev_hx_q610_30_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 672 \
    name prev_hx_q610_31 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_31 \
    op interface \
    ports { prev_hx_q610_31 { O 11 vector } prev_hx_q610_31_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 673 \
    name prev_hx_q610_32 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_32 \
    op interface \
    ports { prev_hx_q610_32 { O 11 vector } prev_hx_q610_32_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 674 \
    name prev_hx_q610_33 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_33 \
    op interface \
    ports { prev_hx_q610_33 { O 11 vector } prev_hx_q610_33_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 675 \
    name prev_hx_q610_34 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_34 \
    op interface \
    ports { prev_hx_q610_34 { O 11 vector } prev_hx_q610_34_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 676 \
    name prev_hx_q610_35 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_35 \
    op interface \
    ports { prev_hx_q610_35 { O 11 vector } prev_hx_q610_35_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 677 \
    name prev_hx_q610_36 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_36 \
    op interface \
    ports { prev_hx_q610_36 { O 11 vector } prev_hx_q610_36_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 678 \
    name prev_hx_q610_37 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_37 \
    op interface \
    ports { prev_hx_q610_37 { O 11 vector } prev_hx_q610_37_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 679 \
    name prev_hx_q610_38 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_38 \
    op interface \
    ports { prev_hx_q610_38 { O 11 vector } prev_hx_q610_38_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 680 \
    name prev_hx_q610_39 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_39 \
    op interface \
    ports { prev_hx_q610_39 { O 11 vector } prev_hx_q610_39_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 681 \
    name prev_hx_q610_40 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_40 \
    op interface \
    ports { prev_hx_q610_40 { O 11 vector } prev_hx_q610_40_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 682 \
    name prev_hx_q610_41 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_41 \
    op interface \
    ports { prev_hx_q610_41 { O 11 vector } prev_hx_q610_41_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 683 \
    name prev_hx_q610_42 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_42 \
    op interface \
    ports { prev_hx_q610_42 { O 11 vector } prev_hx_q610_42_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 684 \
    name prev_hx_q610_43 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_43 \
    op interface \
    ports { prev_hx_q610_43 { O 11 vector } prev_hx_q610_43_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 685 \
    name prev_hx_q610_44 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_44 \
    op interface \
    ports { prev_hx_q610_44 { O 11 vector } prev_hx_q610_44_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 686 \
    name prev_hx_q610_45 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_45 \
    op interface \
    ports { prev_hx_q610_45 { O 11 vector } prev_hx_q610_45_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 687 \
    name prev_hx_q610_46 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_46 \
    op interface \
    ports { prev_hx_q610_46 { O 11 vector } prev_hx_q610_46_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 688 \
    name prev_hx_q610_47 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_47 \
    op interface \
    ports { prev_hx_q610_47 { O 11 vector } prev_hx_q610_47_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 689 \
    name prev_hx_q610_48 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_48 \
    op interface \
    ports { prev_hx_q610_48 { O 11 vector } prev_hx_q610_48_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 690 \
    name prev_hx_q610_49 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_49 \
    op interface \
    ports { prev_hx_q610_49 { O 11 vector } prev_hx_q610_49_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 691 \
    name prev_hx_q610_50 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_50 \
    op interface \
    ports { prev_hx_q610_50 { O 11 vector } prev_hx_q610_50_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 692 \
    name prev_hx_q610_51 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_51 \
    op interface \
    ports { prev_hx_q610_51 { O 11 vector } prev_hx_q610_51_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 693 \
    name prev_hx_q610_52 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_52 \
    op interface \
    ports { prev_hx_q610_52 { O 11 vector } prev_hx_q610_52_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 694 \
    name prev_hx_q610_53 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_53 \
    op interface \
    ports { prev_hx_q610_53 { O 11 vector } prev_hx_q610_53_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 695 \
    name prev_hx_q610_54 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_54 \
    op interface \
    ports { prev_hx_q610_54 { O 11 vector } prev_hx_q610_54_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 696 \
    name prev_hx_q610_55 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_55 \
    op interface \
    ports { prev_hx_q610_55 { O 11 vector } prev_hx_q610_55_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 697 \
    name prev_hx_q610_56 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_56 \
    op interface \
    ports { prev_hx_q610_56 { O 11 vector } prev_hx_q610_56_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 698 \
    name prev_hx_q610_57 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_57 \
    op interface \
    ports { prev_hx_q610_57 { O 11 vector } prev_hx_q610_57_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 699 \
    name prev_hx_q610_58 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_58 \
    op interface \
    ports { prev_hx_q610_58 { O 11 vector } prev_hx_q610_58_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 700 \
    name prev_hx_q610_59 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_59 \
    op interface \
    ports { prev_hx_q610_59 { O 11 vector } prev_hx_q610_59_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 701 \
    name prev_hx_q610_60 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_60 \
    op interface \
    ports { prev_hx_q610_60 { O 11 vector } prev_hx_q610_60_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 702 \
    name prev_hx_q610_61 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_61 \
    op interface \
    ports { prev_hx_q610_61 { O 11 vector } prev_hx_q610_61_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 703 \
    name prev_hx_q610_62 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_62 \
    op interface \
    ports { prev_hx_q610_62 { O 11 vector } prev_hx_q610_62_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 704 \
    name prev_hx_q610_63 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_63 \
    op interface \
    ports { prev_hx_q610_63 { O 11 vector } prev_hx_q610_63_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 705 \
    name prev_hx_q610_64 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_64 \
    op interface \
    ports { prev_hx_q610_64 { O 11 vector } prev_hx_q610_64_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 706 \
    name prev_hx_q610_65 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_65 \
    op interface \
    ports { prev_hx_q610_65 { O 11 vector } prev_hx_q610_65_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 707 \
    name prev_hx_q610_66 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_66 \
    op interface \
    ports { prev_hx_q610_66 { O 11 vector } prev_hx_q610_66_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 708 \
    name prev_hx_q610_67 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_67 \
    op interface \
    ports { prev_hx_q610_67 { O 11 vector } prev_hx_q610_67_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 709 \
    name prev_hx_q610_68 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_68 \
    op interface \
    ports { prev_hx_q610_68 { O 11 vector } prev_hx_q610_68_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 710 \
    name prev_hx_q610_69 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_69 \
    op interface \
    ports { prev_hx_q610_69 { O 11 vector } prev_hx_q610_69_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 711 \
    name prev_hx_q610_70 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_70 \
    op interface \
    ports { prev_hx_q610_70 { O 11 vector } prev_hx_q610_70_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 712 \
    name prev_hx_q610_71 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_71 \
    op interface \
    ports { prev_hx_q610_71 { O 11 vector } prev_hx_q610_71_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 713 \
    name prev_hx_q610_72 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_72 \
    op interface \
    ports { prev_hx_q610_72 { O 11 vector } prev_hx_q610_72_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 714 \
    name prev_hx_q610_73 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_73 \
    op interface \
    ports { prev_hx_q610_73 { O 11 vector } prev_hx_q610_73_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 715 \
    name prev_hx_q610_74 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_74 \
    op interface \
    ports { prev_hx_q610_74 { O 11 vector } prev_hx_q610_74_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 716 \
    name prev_hx_q610_75 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_75 \
    op interface \
    ports { prev_hx_q610_75 { O 11 vector } prev_hx_q610_75_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 717 \
    name prev_hx_q610_76 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_76 \
    op interface \
    ports { prev_hx_q610_76 { O 11 vector } prev_hx_q610_76_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 718 \
    name prev_hx_q610_77 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_77 \
    op interface \
    ports { prev_hx_q610_77 { O 11 vector } prev_hx_q610_77_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 719 \
    name prev_hx_q610_78 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_78 \
    op interface \
    ports { prev_hx_q610_78 { O 11 vector } prev_hx_q610_78_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 720 \
    name prev_hx_q610_79 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_79 \
    op interface \
    ports { prev_hx_q610_79 { O 11 vector } prev_hx_q610_79_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 721 \
    name prev_hx_q610_80 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_80 \
    op interface \
    ports { prev_hx_q610_80 { O 11 vector } prev_hx_q610_80_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 722 \
    name prev_hx_q610_81 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_81 \
    op interface \
    ports { prev_hx_q610_81 { O 11 vector } prev_hx_q610_81_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 723 \
    name prev_hx_q610_82 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_82 \
    op interface \
    ports { prev_hx_q610_82 { O 11 vector } prev_hx_q610_82_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 724 \
    name prev_hx_q610_83 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_83 \
    op interface \
    ports { prev_hx_q610_83 { O 11 vector } prev_hx_q610_83_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 725 \
    name prev_hx_q610_84 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_84 \
    op interface \
    ports { prev_hx_q610_84 { O 11 vector } prev_hx_q610_84_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 726 \
    name prev_hx_q610_85 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_85 \
    op interface \
    ports { prev_hx_q610_85 { O 11 vector } prev_hx_q610_85_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 727 \
    name prev_hx_q610_86 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_86 \
    op interface \
    ports { prev_hx_q610_86 { O 11 vector } prev_hx_q610_86_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 728 \
    name prev_hx_q610_87 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_87 \
    op interface \
    ports { prev_hx_q610_87 { O 11 vector } prev_hx_q610_87_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 729 \
    name prev_hx_q610_88 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_88 \
    op interface \
    ports { prev_hx_q610_88 { O 11 vector } prev_hx_q610_88_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 730 \
    name prev_hx_q610_89 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_89 \
    op interface \
    ports { prev_hx_q610_89 { O 11 vector } prev_hx_q610_89_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 731 \
    name prev_hx_q610_90 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_90 \
    op interface \
    ports { prev_hx_q610_90 { O 11 vector } prev_hx_q610_90_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 732 \
    name prev_hx_q610_91 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_91 \
    op interface \
    ports { prev_hx_q610_91 { O 11 vector } prev_hx_q610_91_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 733 \
    name prev_hx_q610_92 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_92 \
    op interface \
    ports { prev_hx_q610_92 { O 11 vector } prev_hx_q610_92_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 734 \
    name prev_hx_q610_93 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_93 \
    op interface \
    ports { prev_hx_q610_93 { O 11 vector } prev_hx_q610_93_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 735 \
    name prev_hx_q610_94 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_94 \
    op interface \
    ports { prev_hx_q610_94 { O 11 vector } prev_hx_q610_94_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 736 \
    name prev_hx_q610_95 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_95 \
    op interface \
    ports { prev_hx_q610_95 { O 11 vector } prev_hx_q610_95_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 737 \
    name prev_hx_q610_96 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_96 \
    op interface \
    ports { prev_hx_q610_96 { O 11 vector } prev_hx_q610_96_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 738 \
    name prev_hx_q610_97 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_97 \
    op interface \
    ports { prev_hx_q610_97 { O 11 vector } prev_hx_q610_97_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 739 \
    name prev_hx_q610_98 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_98 \
    op interface \
    ports { prev_hx_q610_98 { O 11 vector } prev_hx_q610_98_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 740 \
    name prev_hx_q610_99 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_99 \
    op interface \
    ports { prev_hx_q610_99 { O 11 vector } prev_hx_q610_99_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 741 \
    name prev_hx_q610_100 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_100 \
    op interface \
    ports { prev_hx_q610_100 { O 11 vector } prev_hx_q610_100_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 742 \
    name prev_hx_q610_101 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_101 \
    op interface \
    ports { prev_hx_q610_101 { O 11 vector } prev_hx_q610_101_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 743 \
    name prev_hx_q610_102 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_102 \
    op interface \
    ports { prev_hx_q610_102 { O 11 vector } prev_hx_q610_102_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 744 \
    name prev_hx_q610_103 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_103 \
    op interface \
    ports { prev_hx_q610_103 { O 11 vector } prev_hx_q610_103_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 745 \
    name prev_hx_q610_104 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_104 \
    op interface \
    ports { prev_hx_q610_104 { O 11 vector } prev_hx_q610_104_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 746 \
    name prev_hx_q610_105 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_105 \
    op interface \
    ports { prev_hx_q610_105 { O 11 vector } prev_hx_q610_105_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 747 \
    name prev_hx_q610_106 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_106 \
    op interface \
    ports { prev_hx_q610_106 { O 11 vector } prev_hx_q610_106_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 748 \
    name prev_hx_q610_107 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_107 \
    op interface \
    ports { prev_hx_q610_107 { O 11 vector } prev_hx_q610_107_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 749 \
    name prev_hx_q610_108 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_108 \
    op interface \
    ports { prev_hx_q610_108 { O 11 vector } prev_hx_q610_108_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 750 \
    name prev_hx_q610_109 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_109 \
    op interface \
    ports { prev_hx_q610_109 { O 11 vector } prev_hx_q610_109_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 751 \
    name prev_hx_q610_110 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_110 \
    op interface \
    ports { prev_hx_q610_110 { O 11 vector } prev_hx_q610_110_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 752 \
    name prev_hx_q610_111 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_111 \
    op interface \
    ports { prev_hx_q610_111 { O 11 vector } prev_hx_q610_111_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 753 \
    name prev_hx_q610_112 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_112 \
    op interface \
    ports { prev_hx_q610_112 { O 11 vector } prev_hx_q610_112_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 754 \
    name prev_hx_q610_113 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_113 \
    op interface \
    ports { prev_hx_q610_113 { O 11 vector } prev_hx_q610_113_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 755 \
    name prev_hx_q610_114 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_114 \
    op interface \
    ports { prev_hx_q610_114 { O 11 vector } prev_hx_q610_114_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 756 \
    name prev_hx_q610_115 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_115 \
    op interface \
    ports { prev_hx_q610_115 { O 11 vector } prev_hx_q610_115_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 757 \
    name prev_hx_q610_116 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_116 \
    op interface \
    ports { prev_hx_q610_116 { O 11 vector } prev_hx_q610_116_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 758 \
    name prev_hx_q610_117 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_117 \
    op interface \
    ports { prev_hx_q610_117 { O 11 vector } prev_hx_q610_117_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 759 \
    name prev_hx_q610_118 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_118 \
    op interface \
    ports { prev_hx_q610_118 { O 11 vector } prev_hx_q610_118_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 760 \
    name prev_hx_q610_119 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_119 \
    op interface \
    ports { prev_hx_q610_119 { O 11 vector } prev_hx_q610_119_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 761 \
    name prev_hx_q610_120 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_120 \
    op interface \
    ports { prev_hx_q610_120 { O 11 vector } prev_hx_q610_120_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 762 \
    name prev_hx_q610_121 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_121 \
    op interface \
    ports { prev_hx_q610_121 { O 11 vector } prev_hx_q610_121_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 763 \
    name prev_hx_q610_122 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_122 \
    op interface \
    ports { prev_hx_q610_122 { O 11 vector } prev_hx_q610_122_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 764 \
    name prev_hx_q610_123 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_123 \
    op interface \
    ports { prev_hx_q610_123 { O 11 vector } prev_hx_q610_123_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 765 \
    name prev_hx_q610_124 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_124 \
    op interface \
    ports { prev_hx_q610_124 { O 11 vector } prev_hx_q610_124_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 766 \
    name prev_hx_q610_125 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_125 \
    op interface \
    ports { prev_hx_q610_125 { O 11 vector } prev_hx_q610_125_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 767 \
    name prev_hx_q610_126 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_126 \
    op interface \
    ports { prev_hx_q610_126 { O 11 vector } prev_hx_q610_126_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 768 \
    name prev_hx_q610_127 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_127 \
    op interface \
    ports { prev_hx_q610_127 { O 11 vector } prev_hx_q610_127_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 769 \
    name prev_hx_q610_128 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_128 \
    op interface \
    ports { prev_hx_q610_128 { O 11 vector } prev_hx_q610_128_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 770 \
    name prev_hx_q610_129 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_129 \
    op interface \
    ports { prev_hx_q610_129 { O 11 vector } prev_hx_q610_129_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 771 \
    name prev_hx_q610_130 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_130 \
    op interface \
    ports { prev_hx_q610_130 { O 11 vector } prev_hx_q610_130_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 772 \
    name prev_hx_q610_131 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_131 \
    op interface \
    ports { prev_hx_q610_131 { O 11 vector } prev_hx_q610_131_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 773 \
    name prev_hx_q610_132 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_132 \
    op interface \
    ports { prev_hx_q610_132 { O 11 vector } prev_hx_q610_132_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 774 \
    name prev_hx_q610_133 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_133 \
    op interface \
    ports { prev_hx_q610_133 { O 11 vector } prev_hx_q610_133_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 775 \
    name prev_hx_q610_134 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_134 \
    op interface \
    ports { prev_hx_q610_134 { O 11 vector } prev_hx_q610_134_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 776 \
    name prev_hx_q610_135 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_135 \
    op interface \
    ports { prev_hx_q610_135 { O 11 vector } prev_hx_q610_135_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 777 \
    name prev_hx_q610_136 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_136 \
    op interface \
    ports { prev_hx_q610_136 { O 11 vector } prev_hx_q610_136_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 778 \
    name prev_hx_q610_137 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_137 \
    op interface \
    ports { prev_hx_q610_137 { O 11 vector } prev_hx_q610_137_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 779 \
    name prev_hx_q610_138 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_138 \
    op interface \
    ports { prev_hx_q610_138 { O 11 vector } prev_hx_q610_138_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 780 \
    name prev_hx_q610_139 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_139 \
    op interface \
    ports { prev_hx_q610_139 { O 11 vector } prev_hx_q610_139_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 781 \
    name prev_hx_q610_140 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_140 \
    op interface \
    ports { prev_hx_q610_140 { O 11 vector } prev_hx_q610_140_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 782 \
    name prev_hx_q610_141 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_141 \
    op interface \
    ports { prev_hx_q610_141 { O 11 vector } prev_hx_q610_141_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 783 \
    name prev_hx_q610_142 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_142 \
    op interface \
    ports { prev_hx_q610_142 { O 11 vector } prev_hx_q610_142_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 784 \
    name prev_hx_q610_143 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_143 \
    op interface \
    ports { prev_hx_q610_143 { O 11 vector } prev_hx_q610_143_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 785 \
    name prev_hx_q610_144 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_144 \
    op interface \
    ports { prev_hx_q610_144 { O 11 vector } prev_hx_q610_144_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 786 \
    name prev_hx_q610_145 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_145 \
    op interface \
    ports { prev_hx_q610_145 { O 11 vector } prev_hx_q610_145_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 787 \
    name prev_hx_q610_146 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_146 \
    op interface \
    ports { prev_hx_q610_146 { O 11 vector } prev_hx_q610_146_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 788 \
    name prev_hx_q610_147 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_147 \
    op interface \
    ports { prev_hx_q610_147 { O 11 vector } prev_hx_q610_147_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 789 \
    name prev_hx_q610_148 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_148 \
    op interface \
    ports { prev_hx_q610_148 { O 11 vector } prev_hx_q610_148_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 790 \
    name prev_hx_q610_149 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_149 \
    op interface \
    ports { prev_hx_q610_149 { O 11 vector } prev_hx_q610_149_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 791 \
    name prev_hx_q610_150 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_150 \
    op interface \
    ports { prev_hx_q610_150 { O 11 vector } prev_hx_q610_150_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 792 \
    name prev_hx_q610_151 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_151 \
    op interface \
    ports { prev_hx_q610_151 { O 11 vector } prev_hx_q610_151_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 793 \
    name prev_hx_q610_152 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_152 \
    op interface \
    ports { prev_hx_q610_152 { O 11 vector } prev_hx_q610_152_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 794 \
    name prev_hx_q610_153 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_153 \
    op interface \
    ports { prev_hx_q610_153 { O 11 vector } prev_hx_q610_153_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 795 \
    name prev_hx_q610_154 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_154 \
    op interface \
    ports { prev_hx_q610_154 { O 11 vector } prev_hx_q610_154_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 796 \
    name prev_hx_q610_155 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_155 \
    op interface \
    ports { prev_hx_q610_155 { O 11 vector } prev_hx_q610_155_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 797 \
    name prev_hx_q610_156 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_156 \
    op interface \
    ports { prev_hx_q610_156 { O 11 vector } prev_hx_q610_156_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 798 \
    name prev_hx_q610_157 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_157 \
    op interface \
    ports { prev_hx_q610_157 { O 11 vector } prev_hx_q610_157_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 799 \
    name prev_hx_q610_158 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_158 \
    op interface \
    ports { prev_hx_q610_158 { O 11 vector } prev_hx_q610_158_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 800 \
    name prev_hx_q610_159 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_159 \
    op interface \
    ports { prev_hx_q610_159 { O 11 vector } prev_hx_q610_159_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 801 \
    name prev_hx_q610_160 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_160 \
    op interface \
    ports { prev_hx_q610_160 { O 11 vector } prev_hx_q610_160_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 802 \
    name prev_hx_q610_161 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_161 \
    op interface \
    ports { prev_hx_q610_161 { O 11 vector } prev_hx_q610_161_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 803 \
    name prev_hx_q610_162 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_162 \
    op interface \
    ports { prev_hx_q610_162 { O 11 vector } prev_hx_q610_162_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 804 \
    name prev_hx_q610_163 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_163 \
    op interface \
    ports { prev_hx_q610_163 { O 11 vector } prev_hx_q610_163_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 805 \
    name prev_hx_q610_164 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_164 \
    op interface \
    ports { prev_hx_q610_164 { O 11 vector } prev_hx_q610_164_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 806 \
    name prev_hx_q610_165 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_165 \
    op interface \
    ports { prev_hx_q610_165 { O 11 vector } prev_hx_q610_165_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 807 \
    name prev_hx_q610_166 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_166 \
    op interface \
    ports { prev_hx_q610_166 { O 11 vector } prev_hx_q610_166_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 808 \
    name prev_hx_q610_167 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_167 \
    op interface \
    ports { prev_hx_q610_167 { O 11 vector } prev_hx_q610_167_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 809 \
    name prev_hx_q610_168 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_168 \
    op interface \
    ports { prev_hx_q610_168 { O 11 vector } prev_hx_q610_168_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 810 \
    name prev_hx_q610_169 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_169 \
    op interface \
    ports { prev_hx_q610_169 { O 11 vector } prev_hx_q610_169_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 811 \
    name prev_hx_q610_170 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_170 \
    op interface \
    ports { prev_hx_q610_170 { O 11 vector } prev_hx_q610_170_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 812 \
    name prev_hx_q610_171 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_171 \
    op interface \
    ports { prev_hx_q610_171 { O 11 vector } prev_hx_q610_171_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 813 \
    name prev_hx_q610_172 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_172 \
    op interface \
    ports { prev_hx_q610_172 { O 11 vector } prev_hx_q610_172_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 814 \
    name prev_hx_q610_173 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_173 \
    op interface \
    ports { prev_hx_q610_173 { O 11 vector } prev_hx_q610_173_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 815 \
    name prev_hx_q610_174 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_174 \
    op interface \
    ports { prev_hx_q610_174 { O 11 vector } prev_hx_q610_174_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 816 \
    name prev_hx_q610_175 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_175 \
    op interface \
    ports { prev_hx_q610_175 { O 11 vector } prev_hx_q610_175_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 817 \
    name prev_hx_q610_176 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_176 \
    op interface \
    ports { prev_hx_q610_176 { O 11 vector } prev_hx_q610_176_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 818 \
    name prev_hx_q610_177 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_177 \
    op interface \
    ports { prev_hx_q610_177 { O 11 vector } prev_hx_q610_177_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 819 \
    name prev_hx_q610_178 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_178 \
    op interface \
    ports { prev_hx_q610_178 { O 11 vector } prev_hx_q610_178_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 820 \
    name prev_hx_q610_179 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_179 \
    op interface \
    ports { prev_hx_q610_179 { O 11 vector } prev_hx_q610_179_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 821 \
    name prev_hx_q610_180 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_180 \
    op interface \
    ports { prev_hx_q610_180 { O 11 vector } prev_hx_q610_180_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 822 \
    name prev_hx_q610_181 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_181 \
    op interface \
    ports { prev_hx_q610_181 { O 11 vector } prev_hx_q610_181_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 823 \
    name prev_hx_q610_182 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_182 \
    op interface \
    ports { prev_hx_q610_182 { O 11 vector } prev_hx_q610_182_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 824 \
    name prev_hx_q610_183 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_183 \
    op interface \
    ports { prev_hx_q610_183 { O 11 vector } prev_hx_q610_183_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 825 \
    name prev_hx_q610_184 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_184 \
    op interface \
    ports { prev_hx_q610_184 { O 11 vector } prev_hx_q610_184_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 826 \
    name prev_hx_q610_185 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_185 \
    op interface \
    ports { prev_hx_q610_185 { O 11 vector } prev_hx_q610_185_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 827 \
    name prev_hx_q610_186 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_186 \
    op interface \
    ports { prev_hx_q610_186 { O 11 vector } prev_hx_q610_186_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 828 \
    name prev_hx_q610_187 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_187 \
    op interface \
    ports { prev_hx_q610_187 { O 11 vector } prev_hx_q610_187_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 829 \
    name prev_hx_q610_188 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_188 \
    op interface \
    ports { prev_hx_q610_188 { O 11 vector } prev_hx_q610_188_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 830 \
    name prev_hx_q610_189 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_189 \
    op interface \
    ports { prev_hx_q610_189 { O 11 vector } prev_hx_q610_189_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 831 \
    name prev_hx_q610_190 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_190 \
    op interface \
    ports { prev_hx_q610_190 { O 11 vector } prev_hx_q610_190_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 832 \
    name prev_hx_q610_191 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_191 \
    op interface \
    ports { prev_hx_q610_191 { O 11 vector } prev_hx_q610_191_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 833 \
    name prev_hx_q610_192 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_192 \
    op interface \
    ports { prev_hx_q610_192 { O 11 vector } prev_hx_q610_192_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 834 \
    name prev_hx_q610_193 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_193 \
    op interface \
    ports { prev_hx_q610_193 { O 11 vector } prev_hx_q610_193_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 835 \
    name prev_hx_q610_194 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_194 \
    op interface \
    ports { prev_hx_q610_194 { O 11 vector } prev_hx_q610_194_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 836 \
    name prev_hx_q610_195 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_195 \
    op interface \
    ports { prev_hx_q610_195 { O 11 vector } prev_hx_q610_195_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 837 \
    name prev_hx_q610_196 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_196 \
    op interface \
    ports { prev_hx_q610_196 { O 11 vector } prev_hx_q610_196_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 838 \
    name prev_hx_q610_197 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_197 \
    op interface \
    ports { prev_hx_q610_197 { O 11 vector } prev_hx_q610_197_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 839 \
    name prev_hx_q610_198 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_198 \
    op interface \
    ports { prev_hx_q610_198 { O 11 vector } prev_hx_q610_198_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 840 \
    name prev_hx_q610_199 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_199 \
    op interface \
    ports { prev_hx_q610_199 { O 11 vector } prev_hx_q610_199_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 841 \
    name prev_hx_q610_200 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_200 \
    op interface \
    ports { prev_hx_q610_200 { O 11 vector } prev_hx_q610_200_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 842 \
    name prev_hx_q610_201 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_201 \
    op interface \
    ports { prev_hx_q610_201 { O 11 vector } prev_hx_q610_201_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 843 \
    name prev_hx_q610_202 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_202 \
    op interface \
    ports { prev_hx_q610_202 { O 11 vector } prev_hx_q610_202_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 844 \
    name prev_hx_q610_203 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_203 \
    op interface \
    ports { prev_hx_q610_203 { O 11 vector } prev_hx_q610_203_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 845 \
    name prev_hx_q610_204 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_204 \
    op interface \
    ports { prev_hx_q610_204 { O 11 vector } prev_hx_q610_204_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 846 \
    name prev_hx_q610_205 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_205 \
    op interface \
    ports { prev_hx_q610_205 { O 11 vector } prev_hx_q610_205_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 847 \
    name prev_hx_q610_206 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_206 \
    op interface \
    ports { prev_hx_q610_206 { O 11 vector } prev_hx_q610_206_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 848 \
    name prev_hx_q610_207 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_207 \
    op interface \
    ports { prev_hx_q610_207 { O 11 vector } prev_hx_q610_207_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 849 \
    name prev_hx_q610_208 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_208 \
    op interface \
    ports { prev_hx_q610_208 { O 11 vector } prev_hx_q610_208_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 850 \
    name prev_hx_q610_209 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_209 \
    op interface \
    ports { prev_hx_q610_209 { O 11 vector } prev_hx_q610_209_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 851 \
    name prev_hx_q610_210 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_210 \
    op interface \
    ports { prev_hx_q610_210 { O 11 vector } prev_hx_q610_210_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 852 \
    name prev_hx_q610_211 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_211 \
    op interface \
    ports { prev_hx_q610_211 { O 11 vector } prev_hx_q610_211_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 853 \
    name prev_hx_q610_212 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_212 \
    op interface \
    ports { prev_hx_q610_212 { O 11 vector } prev_hx_q610_212_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 854 \
    name prev_hx_q610_213 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_213 \
    op interface \
    ports { prev_hx_q610_213 { O 11 vector } prev_hx_q610_213_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 855 \
    name prev_hx_q610_214 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_214 \
    op interface \
    ports { prev_hx_q610_214 { O 11 vector } prev_hx_q610_214_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 856 \
    name prev_hx_q610_215 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_215 \
    op interface \
    ports { prev_hx_q610_215 { O 11 vector } prev_hx_q610_215_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 857 \
    name prev_hx_q610_216 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_216 \
    op interface \
    ports { prev_hx_q610_216 { O 11 vector } prev_hx_q610_216_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 858 \
    name prev_hx_q610_217 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_217 \
    op interface \
    ports { prev_hx_q610_217 { O 11 vector } prev_hx_q610_217_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 859 \
    name prev_hx_q610_218 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_218 \
    op interface \
    ports { prev_hx_q610_218 { O 11 vector } prev_hx_q610_218_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 860 \
    name prev_hx_q610_219 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_219 \
    op interface \
    ports { prev_hx_q610_219 { O 11 vector } prev_hx_q610_219_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 861 \
    name prev_hx_q610_220 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_220 \
    op interface \
    ports { prev_hx_q610_220 { O 11 vector } prev_hx_q610_220_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 862 \
    name prev_hx_q610_221 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_221 \
    op interface \
    ports { prev_hx_q610_221 { O 11 vector } prev_hx_q610_221_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 863 \
    name prev_hx_q610_222 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_222 \
    op interface \
    ports { prev_hx_q610_222 { O 11 vector } prev_hx_q610_222_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 864 \
    name prev_hx_q610_223 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_223 \
    op interface \
    ports { prev_hx_q610_223 { O 11 vector } prev_hx_q610_223_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 865 \
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
    id 866 \
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
    id 867 \
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
    id 868 \
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
    id 869 \
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
    id 870 \
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
    id 871 \
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
    id 872 \
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
    id 873 \
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
    id 874 \
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
    id 875 \
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
    id 876 \
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
    id 877 \
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
    id 878 \
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
    id 879 \
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
    id 880 \
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
    id 881 \
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
    id 882 \
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
    id 883 \
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
    id 884 \
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
    id 885 \
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
    id 886 \
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
    id 887 \
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
    id 888 \
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
    id 889 \
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
    id 890 \
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
    id 891 \
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
    id 892 \
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
    id 893 \
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
    id 894 \
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
    id 895 \
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
    id 896 \
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
    id 897 \
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
    id 898 \
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
    id 899 \
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
    id 900 \
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
    id 901 \
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
    id 902 \
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
    id 903 \
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
    id 904 \
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
    id 905 \
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
    id 906 \
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
    id 907 \
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
    id 908 \
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
    id 909 \
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
    id 910 \
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
    id 911 \
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
    id 912 \
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
    id 913 \
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
    id 914 \
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
    id 915 \
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
    id 916 \
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
    id 917 \
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
    id 918 \
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
    id 919 \
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
    id 920 \
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
    id 921 \
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
    id 922 \
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
    id 923 \
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
    id 924 \
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
    id 925 \
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
    id 926 \
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
    id 927 \
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
    id 928 \
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
    id 929 \
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
    id 930 \
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
    id 931 \
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
    id 932 \
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
    id 933 \
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
    id 934 \
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
    id 935 \
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
    id 936 \
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
    id 937 \
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
    id 938 \
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
    id 939 \
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
    id 940 \
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
    id 941 \
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
    id 942 \
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
    id 943 \
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
    id 944 \
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
    id 945 \
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
    id 946 \
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
    id 947 \
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
    id 948 \
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
    id 949 \
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
    id 950 \
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
    id 951 \
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
    id 952 \
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
    id 953 \
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
    id 954 \
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
    id 955 \
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
    id 956 \
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
    id 957 \
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
    id 958 \
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
    id 959 \
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
    id 960 \
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
    id 961 \
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
    id 962 \
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
    id 963 \
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
    id 964 \
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
    id 965 \
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
    id 966 \
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
    id 967 \
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
    id 968 \
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
    id 969 \
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
    id 970 \
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
    id 971 \
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
    id 972 \
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
    id 973 \
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
    id 974 \
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
    id 975 \
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
    id 976 \
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
    id 977 \
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
    id 978 \
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
    id 979 \
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
    id 980 \
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
    id 981 \
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
    id 982 \
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
    id 983 \
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
    id 984 \
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
    id 985 \
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
    id 986 \
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
    id 987 \
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
    id 988 \
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
    id 989 \
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
    id 990 \
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
    id 991 \
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
    id 992 \
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
    id 993 \
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
    id 994 \
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
    id 995 \
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
    id 996 \
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
    id 997 \
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
    id 998 \
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
    id 999 \
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
    id 1000 \
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
    id 1001 \
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
    id 1002 \
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
    id 1003 \
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
    id 1004 \
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
    id 1005 \
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
    id 1006 \
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
    id 1007 \
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
    id 1008 \
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
    id 1009 \
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
    id 1010 \
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
    id 1011 \
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
    id 1012 \
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
    id 1013 \
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
    id 1014 \
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
    id 1015 \
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
    id 1016 \
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
    id 1017 \
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
    id 1018 \
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
    id 1019 \
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
    id 1020 \
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
    id 1021 \
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
    id 1022 \
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
    id 1023 \
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
    id 1024 \
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
    id 1025 \
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
    id 1026 \
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
    id 1027 \
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
    id 1028 \
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
    id 1029 \
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
    id 1030 \
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
    id 1031 \
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
    id 1032 \
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
    id 1033 \
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
    id 1034 \
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
    id 1035 \
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
    id 1036 \
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
    id 1037 \
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
    id 1038 \
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
    id 1039 \
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
    id 1040 \
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
    id 1041 \
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
    id 1042 \
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
    id 1043 \
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
    id 1044 \
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
    id 1045 \
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
    id 1046 \
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
    id 1047 \
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
    id 1048 \
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
    id 1049 \
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
    id 1050 \
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
    id 1051 \
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
    id 1052 \
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
    id 1053 \
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
    id 1054 \
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
    id 1055 \
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
    id 1056 \
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
    id 1057 \
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
    id 1058 \
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
    id 1059 \
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
    id 1060 \
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
    id 1061 \
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
    id 1062 \
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
    id 1063 \
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
    id 1064 \
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
    id 1065 \
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
    id 1066 \
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
    id 1067 \
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
    id 1068 \
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
    id 1069 \
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
    id 1070 \
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
    id 1071 \
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
    id 1072 \
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
    id 1073 \
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
    id 1074 \
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
    id 1075 \
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
    id 1076 \
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
    id 1077 \
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
    id 1078 \
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
    id 1079 \
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
    id 1080 \
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
    id 1081 \
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
    id 1082 \
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
    id 1083 \
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
    id 1084 \
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
    id 1085 \
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
    id 1086 \
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
    id 1087 \
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
    id 1088 \
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



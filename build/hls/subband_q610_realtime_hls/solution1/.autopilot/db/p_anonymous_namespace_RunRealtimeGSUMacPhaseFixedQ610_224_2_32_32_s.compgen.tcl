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
    id 2951 \
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
    id 2952 \
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
    id 2953 \
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
    id 2954 \
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


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2727 \
    name input_ptr_0_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_0_val \
    op interface \
    ports { input_ptr_0_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2728 \
    name input_ptr_1_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_1_val \
    op interface \
    ports { input_ptr_1_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2729 \
    name input_ptr_2_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_2_val \
    op interface \
    ports { input_ptr_2_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2730 \
    name input_ptr_3_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_3_val \
    op interface \
    ports { input_ptr_3_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2731 \
    name input_ptr_4_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_4_val \
    op interface \
    ports { input_ptr_4_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2732 \
    name input_ptr_5_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_5_val \
    op interface \
    ports { input_ptr_5_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2733 \
    name input_ptr_6_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_6_val \
    op interface \
    ports { input_ptr_6_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2734 \
    name input_ptr_7_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_7_val \
    op interface \
    ports { input_ptr_7_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2735 \
    name input_ptr_8_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_8_val \
    op interface \
    ports { input_ptr_8_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2736 \
    name input_ptr_9_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_9_val \
    op interface \
    ports { input_ptr_9_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2737 \
    name input_ptr_10_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_10_val \
    op interface \
    ports { input_ptr_10_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2738 \
    name input_ptr_11_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_11_val \
    op interface \
    ports { input_ptr_11_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2739 \
    name input_ptr_12_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_12_val \
    op interface \
    ports { input_ptr_12_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2740 \
    name input_ptr_13_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_13_val \
    op interface \
    ports { input_ptr_13_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2741 \
    name input_ptr_14_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_14_val \
    op interface \
    ports { input_ptr_14_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2742 \
    name input_ptr_15_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_15_val \
    op interface \
    ports { input_ptr_15_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2743 \
    name input_ptr_16_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_16_val \
    op interface \
    ports { input_ptr_16_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2744 \
    name input_ptr_17_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_17_val \
    op interface \
    ports { input_ptr_17_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2745 \
    name input_ptr_18_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_18_val \
    op interface \
    ports { input_ptr_18_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2746 \
    name input_ptr_19_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_19_val \
    op interface \
    ports { input_ptr_19_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2747 \
    name input_ptr_20_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_20_val \
    op interface \
    ports { input_ptr_20_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2748 \
    name input_ptr_21_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_21_val \
    op interface \
    ports { input_ptr_21_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2749 \
    name input_ptr_22_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_22_val \
    op interface \
    ports { input_ptr_22_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2750 \
    name input_ptr_23_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_23_val \
    op interface \
    ports { input_ptr_23_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2751 \
    name input_ptr_24_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_24_val \
    op interface \
    ports { input_ptr_24_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2752 \
    name input_ptr_25_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_25_val \
    op interface \
    ports { input_ptr_25_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2753 \
    name input_ptr_26_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_26_val \
    op interface \
    ports { input_ptr_26_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2754 \
    name input_ptr_27_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_27_val \
    op interface \
    ports { input_ptr_27_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2755 \
    name input_ptr_28_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_28_val \
    op interface \
    ports { input_ptr_28_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2756 \
    name input_ptr_29_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_29_val \
    op interface \
    ports { input_ptr_29_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2757 \
    name input_ptr_30_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_30_val \
    op interface \
    ports { input_ptr_30_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2758 \
    name input_ptr_31_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_31_val \
    op interface \
    ports { input_ptr_31_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2759 \
    name input_ptr_32_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_32_val \
    op interface \
    ports { input_ptr_32_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2760 \
    name input_ptr_33_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_33_val \
    op interface \
    ports { input_ptr_33_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2761 \
    name input_ptr_34_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_34_val \
    op interface \
    ports { input_ptr_34_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2762 \
    name input_ptr_35_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_35_val \
    op interface \
    ports { input_ptr_35_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2763 \
    name input_ptr_36_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_36_val \
    op interface \
    ports { input_ptr_36_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2764 \
    name input_ptr_37_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_37_val \
    op interface \
    ports { input_ptr_37_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2765 \
    name input_ptr_38_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_38_val \
    op interface \
    ports { input_ptr_38_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2766 \
    name input_ptr_39_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_39_val \
    op interface \
    ports { input_ptr_39_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2767 \
    name input_ptr_40_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_40_val \
    op interface \
    ports { input_ptr_40_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2768 \
    name input_ptr_41_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_41_val \
    op interface \
    ports { input_ptr_41_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2769 \
    name input_ptr_42_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_42_val \
    op interface \
    ports { input_ptr_42_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2770 \
    name input_ptr_43_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_43_val \
    op interface \
    ports { input_ptr_43_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2771 \
    name input_ptr_44_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_44_val \
    op interface \
    ports { input_ptr_44_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2772 \
    name input_ptr_45_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_45_val \
    op interface \
    ports { input_ptr_45_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2773 \
    name input_ptr_46_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_46_val \
    op interface \
    ports { input_ptr_46_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2774 \
    name input_ptr_47_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_47_val \
    op interface \
    ports { input_ptr_47_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2775 \
    name input_ptr_48_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_48_val \
    op interface \
    ports { input_ptr_48_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2776 \
    name input_ptr_49_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_49_val \
    op interface \
    ports { input_ptr_49_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2777 \
    name input_ptr_50_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_50_val \
    op interface \
    ports { input_ptr_50_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2778 \
    name input_ptr_51_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_51_val \
    op interface \
    ports { input_ptr_51_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2779 \
    name input_ptr_52_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_52_val \
    op interface \
    ports { input_ptr_52_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2780 \
    name input_ptr_53_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_53_val \
    op interface \
    ports { input_ptr_53_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2781 \
    name input_ptr_54_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_54_val \
    op interface \
    ports { input_ptr_54_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2782 \
    name input_ptr_55_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_55_val \
    op interface \
    ports { input_ptr_55_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2783 \
    name input_ptr_56_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_56_val \
    op interface \
    ports { input_ptr_56_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2784 \
    name input_ptr_57_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_57_val \
    op interface \
    ports { input_ptr_57_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2785 \
    name input_ptr_58_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_58_val \
    op interface \
    ports { input_ptr_58_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2786 \
    name input_ptr_59_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_59_val \
    op interface \
    ports { input_ptr_59_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2787 \
    name input_ptr_60_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_60_val \
    op interface \
    ports { input_ptr_60_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2788 \
    name input_ptr_61_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_61_val \
    op interface \
    ports { input_ptr_61_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2789 \
    name input_ptr_62_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_62_val \
    op interface \
    ports { input_ptr_62_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2790 \
    name input_ptr_63_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_63_val \
    op interface \
    ports { input_ptr_63_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2791 \
    name input_ptr_64_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_64_val \
    op interface \
    ports { input_ptr_64_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2792 \
    name input_ptr_65_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_65_val \
    op interface \
    ports { input_ptr_65_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2793 \
    name input_ptr_66_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_66_val \
    op interface \
    ports { input_ptr_66_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2794 \
    name input_ptr_67_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_67_val \
    op interface \
    ports { input_ptr_67_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2795 \
    name input_ptr_68_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_68_val \
    op interface \
    ports { input_ptr_68_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2796 \
    name input_ptr_69_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_69_val \
    op interface \
    ports { input_ptr_69_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2797 \
    name input_ptr_70_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_70_val \
    op interface \
    ports { input_ptr_70_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2798 \
    name input_ptr_71_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_71_val \
    op interface \
    ports { input_ptr_71_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2799 \
    name input_ptr_72_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_72_val \
    op interface \
    ports { input_ptr_72_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2800 \
    name input_ptr_73_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_73_val \
    op interface \
    ports { input_ptr_73_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2801 \
    name input_ptr_74_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_74_val \
    op interface \
    ports { input_ptr_74_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2802 \
    name input_ptr_75_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_75_val \
    op interface \
    ports { input_ptr_75_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2803 \
    name input_ptr_76_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_76_val \
    op interface \
    ports { input_ptr_76_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2804 \
    name input_ptr_77_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_77_val \
    op interface \
    ports { input_ptr_77_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2805 \
    name input_ptr_78_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_78_val \
    op interface \
    ports { input_ptr_78_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2806 \
    name input_ptr_79_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_79_val \
    op interface \
    ports { input_ptr_79_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2807 \
    name input_ptr_80_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_80_val \
    op interface \
    ports { input_ptr_80_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2808 \
    name input_ptr_81_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_81_val \
    op interface \
    ports { input_ptr_81_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2809 \
    name input_ptr_82_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_82_val \
    op interface \
    ports { input_ptr_82_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2810 \
    name input_ptr_83_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_83_val \
    op interface \
    ports { input_ptr_83_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2811 \
    name input_ptr_84_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_84_val \
    op interface \
    ports { input_ptr_84_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2812 \
    name input_ptr_85_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_85_val \
    op interface \
    ports { input_ptr_85_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2813 \
    name input_ptr_86_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_86_val \
    op interface \
    ports { input_ptr_86_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2814 \
    name input_ptr_87_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_87_val \
    op interface \
    ports { input_ptr_87_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2815 \
    name input_ptr_88_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_88_val \
    op interface \
    ports { input_ptr_88_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2816 \
    name input_ptr_89_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_89_val \
    op interface \
    ports { input_ptr_89_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2817 \
    name input_ptr_90_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_90_val \
    op interface \
    ports { input_ptr_90_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2818 \
    name input_ptr_91_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_91_val \
    op interface \
    ports { input_ptr_91_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2819 \
    name input_ptr_92_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_92_val \
    op interface \
    ports { input_ptr_92_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2820 \
    name input_ptr_93_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_93_val \
    op interface \
    ports { input_ptr_93_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2821 \
    name input_ptr_94_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_94_val \
    op interface \
    ports { input_ptr_94_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2822 \
    name input_ptr_95_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_95_val \
    op interface \
    ports { input_ptr_95_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2823 \
    name input_ptr_96_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_96_val \
    op interface \
    ports { input_ptr_96_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2824 \
    name input_ptr_97_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_97_val \
    op interface \
    ports { input_ptr_97_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2825 \
    name input_ptr_98_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_98_val \
    op interface \
    ports { input_ptr_98_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2826 \
    name input_ptr_99_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_99_val \
    op interface \
    ports { input_ptr_99_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2827 \
    name input_ptr_100_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_100_val \
    op interface \
    ports { input_ptr_100_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2828 \
    name input_ptr_101_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_101_val \
    op interface \
    ports { input_ptr_101_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2829 \
    name input_ptr_102_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_102_val \
    op interface \
    ports { input_ptr_102_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2830 \
    name input_ptr_103_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_103_val \
    op interface \
    ports { input_ptr_103_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2831 \
    name input_ptr_104_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_104_val \
    op interface \
    ports { input_ptr_104_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2832 \
    name input_ptr_105_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_105_val \
    op interface \
    ports { input_ptr_105_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2833 \
    name input_ptr_106_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_106_val \
    op interface \
    ports { input_ptr_106_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2834 \
    name input_ptr_107_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_107_val \
    op interface \
    ports { input_ptr_107_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2835 \
    name input_ptr_108_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_108_val \
    op interface \
    ports { input_ptr_108_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2836 \
    name input_ptr_109_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_109_val \
    op interface \
    ports { input_ptr_109_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2837 \
    name input_ptr_110_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_110_val \
    op interface \
    ports { input_ptr_110_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2838 \
    name input_ptr_111_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_111_val \
    op interface \
    ports { input_ptr_111_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2839 \
    name input_ptr_112_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_112_val \
    op interface \
    ports { input_ptr_112_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2840 \
    name input_ptr_113_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_113_val \
    op interface \
    ports { input_ptr_113_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2841 \
    name input_ptr_114_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_114_val \
    op interface \
    ports { input_ptr_114_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2842 \
    name input_ptr_115_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_115_val \
    op interface \
    ports { input_ptr_115_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2843 \
    name input_ptr_116_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_116_val \
    op interface \
    ports { input_ptr_116_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2844 \
    name input_ptr_117_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_117_val \
    op interface \
    ports { input_ptr_117_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2845 \
    name input_ptr_118_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_118_val \
    op interface \
    ports { input_ptr_118_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2846 \
    name input_ptr_119_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_119_val \
    op interface \
    ports { input_ptr_119_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2847 \
    name input_ptr_120_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_120_val \
    op interface \
    ports { input_ptr_120_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2848 \
    name input_ptr_121_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_121_val \
    op interface \
    ports { input_ptr_121_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2849 \
    name input_ptr_122_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_122_val \
    op interface \
    ports { input_ptr_122_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2850 \
    name input_ptr_123_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_123_val \
    op interface \
    ports { input_ptr_123_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2851 \
    name input_ptr_124_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_124_val \
    op interface \
    ports { input_ptr_124_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2852 \
    name input_ptr_125_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_125_val \
    op interface \
    ports { input_ptr_125_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2853 \
    name input_ptr_126_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_126_val \
    op interface \
    ports { input_ptr_126_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2854 \
    name input_ptr_127_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_127_val \
    op interface \
    ports { input_ptr_127_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2855 \
    name input_ptr_128_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_128_val \
    op interface \
    ports { input_ptr_128_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2856 \
    name input_ptr_129_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_129_val \
    op interface \
    ports { input_ptr_129_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2857 \
    name input_ptr_130_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_130_val \
    op interface \
    ports { input_ptr_130_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2858 \
    name input_ptr_131_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_131_val \
    op interface \
    ports { input_ptr_131_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2859 \
    name input_ptr_132_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_132_val \
    op interface \
    ports { input_ptr_132_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2860 \
    name input_ptr_133_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_133_val \
    op interface \
    ports { input_ptr_133_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2861 \
    name input_ptr_134_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_134_val \
    op interface \
    ports { input_ptr_134_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2862 \
    name input_ptr_135_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_135_val \
    op interface \
    ports { input_ptr_135_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2863 \
    name input_ptr_136_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_136_val \
    op interface \
    ports { input_ptr_136_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2864 \
    name input_ptr_137_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_137_val \
    op interface \
    ports { input_ptr_137_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2865 \
    name input_ptr_138_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_138_val \
    op interface \
    ports { input_ptr_138_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2866 \
    name input_ptr_139_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_139_val \
    op interface \
    ports { input_ptr_139_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2867 \
    name input_ptr_140_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_140_val \
    op interface \
    ports { input_ptr_140_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2868 \
    name input_ptr_141_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_141_val \
    op interface \
    ports { input_ptr_141_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2869 \
    name input_ptr_142_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_142_val \
    op interface \
    ports { input_ptr_142_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2870 \
    name input_ptr_143_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_143_val \
    op interface \
    ports { input_ptr_143_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2871 \
    name input_ptr_144_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_144_val \
    op interface \
    ports { input_ptr_144_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2872 \
    name input_ptr_145_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_145_val \
    op interface \
    ports { input_ptr_145_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2873 \
    name input_ptr_146_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_146_val \
    op interface \
    ports { input_ptr_146_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2874 \
    name input_ptr_147_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_147_val \
    op interface \
    ports { input_ptr_147_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2875 \
    name input_ptr_148_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_148_val \
    op interface \
    ports { input_ptr_148_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2876 \
    name input_ptr_149_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_149_val \
    op interface \
    ports { input_ptr_149_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2877 \
    name input_ptr_150_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_150_val \
    op interface \
    ports { input_ptr_150_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2878 \
    name input_ptr_151_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_151_val \
    op interface \
    ports { input_ptr_151_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2879 \
    name input_ptr_152_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_152_val \
    op interface \
    ports { input_ptr_152_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2880 \
    name input_ptr_153_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_153_val \
    op interface \
    ports { input_ptr_153_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2881 \
    name input_ptr_154_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_154_val \
    op interface \
    ports { input_ptr_154_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2882 \
    name input_ptr_155_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_155_val \
    op interface \
    ports { input_ptr_155_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2883 \
    name input_ptr_156_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_156_val \
    op interface \
    ports { input_ptr_156_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2884 \
    name input_ptr_157_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_157_val \
    op interface \
    ports { input_ptr_157_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2885 \
    name input_ptr_158_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_158_val \
    op interface \
    ports { input_ptr_158_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2886 \
    name input_ptr_159_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_159_val \
    op interface \
    ports { input_ptr_159_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2887 \
    name input_ptr_160_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_160_val \
    op interface \
    ports { input_ptr_160_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2888 \
    name input_ptr_161_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_161_val \
    op interface \
    ports { input_ptr_161_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2889 \
    name input_ptr_162_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_162_val \
    op interface \
    ports { input_ptr_162_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2890 \
    name input_ptr_163_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_163_val \
    op interface \
    ports { input_ptr_163_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2891 \
    name input_ptr_164_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_164_val \
    op interface \
    ports { input_ptr_164_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2892 \
    name input_ptr_165_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_165_val \
    op interface \
    ports { input_ptr_165_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2893 \
    name input_ptr_166_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_166_val \
    op interface \
    ports { input_ptr_166_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2894 \
    name input_ptr_167_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_167_val \
    op interface \
    ports { input_ptr_167_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2895 \
    name input_ptr_168_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_168_val \
    op interface \
    ports { input_ptr_168_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2896 \
    name input_ptr_169_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_169_val \
    op interface \
    ports { input_ptr_169_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2897 \
    name input_ptr_170_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_170_val \
    op interface \
    ports { input_ptr_170_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2898 \
    name input_ptr_171_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_171_val \
    op interface \
    ports { input_ptr_171_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2899 \
    name input_ptr_172_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_172_val \
    op interface \
    ports { input_ptr_172_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2900 \
    name input_ptr_173_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_173_val \
    op interface \
    ports { input_ptr_173_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2901 \
    name input_ptr_174_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_174_val \
    op interface \
    ports { input_ptr_174_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2902 \
    name input_ptr_175_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_175_val \
    op interface \
    ports { input_ptr_175_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2903 \
    name input_ptr_176_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_176_val \
    op interface \
    ports { input_ptr_176_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2904 \
    name input_ptr_177_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_177_val \
    op interface \
    ports { input_ptr_177_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2905 \
    name input_ptr_178_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_178_val \
    op interface \
    ports { input_ptr_178_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2906 \
    name input_ptr_179_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_179_val \
    op interface \
    ports { input_ptr_179_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2907 \
    name input_ptr_180_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_180_val \
    op interface \
    ports { input_ptr_180_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2908 \
    name input_ptr_181_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_181_val \
    op interface \
    ports { input_ptr_181_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2909 \
    name input_ptr_182_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_182_val \
    op interface \
    ports { input_ptr_182_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2910 \
    name input_ptr_183_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_183_val \
    op interface \
    ports { input_ptr_183_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2911 \
    name input_ptr_184_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_184_val \
    op interface \
    ports { input_ptr_184_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2912 \
    name input_ptr_185_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_185_val \
    op interface \
    ports { input_ptr_185_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2913 \
    name input_ptr_186_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_186_val \
    op interface \
    ports { input_ptr_186_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2914 \
    name input_ptr_187_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_187_val \
    op interface \
    ports { input_ptr_187_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2915 \
    name input_ptr_188_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_188_val \
    op interface \
    ports { input_ptr_188_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2916 \
    name input_ptr_189_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_189_val \
    op interface \
    ports { input_ptr_189_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2917 \
    name input_ptr_190_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_190_val \
    op interface \
    ports { input_ptr_190_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2918 \
    name input_ptr_191_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_191_val \
    op interface \
    ports { input_ptr_191_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2919 \
    name input_ptr_192_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_192_val \
    op interface \
    ports { input_ptr_192_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2920 \
    name input_ptr_193_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_193_val \
    op interface \
    ports { input_ptr_193_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2921 \
    name input_ptr_194_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_194_val \
    op interface \
    ports { input_ptr_194_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2922 \
    name input_ptr_195_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_195_val \
    op interface \
    ports { input_ptr_195_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2923 \
    name input_ptr_196_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_196_val \
    op interface \
    ports { input_ptr_196_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2924 \
    name input_ptr_197_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_197_val \
    op interface \
    ports { input_ptr_197_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2925 \
    name input_ptr_198_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_198_val \
    op interface \
    ports { input_ptr_198_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2926 \
    name input_ptr_199_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_199_val \
    op interface \
    ports { input_ptr_199_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2927 \
    name input_ptr_200_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_200_val \
    op interface \
    ports { input_ptr_200_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2928 \
    name input_ptr_201_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_201_val \
    op interface \
    ports { input_ptr_201_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2929 \
    name input_ptr_202_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_202_val \
    op interface \
    ports { input_ptr_202_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2930 \
    name input_ptr_203_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_203_val \
    op interface \
    ports { input_ptr_203_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2931 \
    name input_ptr_204_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_204_val \
    op interface \
    ports { input_ptr_204_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2932 \
    name input_ptr_205_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_205_val \
    op interface \
    ports { input_ptr_205_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2933 \
    name input_ptr_206_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_206_val \
    op interface \
    ports { input_ptr_206_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2934 \
    name input_ptr_207_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_207_val \
    op interface \
    ports { input_ptr_207_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2935 \
    name input_ptr_208_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_208_val \
    op interface \
    ports { input_ptr_208_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2936 \
    name input_ptr_209_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_209_val \
    op interface \
    ports { input_ptr_209_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2937 \
    name input_ptr_210_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_210_val \
    op interface \
    ports { input_ptr_210_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2938 \
    name input_ptr_211_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_211_val \
    op interface \
    ports { input_ptr_211_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2939 \
    name input_ptr_212_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_212_val \
    op interface \
    ports { input_ptr_212_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2940 \
    name input_ptr_213_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_213_val \
    op interface \
    ports { input_ptr_213_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2941 \
    name input_ptr_214_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_214_val \
    op interface \
    ports { input_ptr_214_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2942 \
    name input_ptr_215_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_215_val \
    op interface \
    ports { input_ptr_215_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2943 \
    name input_ptr_216_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_216_val \
    op interface \
    ports { input_ptr_216_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2944 \
    name input_ptr_217_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_217_val \
    op interface \
    ports { input_ptr_217_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2945 \
    name input_ptr_218_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_218_val \
    op interface \
    ports { input_ptr_218_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2946 \
    name input_ptr_219_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_219_val \
    op interface \
    ports { input_ptr_219_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2947 \
    name input_ptr_220_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_220_val \
    op interface \
    ports { input_ptr_220_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2948 \
    name input_ptr_221_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_221_val \
    op interface \
    ports { input_ptr_221_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2949 \
    name input_ptr_222_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_222_val \
    op interface \
    ports { input_ptr_222_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2950 \
    name input_ptr_223_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_ptr_223_val \
    op interface \
    ports { input_ptr_223_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2955 \
    name prev_hx_q610_0_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_0_val \
    op interface \
    ports { prev_hx_q610_0_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2956 \
    name prev_hx_q610_1_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_1_val \
    op interface \
    ports { prev_hx_q610_1_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2957 \
    name prev_hx_q610_2_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_2_val \
    op interface \
    ports { prev_hx_q610_2_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2958 \
    name prev_hx_q610_3_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_3_val \
    op interface \
    ports { prev_hx_q610_3_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2959 \
    name prev_hx_q610_4_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_4_val \
    op interface \
    ports { prev_hx_q610_4_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2960 \
    name prev_hx_q610_5_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_5_val \
    op interface \
    ports { prev_hx_q610_5_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2961 \
    name prev_hx_q610_6_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_6_val \
    op interface \
    ports { prev_hx_q610_6_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2962 \
    name prev_hx_q610_7_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_7_val \
    op interface \
    ports { prev_hx_q610_7_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2963 \
    name prev_hx_q610_8_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_8_val \
    op interface \
    ports { prev_hx_q610_8_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2964 \
    name prev_hx_q610_9_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_9_val \
    op interface \
    ports { prev_hx_q610_9_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2965 \
    name prev_hx_q610_10_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_10_val \
    op interface \
    ports { prev_hx_q610_10_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2966 \
    name prev_hx_q610_11_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_11_val \
    op interface \
    ports { prev_hx_q610_11_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2967 \
    name prev_hx_q610_12_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_12_val \
    op interface \
    ports { prev_hx_q610_12_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2968 \
    name prev_hx_q610_13_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_13_val \
    op interface \
    ports { prev_hx_q610_13_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2969 \
    name prev_hx_q610_14_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_14_val \
    op interface \
    ports { prev_hx_q610_14_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2970 \
    name prev_hx_q610_15_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_15_val \
    op interface \
    ports { prev_hx_q610_15_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2971 \
    name prev_hx_q610_16_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_16_val \
    op interface \
    ports { prev_hx_q610_16_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2972 \
    name prev_hx_q610_17_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_17_val \
    op interface \
    ports { prev_hx_q610_17_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2973 \
    name prev_hx_q610_18_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_18_val \
    op interface \
    ports { prev_hx_q610_18_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2974 \
    name prev_hx_q610_19_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_19_val \
    op interface \
    ports { prev_hx_q610_19_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2975 \
    name prev_hx_q610_20_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_20_val \
    op interface \
    ports { prev_hx_q610_20_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2976 \
    name prev_hx_q610_21_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_21_val \
    op interface \
    ports { prev_hx_q610_21_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2977 \
    name prev_hx_q610_22_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_22_val \
    op interface \
    ports { prev_hx_q610_22_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2978 \
    name prev_hx_q610_23_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_23_val \
    op interface \
    ports { prev_hx_q610_23_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2979 \
    name prev_hx_q610_24_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_24_val \
    op interface \
    ports { prev_hx_q610_24_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2980 \
    name prev_hx_q610_25_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_25_val \
    op interface \
    ports { prev_hx_q610_25_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2981 \
    name prev_hx_q610_26_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_26_val \
    op interface \
    ports { prev_hx_q610_26_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2982 \
    name prev_hx_q610_27_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_27_val \
    op interface \
    ports { prev_hx_q610_27_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2983 \
    name prev_hx_q610_28_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_28_val \
    op interface \
    ports { prev_hx_q610_28_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2984 \
    name prev_hx_q610_29_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_29_val \
    op interface \
    ports { prev_hx_q610_29_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2985 \
    name prev_hx_q610_30_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_30_val \
    op interface \
    ports { prev_hx_q610_30_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2986 \
    name prev_hx_q610_31_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_31_val \
    op interface \
    ports { prev_hx_q610_31_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2987 \
    name prev_hx_q610_32_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_32_val \
    op interface \
    ports { prev_hx_q610_32_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2988 \
    name prev_hx_q610_33_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_33_val \
    op interface \
    ports { prev_hx_q610_33_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2989 \
    name prev_hx_q610_34_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_34_val \
    op interface \
    ports { prev_hx_q610_34_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2990 \
    name prev_hx_q610_35_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_35_val \
    op interface \
    ports { prev_hx_q610_35_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2991 \
    name prev_hx_q610_36_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_36_val \
    op interface \
    ports { prev_hx_q610_36_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2992 \
    name prev_hx_q610_37_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_37_val \
    op interface \
    ports { prev_hx_q610_37_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2993 \
    name prev_hx_q610_38_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_38_val \
    op interface \
    ports { prev_hx_q610_38_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2994 \
    name prev_hx_q610_39_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_39_val \
    op interface \
    ports { prev_hx_q610_39_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2995 \
    name prev_hx_q610_40_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_40_val \
    op interface \
    ports { prev_hx_q610_40_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2996 \
    name prev_hx_q610_41_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_41_val \
    op interface \
    ports { prev_hx_q610_41_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2997 \
    name prev_hx_q610_42_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_42_val \
    op interface \
    ports { prev_hx_q610_42_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2998 \
    name prev_hx_q610_43_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_43_val \
    op interface \
    ports { prev_hx_q610_43_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2999 \
    name prev_hx_q610_44_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_44_val \
    op interface \
    ports { prev_hx_q610_44_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3000 \
    name prev_hx_q610_45_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_45_val \
    op interface \
    ports { prev_hx_q610_45_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3001 \
    name prev_hx_q610_46_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_46_val \
    op interface \
    ports { prev_hx_q610_46_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3002 \
    name prev_hx_q610_47_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_47_val \
    op interface \
    ports { prev_hx_q610_47_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3003 \
    name prev_hx_q610_48_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_48_val \
    op interface \
    ports { prev_hx_q610_48_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3004 \
    name prev_hx_q610_49_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_49_val \
    op interface \
    ports { prev_hx_q610_49_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3005 \
    name prev_hx_q610_50_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_50_val \
    op interface \
    ports { prev_hx_q610_50_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3006 \
    name prev_hx_q610_51_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_51_val \
    op interface \
    ports { prev_hx_q610_51_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3007 \
    name prev_hx_q610_52_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_52_val \
    op interface \
    ports { prev_hx_q610_52_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3008 \
    name prev_hx_q610_53_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_53_val \
    op interface \
    ports { prev_hx_q610_53_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3009 \
    name prev_hx_q610_54_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_54_val \
    op interface \
    ports { prev_hx_q610_54_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3010 \
    name prev_hx_q610_55_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_55_val \
    op interface \
    ports { prev_hx_q610_55_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3011 \
    name prev_hx_q610_56_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_56_val \
    op interface \
    ports { prev_hx_q610_56_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3012 \
    name prev_hx_q610_57_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_57_val \
    op interface \
    ports { prev_hx_q610_57_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3013 \
    name prev_hx_q610_58_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_58_val \
    op interface \
    ports { prev_hx_q610_58_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3014 \
    name prev_hx_q610_59_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_59_val \
    op interface \
    ports { prev_hx_q610_59_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3015 \
    name prev_hx_q610_60_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_60_val \
    op interface \
    ports { prev_hx_q610_60_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3016 \
    name prev_hx_q610_61_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_61_val \
    op interface \
    ports { prev_hx_q610_61_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3017 \
    name prev_hx_q610_62_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_62_val \
    op interface \
    ports { prev_hx_q610_62_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3018 \
    name prev_hx_q610_63_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_63_val \
    op interface \
    ports { prev_hx_q610_63_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3019 \
    name prev_hx_q610_64_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_64_val \
    op interface \
    ports { prev_hx_q610_64_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3020 \
    name prev_hx_q610_65_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_65_val \
    op interface \
    ports { prev_hx_q610_65_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3021 \
    name prev_hx_q610_66_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_66_val \
    op interface \
    ports { prev_hx_q610_66_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3022 \
    name prev_hx_q610_67_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_67_val \
    op interface \
    ports { prev_hx_q610_67_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3023 \
    name prev_hx_q610_68_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_68_val \
    op interface \
    ports { prev_hx_q610_68_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3024 \
    name prev_hx_q610_69_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_69_val \
    op interface \
    ports { prev_hx_q610_69_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3025 \
    name prev_hx_q610_70_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_70_val \
    op interface \
    ports { prev_hx_q610_70_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3026 \
    name prev_hx_q610_71_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_71_val \
    op interface \
    ports { prev_hx_q610_71_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3027 \
    name prev_hx_q610_72_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_72_val \
    op interface \
    ports { prev_hx_q610_72_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3028 \
    name prev_hx_q610_73_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_73_val \
    op interface \
    ports { prev_hx_q610_73_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3029 \
    name prev_hx_q610_74_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_74_val \
    op interface \
    ports { prev_hx_q610_74_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3030 \
    name prev_hx_q610_75_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_75_val \
    op interface \
    ports { prev_hx_q610_75_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3031 \
    name prev_hx_q610_76_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_76_val \
    op interface \
    ports { prev_hx_q610_76_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3032 \
    name prev_hx_q610_77_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_77_val \
    op interface \
    ports { prev_hx_q610_77_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3033 \
    name prev_hx_q610_78_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_78_val \
    op interface \
    ports { prev_hx_q610_78_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3034 \
    name prev_hx_q610_79_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_79_val \
    op interface \
    ports { prev_hx_q610_79_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3035 \
    name prev_hx_q610_80_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_80_val \
    op interface \
    ports { prev_hx_q610_80_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3036 \
    name prev_hx_q610_81_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_81_val \
    op interface \
    ports { prev_hx_q610_81_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3037 \
    name prev_hx_q610_82_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_82_val \
    op interface \
    ports { prev_hx_q610_82_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3038 \
    name prev_hx_q610_83_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_83_val \
    op interface \
    ports { prev_hx_q610_83_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3039 \
    name prev_hx_q610_84_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_84_val \
    op interface \
    ports { prev_hx_q610_84_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3040 \
    name prev_hx_q610_85_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_85_val \
    op interface \
    ports { prev_hx_q610_85_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3041 \
    name prev_hx_q610_86_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_86_val \
    op interface \
    ports { prev_hx_q610_86_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3042 \
    name prev_hx_q610_87_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_87_val \
    op interface \
    ports { prev_hx_q610_87_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3043 \
    name prev_hx_q610_88_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_88_val \
    op interface \
    ports { prev_hx_q610_88_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3044 \
    name prev_hx_q610_89_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_89_val \
    op interface \
    ports { prev_hx_q610_89_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3045 \
    name prev_hx_q610_90_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_90_val \
    op interface \
    ports { prev_hx_q610_90_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3046 \
    name prev_hx_q610_91_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_91_val \
    op interface \
    ports { prev_hx_q610_91_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3047 \
    name prev_hx_q610_92_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_92_val \
    op interface \
    ports { prev_hx_q610_92_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3048 \
    name prev_hx_q610_93_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_93_val \
    op interface \
    ports { prev_hx_q610_93_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3049 \
    name prev_hx_q610_94_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_94_val \
    op interface \
    ports { prev_hx_q610_94_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3050 \
    name prev_hx_q610_95_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_95_val \
    op interface \
    ports { prev_hx_q610_95_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3051 \
    name prev_hx_q610_96_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_96_val \
    op interface \
    ports { prev_hx_q610_96_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3052 \
    name prev_hx_q610_97_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_97_val \
    op interface \
    ports { prev_hx_q610_97_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3053 \
    name prev_hx_q610_98_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_98_val \
    op interface \
    ports { prev_hx_q610_98_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3054 \
    name prev_hx_q610_99_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_99_val \
    op interface \
    ports { prev_hx_q610_99_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3055 \
    name prev_hx_q610_100_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_100_val \
    op interface \
    ports { prev_hx_q610_100_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3056 \
    name prev_hx_q610_101_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_101_val \
    op interface \
    ports { prev_hx_q610_101_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3057 \
    name prev_hx_q610_102_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_102_val \
    op interface \
    ports { prev_hx_q610_102_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3058 \
    name prev_hx_q610_103_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_103_val \
    op interface \
    ports { prev_hx_q610_103_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3059 \
    name prev_hx_q610_104_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_104_val \
    op interface \
    ports { prev_hx_q610_104_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3060 \
    name prev_hx_q610_105_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_105_val \
    op interface \
    ports { prev_hx_q610_105_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3061 \
    name prev_hx_q610_106_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_106_val \
    op interface \
    ports { prev_hx_q610_106_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3062 \
    name prev_hx_q610_107_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_107_val \
    op interface \
    ports { prev_hx_q610_107_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3063 \
    name prev_hx_q610_108_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_108_val \
    op interface \
    ports { prev_hx_q610_108_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3064 \
    name prev_hx_q610_109_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_109_val \
    op interface \
    ports { prev_hx_q610_109_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3065 \
    name prev_hx_q610_110_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_110_val \
    op interface \
    ports { prev_hx_q610_110_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3066 \
    name prev_hx_q610_111_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_111_val \
    op interface \
    ports { prev_hx_q610_111_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3067 \
    name prev_hx_q610_112_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_112_val \
    op interface \
    ports { prev_hx_q610_112_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3068 \
    name prev_hx_q610_113_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_113_val \
    op interface \
    ports { prev_hx_q610_113_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3069 \
    name prev_hx_q610_114_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_114_val \
    op interface \
    ports { prev_hx_q610_114_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3070 \
    name prev_hx_q610_115_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_115_val \
    op interface \
    ports { prev_hx_q610_115_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3071 \
    name prev_hx_q610_116_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_116_val \
    op interface \
    ports { prev_hx_q610_116_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3072 \
    name prev_hx_q610_117_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_117_val \
    op interface \
    ports { prev_hx_q610_117_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3073 \
    name prev_hx_q610_118_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_118_val \
    op interface \
    ports { prev_hx_q610_118_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3074 \
    name prev_hx_q610_119_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_119_val \
    op interface \
    ports { prev_hx_q610_119_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3075 \
    name prev_hx_q610_120_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_120_val \
    op interface \
    ports { prev_hx_q610_120_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3076 \
    name prev_hx_q610_121_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_121_val \
    op interface \
    ports { prev_hx_q610_121_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3077 \
    name prev_hx_q610_122_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_122_val \
    op interface \
    ports { prev_hx_q610_122_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3078 \
    name prev_hx_q610_123_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_123_val \
    op interface \
    ports { prev_hx_q610_123_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3079 \
    name prev_hx_q610_124_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_124_val \
    op interface \
    ports { prev_hx_q610_124_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3080 \
    name prev_hx_q610_125_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_125_val \
    op interface \
    ports { prev_hx_q610_125_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3081 \
    name prev_hx_q610_126_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_126_val \
    op interface \
    ports { prev_hx_q610_126_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3082 \
    name prev_hx_q610_127_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_127_val \
    op interface \
    ports { prev_hx_q610_127_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3083 \
    name prev_hx_q610_128_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_128_val \
    op interface \
    ports { prev_hx_q610_128_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3084 \
    name prev_hx_q610_129_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_129_val \
    op interface \
    ports { prev_hx_q610_129_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3085 \
    name prev_hx_q610_130_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_130_val \
    op interface \
    ports { prev_hx_q610_130_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3086 \
    name prev_hx_q610_131_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_131_val \
    op interface \
    ports { prev_hx_q610_131_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3087 \
    name prev_hx_q610_132_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_132_val \
    op interface \
    ports { prev_hx_q610_132_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3088 \
    name prev_hx_q610_133_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_133_val \
    op interface \
    ports { prev_hx_q610_133_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3089 \
    name prev_hx_q610_134_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_134_val \
    op interface \
    ports { prev_hx_q610_134_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3090 \
    name prev_hx_q610_135_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_135_val \
    op interface \
    ports { prev_hx_q610_135_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3091 \
    name prev_hx_q610_136_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_136_val \
    op interface \
    ports { prev_hx_q610_136_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3092 \
    name prev_hx_q610_137_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_137_val \
    op interface \
    ports { prev_hx_q610_137_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3093 \
    name prev_hx_q610_138_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_138_val \
    op interface \
    ports { prev_hx_q610_138_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3094 \
    name prev_hx_q610_139_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_139_val \
    op interface \
    ports { prev_hx_q610_139_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3095 \
    name prev_hx_q610_140_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_140_val \
    op interface \
    ports { prev_hx_q610_140_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3096 \
    name prev_hx_q610_141_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_141_val \
    op interface \
    ports { prev_hx_q610_141_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3097 \
    name prev_hx_q610_142_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_142_val \
    op interface \
    ports { prev_hx_q610_142_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3098 \
    name prev_hx_q610_143_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_143_val \
    op interface \
    ports { prev_hx_q610_143_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3099 \
    name prev_hx_q610_144_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_144_val \
    op interface \
    ports { prev_hx_q610_144_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3100 \
    name prev_hx_q610_145_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_145_val \
    op interface \
    ports { prev_hx_q610_145_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3101 \
    name prev_hx_q610_146_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_146_val \
    op interface \
    ports { prev_hx_q610_146_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3102 \
    name prev_hx_q610_147_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_147_val \
    op interface \
    ports { prev_hx_q610_147_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3103 \
    name prev_hx_q610_148_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_148_val \
    op interface \
    ports { prev_hx_q610_148_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3104 \
    name prev_hx_q610_149_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_149_val \
    op interface \
    ports { prev_hx_q610_149_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3105 \
    name prev_hx_q610_150_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_150_val \
    op interface \
    ports { prev_hx_q610_150_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3106 \
    name prev_hx_q610_151_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_151_val \
    op interface \
    ports { prev_hx_q610_151_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3107 \
    name prev_hx_q610_152_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_152_val \
    op interface \
    ports { prev_hx_q610_152_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3108 \
    name prev_hx_q610_153_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_153_val \
    op interface \
    ports { prev_hx_q610_153_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3109 \
    name prev_hx_q610_154_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_154_val \
    op interface \
    ports { prev_hx_q610_154_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3110 \
    name prev_hx_q610_155_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_155_val \
    op interface \
    ports { prev_hx_q610_155_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3111 \
    name prev_hx_q610_156_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_156_val \
    op interface \
    ports { prev_hx_q610_156_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3112 \
    name prev_hx_q610_157_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_157_val \
    op interface \
    ports { prev_hx_q610_157_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3113 \
    name prev_hx_q610_158_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_158_val \
    op interface \
    ports { prev_hx_q610_158_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3114 \
    name prev_hx_q610_159_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_159_val \
    op interface \
    ports { prev_hx_q610_159_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3115 \
    name prev_hx_q610_160_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_160_val \
    op interface \
    ports { prev_hx_q610_160_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3116 \
    name prev_hx_q610_161_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_161_val \
    op interface \
    ports { prev_hx_q610_161_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3117 \
    name prev_hx_q610_162_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_162_val \
    op interface \
    ports { prev_hx_q610_162_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3118 \
    name prev_hx_q610_163_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_163_val \
    op interface \
    ports { prev_hx_q610_163_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3119 \
    name prev_hx_q610_164_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_164_val \
    op interface \
    ports { prev_hx_q610_164_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3120 \
    name prev_hx_q610_165_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_165_val \
    op interface \
    ports { prev_hx_q610_165_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3121 \
    name prev_hx_q610_166_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_166_val \
    op interface \
    ports { prev_hx_q610_166_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3122 \
    name prev_hx_q610_167_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_167_val \
    op interface \
    ports { prev_hx_q610_167_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3123 \
    name prev_hx_q610_168_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_168_val \
    op interface \
    ports { prev_hx_q610_168_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3124 \
    name prev_hx_q610_169_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_169_val \
    op interface \
    ports { prev_hx_q610_169_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3125 \
    name prev_hx_q610_170_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_170_val \
    op interface \
    ports { prev_hx_q610_170_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3126 \
    name prev_hx_q610_171_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_171_val \
    op interface \
    ports { prev_hx_q610_171_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3127 \
    name prev_hx_q610_172_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_172_val \
    op interface \
    ports { prev_hx_q610_172_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3128 \
    name prev_hx_q610_173_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_173_val \
    op interface \
    ports { prev_hx_q610_173_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3129 \
    name prev_hx_q610_174_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_174_val \
    op interface \
    ports { prev_hx_q610_174_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3130 \
    name prev_hx_q610_175_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_175_val \
    op interface \
    ports { prev_hx_q610_175_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3131 \
    name prev_hx_q610_176_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_176_val \
    op interface \
    ports { prev_hx_q610_176_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3132 \
    name prev_hx_q610_177_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_177_val \
    op interface \
    ports { prev_hx_q610_177_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3133 \
    name prev_hx_q610_178_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_178_val \
    op interface \
    ports { prev_hx_q610_178_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3134 \
    name prev_hx_q610_179_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_179_val \
    op interface \
    ports { prev_hx_q610_179_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3135 \
    name prev_hx_q610_180_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_180_val \
    op interface \
    ports { prev_hx_q610_180_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3136 \
    name prev_hx_q610_181_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_181_val \
    op interface \
    ports { prev_hx_q610_181_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3137 \
    name prev_hx_q610_182_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_182_val \
    op interface \
    ports { prev_hx_q610_182_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3138 \
    name prev_hx_q610_183_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_183_val \
    op interface \
    ports { prev_hx_q610_183_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3139 \
    name prev_hx_q610_184_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_184_val \
    op interface \
    ports { prev_hx_q610_184_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3140 \
    name prev_hx_q610_185_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_185_val \
    op interface \
    ports { prev_hx_q610_185_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3141 \
    name prev_hx_q610_186_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_186_val \
    op interface \
    ports { prev_hx_q610_186_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3142 \
    name prev_hx_q610_187_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_187_val \
    op interface \
    ports { prev_hx_q610_187_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3143 \
    name prev_hx_q610_188_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_188_val \
    op interface \
    ports { prev_hx_q610_188_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3144 \
    name prev_hx_q610_189_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_189_val \
    op interface \
    ports { prev_hx_q610_189_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3145 \
    name prev_hx_q610_190_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_190_val \
    op interface \
    ports { prev_hx_q610_190_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3146 \
    name prev_hx_q610_191_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_191_val \
    op interface \
    ports { prev_hx_q610_191_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3147 \
    name prev_hx_q610_192_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_192_val \
    op interface \
    ports { prev_hx_q610_192_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3148 \
    name prev_hx_q610_193_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_193_val \
    op interface \
    ports { prev_hx_q610_193_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3149 \
    name prev_hx_q610_194_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_194_val \
    op interface \
    ports { prev_hx_q610_194_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3150 \
    name prev_hx_q610_195_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_195_val \
    op interface \
    ports { prev_hx_q610_195_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3151 \
    name prev_hx_q610_196_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_196_val \
    op interface \
    ports { prev_hx_q610_196_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3152 \
    name prev_hx_q610_197_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_197_val \
    op interface \
    ports { prev_hx_q610_197_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3153 \
    name prev_hx_q610_198_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_198_val \
    op interface \
    ports { prev_hx_q610_198_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3154 \
    name prev_hx_q610_199_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_199_val \
    op interface \
    ports { prev_hx_q610_199_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3155 \
    name prev_hx_q610_200_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_200_val \
    op interface \
    ports { prev_hx_q610_200_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3156 \
    name prev_hx_q610_201_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_201_val \
    op interface \
    ports { prev_hx_q610_201_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3157 \
    name prev_hx_q610_202_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_202_val \
    op interface \
    ports { prev_hx_q610_202_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3158 \
    name prev_hx_q610_203_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_203_val \
    op interface \
    ports { prev_hx_q610_203_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3159 \
    name prev_hx_q610_204_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_204_val \
    op interface \
    ports { prev_hx_q610_204_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3160 \
    name prev_hx_q610_205_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_205_val \
    op interface \
    ports { prev_hx_q610_205_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3161 \
    name prev_hx_q610_206_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_206_val \
    op interface \
    ports { prev_hx_q610_206_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3162 \
    name prev_hx_q610_207_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_207_val \
    op interface \
    ports { prev_hx_q610_207_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3163 \
    name prev_hx_q610_208_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_208_val \
    op interface \
    ports { prev_hx_q610_208_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3164 \
    name prev_hx_q610_209_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_209_val \
    op interface \
    ports { prev_hx_q610_209_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3165 \
    name prev_hx_q610_210_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_210_val \
    op interface \
    ports { prev_hx_q610_210_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3166 \
    name prev_hx_q610_211_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_211_val \
    op interface \
    ports { prev_hx_q610_211_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3167 \
    name prev_hx_q610_212_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_212_val \
    op interface \
    ports { prev_hx_q610_212_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3168 \
    name prev_hx_q610_213_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_213_val \
    op interface \
    ports { prev_hx_q610_213_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3169 \
    name prev_hx_q610_214_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_214_val \
    op interface \
    ports { prev_hx_q610_214_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3170 \
    name prev_hx_q610_215_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_215_val \
    op interface \
    ports { prev_hx_q610_215_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3171 \
    name prev_hx_q610_216_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_216_val \
    op interface \
    ports { prev_hx_q610_216_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3172 \
    name prev_hx_q610_217_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_217_val \
    op interface \
    ports { prev_hx_q610_217_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3173 \
    name prev_hx_q610_218_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_218_val \
    op interface \
    ports { prev_hx_q610_218_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3174 \
    name prev_hx_q610_219_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_219_val \
    op interface \
    ports { prev_hx_q610_219_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3175 \
    name prev_hx_q610_220_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_220_val \
    op interface \
    ports { prev_hx_q610_220_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3176 \
    name prev_hx_q610_221_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_221_val \
    op interface \
    ports { prev_hx_q610_221_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3177 \
    name prev_hx_q610_222_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_222_val \
    op interface \
    ports { prev_hx_q610_222_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3178 \
    name prev_hx_q610_223_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_223_val \
    op interface \
    ports { prev_hx_q610_223_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3179 \
    name common_sum_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_common_sum_stream \
    op interface \
    ports { common_sum_stream_din { O 96 vector } common_sum_stream_full_n { I 1 bit } common_sum_stream_write { O 1 bit } } \
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



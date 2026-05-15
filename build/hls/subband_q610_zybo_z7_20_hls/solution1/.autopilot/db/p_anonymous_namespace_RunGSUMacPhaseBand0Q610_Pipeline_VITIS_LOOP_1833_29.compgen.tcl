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
    id 4093 \
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


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3836 \
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
    id 3837 \
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
    id 3838 \
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
    id 3839 \
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
    id 3840 \
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
    id 3841 \
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
    id 3842 \
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
    id 3843 \
    name sub_ln1839 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_ln1839 \
    op interface \
    ports { sub_ln1839 { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3844 \
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
    id 3845 \
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
    id 3846 \
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
    id 3847 \
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
    id 3848 \
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
    id 3849 \
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
    id 3850 \
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
    id 3851 \
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
    id 3852 \
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
    id 3853 \
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
    id 3854 \
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
    id 3855 \
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
    id 3856 \
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
    id 3857 \
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
    id 3858 \
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
    id 3859 \
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
    id 3860 \
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
    id 3861 \
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
    id 3862 \
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
    id 3863 \
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
    id 3864 \
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
    id 3865 \
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
    id 3866 \
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
    id 3867 \
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
    id 3868 \
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
    id 3869 \
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
    id 3870 \
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
    id 3871 \
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
    id 3872 \
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
    id 3873 \
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
    id 3874 \
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
    id 3875 \
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
    id 3876 \
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
    id 3877 \
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
    id 3878 \
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
    id 3879 \
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
    id 3880 \
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
    id 3881 \
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
    id 3882 \
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
    id 3883 \
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
    id 3884 \
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
    id 3885 \
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
    id 3886 \
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
    id 3887 \
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
    id 3888 \
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
    id 3889 \
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
    id 3890 \
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
    id 3891 \
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
    id 3892 \
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
    id 3893 \
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
    id 3894 \
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
    id 3895 \
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
    id 3896 \
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
    id 3897 \
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
    id 3898 \
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
    id 3899 \
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
    id 3900 \
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
    id 3901 \
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
    id 3902 \
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
    id 3903 \
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
    id 3904 \
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
    id 3905 \
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
    id 3906 \
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
    id 3907 \
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
    id 3908 \
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
    id 3909 \
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
    id 3910 \
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
    id 3911 \
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
    id 3912 \
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
    id 3913 \
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
    id 3914 \
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
    id 3915 \
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
    id 3916 \
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
    id 3917 \
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
    id 3918 \
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
    id 3919 \
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
    id 3920 \
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
    id 3921 \
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
    id 3922 \
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
    id 3923 \
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
    id 3924 \
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
    id 3925 \
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
    id 3926 \
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
    id 3927 \
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
    id 3928 \
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
    id 3929 \
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
    id 3930 \
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
    id 3931 \
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
    id 3932 \
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
    id 3933 \
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
    id 3934 \
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
    id 3935 \
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
    id 3936 \
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
    id 3937 \
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
    id 3938 \
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
    id 3939 \
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
    id 3940 \
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
    id 3941 \
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
    id 3942 \
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
    id 3943 \
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
    id 3944 \
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
    id 3945 \
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
    id 3946 \
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
    id 3947 \
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
    id 3948 \
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
    id 3949 \
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
    id 3950 \
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
    id 3951 \
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
    id 3952 \
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
    id 3953 \
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
    id 3954 \
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
    id 3955 \
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
    id 3956 \
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
    id 3957 \
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
    id 3958 \
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
    id 3959 \
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
    id 3960 \
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
    id 3961 \
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
    id 3962 \
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
    id 3963 \
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
    id 3964 \
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
    id 3965 \
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
    id 3966 \
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
    id 3967 \
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
    id 3968 \
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
    id 3969 \
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
    id 3970 \
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
    id 3971 \
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
    id 3972 \
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
    id 3973 \
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
    id 3974 \
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
    id 3975 \
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
    id 3976 \
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
    id 3977 \
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
    id 3978 \
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
    id 3979 \
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
    id 3980 \
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
    id 3981 \
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
    id 3982 \
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
    id 3983 \
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
    id 3984 \
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
    id 3985 \
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
    id 3986 \
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
    id 3987 \
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
    id 3988 \
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
    id 3989 \
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
    id 3990 \
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
    id 3991 \
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
    id 3992 \
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
    id 3993 \
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
    id 3994 \
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
    id 3995 \
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
    id 3996 \
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
    id 3997 \
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
    id 3998 \
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
    id 3999 \
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
    id 4000 \
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
    id 4001 \
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
    id 4002 \
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
    id 4003 \
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
    id 4004 \
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
    id 4005 \
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
    id 4006 \
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
    id 4007 \
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
    id 4008 \
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
    id 4009 \
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
    id 4010 \
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
    id 4011 \
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
    id 4012 \
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
    id 4013 \
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
    id 4014 \
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
    id 4015 \
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
    id 4016 \
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
    id 4017 \
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
    id 4018 \
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
    id 4019 \
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
    id 4020 \
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
    id 4021 \
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
    id 4022 \
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
    id 4023 \
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
    id 4024 \
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
    id 4025 \
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
    id 4026 \
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
    id 4027 \
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
    id 4028 \
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
    id 4029 \
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
    id 4030 \
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
    id 4031 \
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
    id 4032 \
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
    id 4033 \
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
    id 4034 \
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
    id 4035 \
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
    id 4036 \
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
    id 4037 \
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
    id 4038 \
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
    id 4039 \
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
    id 4040 \
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
    id 4041 \
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
    id 4042 \
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
    id 4043 \
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
    id 4044 \
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
    id 4045 \
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
    id 4046 \
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
    id 4047 \
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
    id 4048 \
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
    id 4049 \
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
    id 4050 \
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
    id 4051 \
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
    id 4052 \
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
    id 4053 \
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
    id 4054 \
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
    id 4055 \
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
    id 4056 \
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
    id 4057 \
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
    id 4058 \
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
    id 4059 \
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
    id 4060 \
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
    id 4061 \
    name p_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out \
    op interface \
    ports { p_out { O 34 vector } p_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4062 \
    name p_out1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out1 \
    op interface \
    ports { p_out1 { O 34 vector } p_out1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4063 \
    name p_out2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out2 \
    op interface \
    ports { p_out2 { O 34 vector } p_out2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4064 \
    name p_out3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out3 \
    op interface \
    ports { p_out3 { O 34 vector } p_out3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4065 \
    name p_out4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out4 \
    op interface \
    ports { p_out4 { O 34 vector } p_out4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4066 \
    name p_out5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out5 \
    op interface \
    ports { p_out5 { O 34 vector } p_out5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4067 \
    name p_out6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out6 \
    op interface \
    ports { p_out6 { O 34 vector } p_out6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4068 \
    name p_out7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out7 \
    op interface \
    ports { p_out7 { O 34 vector } p_out7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4069 \
    name p_out8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out8 \
    op interface \
    ports { p_out8 { O 34 vector } p_out8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4070 \
    name p_out9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out9 \
    op interface \
    ports { p_out9 { O 34 vector } p_out9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4071 \
    name p_out10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out10 \
    op interface \
    ports { p_out10 { O 34 vector } p_out10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4072 \
    name p_out11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out11 \
    op interface \
    ports { p_out11 { O 34 vector } p_out11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4073 \
    name p_out12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out12 \
    op interface \
    ports { p_out12 { O 34 vector } p_out12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4074 \
    name p_out13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out13 \
    op interface \
    ports { p_out13 { O 34 vector } p_out13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4075 \
    name p_out14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out14 \
    op interface \
    ports { p_out14 { O 34 vector } p_out14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4076 \
    name p_out15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out15 \
    op interface \
    ports { p_out15 { O 34 vector } p_out15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4077 \
    name p_out16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out16 \
    op interface \
    ports { p_out16 { O 34 vector } p_out16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4078 \
    name p_out17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out17 \
    op interface \
    ports { p_out17 { O 34 vector } p_out17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4079 \
    name p_out18 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out18 \
    op interface \
    ports { p_out18 { O 34 vector } p_out18_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4080 \
    name p_out19 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out19 \
    op interface \
    ports { p_out19 { O 34 vector } p_out19_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4081 \
    name p_out20 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out20 \
    op interface \
    ports { p_out20 { O 34 vector } p_out20_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4082 \
    name p_out21 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out21 \
    op interface \
    ports { p_out21 { O 34 vector } p_out21_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4083 \
    name p_out22 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out22 \
    op interface \
    ports { p_out22 { O 34 vector } p_out22_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4084 \
    name p_out23 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out23 \
    op interface \
    ports { p_out23 { O 34 vector } p_out23_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4085 \
    name p_out24 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out24 \
    op interface \
    ports { p_out24 { O 34 vector } p_out24_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4086 \
    name p_out25 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out25 \
    op interface \
    ports { p_out25 { O 34 vector } p_out25_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4087 \
    name p_out26 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out26 \
    op interface \
    ports { p_out26 { O 34 vector } p_out26_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4088 \
    name p_out27 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out27 \
    op interface \
    ports { p_out27 { O 34 vector } p_out27_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4089 \
    name p_out28 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out28 \
    op interface \
    ports { p_out28 { O 34 vector } p_out28_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4090 \
    name p_out29 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out29 \
    op interface \
    ports { p_out29 { O 34 vector } p_out29_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4091 \
    name p_out30 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out30 \
    op interface \
    ports { p_out30 { O 34 vector } p_out30_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4092 \
    name p_out31 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out31 \
    op interface \
    ports { p_out31 { O 34 vector } p_out31_ap_vld { O 1 bit } } \
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


# flow_control definition:
set InstName SubbandBand0TopQ610_flow_control_loop_pipe_sequential_init_U
set CompName SubbandBand0TopQ610_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix SubbandBand0TopQ610_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}



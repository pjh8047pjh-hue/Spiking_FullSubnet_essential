# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_sparsemux_15_8_16_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {auto}
}


set id 3158
set name SubbandBand0TopQ610_mac_muladd_16s_16s_34s_34_3_1
set corename simcore_mac
set op mac
set stage_num 3
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 16
set in0_signed 1
set in1_width 16
set in1_signed 1
set in2_width 34
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 34
set arg_lists {i0 {16 1 +} i1 {16 1 +} m {32 1 +} i2 {34 1 +} p {34 1 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 2 ALLOW_PRAGMA 1
}


set op mac
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
    id 3449 \
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


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3192 \
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
    id 3193 \
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
    id 3194 \
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
    id 3195 \
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
    id 3196 \
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
    id 3197 \
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
    id 3198 \
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
    id 3199 \
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
    id 3200 \
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
    id 3201 \
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
    id 3202 \
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
    id 3203 \
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
    id 3204 \
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
    id 3205 \
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
    id 3206 \
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
    id 3207 \
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
    id 3208 \
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
    id 3209 \
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
    id 3210 \
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
    id 3211 \
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
    id 3212 \
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
    id 3213 \
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
    id 3214 \
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
    id 3215 \
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
    id 3216 \
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
    id 3217 \
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
    id 3218 \
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
    id 3219 \
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
    id 3220 \
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
    id 3221 \
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
    id 3222 \
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
    id 3223 \
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
    id 3224 \
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
    id 3225 \
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
    id 3226 \
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
    id 3227 \
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
    id 3228 \
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
    id 3229 \
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
    id 3230 \
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
    id 3231 \
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
    id 3232 \
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
    id 3233 \
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
    id 3234 \
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
    id 3235 \
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
    id 3236 \
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
    id 3237 \
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
    id 3238 \
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
    id 3239 \
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
    id 3240 \
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
    id 3241 \
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
    id 3242 \
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
    id 3243 \
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
    id 3244 \
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
    id 3245 \
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
    id 3246 \
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
    id 3247 \
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
    id 3248 \
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
    id 3249 \
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
    id 3250 \
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
    id 3251 \
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
    id 3252 \
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
    id 3253 \
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
    id 3254 \
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
    id 3255 \
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
    id 3256 \
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
    id 3257 \
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
    id 3258 \
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
    id 3259 \
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
    id 3260 \
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
    id 3261 \
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
    id 3262 \
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
    id 3263 \
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
    id 3264 \
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
    id 3265 \
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
    id 3266 \
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
    id 3267 \
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
    id 3268 \
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
    id 3269 \
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
    id 3270 \
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
    id 3271 \
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
    id 3272 \
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
    id 3273 \
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
    id 3274 \
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
    id 3275 \
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
    id 3276 \
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
    id 3277 \
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
    id 3278 \
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
    id 3279 \
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
    id 3280 \
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
    id 3281 \
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
    id 3282 \
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
    id 3283 \
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
    id 3284 \
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
    id 3285 \
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
    id 3286 \
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
    id 3287 \
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
    id 3288 \
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
    id 3289 \
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
    id 3290 \
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
    id 3291 \
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
    id 3292 \
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
    id 3293 \
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
    id 3294 \
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
    id 3295 \
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
    id 3296 \
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
    id 3297 \
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
    id 3298 \
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
    id 3299 \
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
    id 3300 \
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
    id 3301 \
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
    id 3302 \
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
    id 3303 \
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
    id 3304 \
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
    id 3305 \
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
    id 3306 \
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
    id 3307 \
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
    id 3308 \
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
    id 3309 \
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
    id 3310 \
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
    id 3311 \
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
    id 3312 \
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
    id 3313 \
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
    id 3314 \
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
    id 3315 \
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
    id 3316 \
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
    id 3317 \
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
    id 3318 \
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
    id 3319 \
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
    id 3320 \
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
    id 3321 \
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
    id 3322 \
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
    id 3323 \
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
    id 3324 \
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
    id 3325 \
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
    id 3326 \
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
    id 3327 \
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
    id 3328 \
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
    id 3329 \
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
    id 3330 \
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
    id 3331 \
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
    id 3332 \
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
    id 3333 \
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
    id 3334 \
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
    id 3335 \
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
    id 3336 \
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
    id 3337 \
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
    id 3338 \
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
    id 3339 \
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
    id 3340 \
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
    id 3341 \
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
    id 3342 \
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
    id 3343 \
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
    id 3344 \
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
    id 3345 \
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
    id 3346 \
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
    id 3347 \
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
    id 3348 \
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
    id 3349 \
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
    id 3350 \
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
    id 3351 \
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
    id 3352 \
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
    id 3353 \
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
    id 3354 \
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
    id 3355 \
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
    id 3356 \
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
    id 3357 \
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
    id 3358 \
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
    id 3359 \
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
    id 3360 \
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
    id 3361 \
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
    id 3362 \
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
    id 3363 \
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
    id 3364 \
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
    id 3365 \
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
    id 3366 \
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
    id 3367 \
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
    id 3368 \
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
    id 3369 \
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
    id 3370 \
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
    id 3371 \
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
    id 3372 \
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
    id 3373 \
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
    id 3374 \
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
    id 3375 \
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
    id 3376 \
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
    id 3377 \
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
    id 3378 \
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
    id 3379 \
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
    id 3380 \
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
    id 3381 \
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
    id 3382 \
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
    id 3383 \
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
    id 3384 \
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
    id 3385 \
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
    id 3386 \
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
    id 3387 \
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
    id 3388 \
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
    id 3389 \
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
    id 3390 \
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
    id 3391 \
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
    id 3392 \
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
    id 3393 \
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
    id 3394 \
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
    id 3395 \
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
    id 3396 \
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
    id 3397 \
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
    id 3398 \
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
    id 3399 \
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
    id 3400 \
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
    id 3401 \
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
    id 3402 \
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
    id 3403 \
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
    id 3404 \
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
    id 3405 \
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
    id 3406 \
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
    id 3407 \
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
    id 3408 \
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
    id 3409 \
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
    id 3410 \
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
    id 3411 \
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
    id 3412 \
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
    id 3413 \
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
    id 3414 \
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
    id 3415 \
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
    id 3416 \
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
    id 3417 \
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
    id 3418 \
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
    id 3419 \
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
    id 3420 \
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
    id 3421 \
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
    id 3422 \
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
    id 3423 \
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
    id 3424 \
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
    id 3425 \
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
    id 3426 \
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
    id 3427 \
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
    id 3428 \
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
    id 3429 \
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
    id 3430 \
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
    id 3431 \
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
    id 3432 \
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
    id 3433 \
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
    id 3434 \
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
    id 3435 \
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
    id 3436 \
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
    id 3437 \
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
    id 3438 \
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
    id 3439 \
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
    id 3440 \
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
    id 3441 \
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
    id 3442 \
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
    id 3443 \
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
    id 3444 \
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
    id 3445 \
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
    id 3446 \
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
    id 3447 \
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
    id 3448 \
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



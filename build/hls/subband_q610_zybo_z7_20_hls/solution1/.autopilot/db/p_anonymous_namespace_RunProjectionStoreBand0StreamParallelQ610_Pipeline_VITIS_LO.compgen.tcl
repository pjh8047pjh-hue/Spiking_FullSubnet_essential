# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandBand0TopQ610_sparsemux_113_8_16_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {auto}
}


set name SubbandBand0TopQ610_urem_6ns_6ns_5_10_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {urem} IMPL {auto} LATENCY 9 ALLOW_PRAGMA 1
}


set name SubbandBand0TopQ610_urem_5ns_4ns_3_9_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {urem} IMPL {auto} LATENCY 8 ALLOW_PRAGMA 1
}


set name SubbandBand0TopQ610_mul_5ns_7ns_11_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name SubbandBand0TopQ610_mul_6ns_8ns_13_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set id 5582
set name SubbandBand0TopQ610_mac_muladd_16s_16s_37s_37_3_1
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
set in2_width 37
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 37
set arg_lists {i0 {16 1 +} i1 {16 1 +} m {32 1 +} i2 {37 1 +} p {37 1 +} c_reg {1} rnd {0} acc {0} }
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


set id 5586
set name SubbandBand0TopQ610_mac_muladd_8ns_12ns_12ns_19_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 8
set in0_signed 0
set in1_width 12
set in1_signed 0
set in2_width 12
set in2_signed 0
set ce_width 1
set ce_signed 0
set out_width 19
set arg_lists {i0 {8 0 +} i1 {12 0 +} m {19 1 +} i2 {12 0 +} p {19 0 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3 ALLOW_PRAGMA 1
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
    id 5822 \
    name proj_bias_local \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename proj_bias_local \
    op interface \
    ports { proj_bias_local_address0 { O 6 vector } proj_bias_local_ce0 { O 1 bit } proj_bias_local_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'proj_bias_local'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5823 \
    name SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i \
    op interface \
    ports { SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_address0 { O 12 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_ce0 { O 1 bit } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5594 \
    name input_buffer_224_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_224_reload \
    op interface \
    ports { input_buffer_224_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5595 \
    name input_buffer_228_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_228_reload \
    op interface \
    ports { input_buffer_228_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5596 \
    name input_buffer_232_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_232_reload \
    op interface \
    ports { input_buffer_232_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5597 \
    name input_buffer_236_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_236_reload \
    op interface \
    ports { input_buffer_236_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5598 \
    name input_buffer_240_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_240_reload \
    op interface \
    ports { input_buffer_240_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5599 \
    name input_buffer_244_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_244_reload \
    op interface \
    ports { input_buffer_244_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5600 \
    name input_buffer_248_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_248_reload \
    op interface \
    ports { input_buffer_248_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5601 \
    name input_buffer_252_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_252_reload \
    op interface \
    ports { input_buffer_252_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5602 \
    name input_buffer_256_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_256_reload \
    op interface \
    ports { input_buffer_256_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5603 \
    name input_buffer_260_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_260_reload \
    op interface \
    ports { input_buffer_260_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5604 \
    name input_buffer_264_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_264_reload \
    op interface \
    ports { input_buffer_264_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5605 \
    name input_buffer_268_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_268_reload \
    op interface \
    ports { input_buffer_268_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5606 \
    name input_buffer_272_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_272_reload \
    op interface \
    ports { input_buffer_272_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5607 \
    name input_buffer_276_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_276_reload \
    op interface \
    ports { input_buffer_276_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5608 \
    name input_buffer_280_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_280_reload \
    op interface \
    ports { input_buffer_280_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5609 \
    name input_buffer_284_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_284_reload \
    op interface \
    ports { input_buffer_284_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5610 \
    name input_buffer_288_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_288_reload \
    op interface \
    ports { input_buffer_288_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5611 \
    name input_buffer_292_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_292_reload \
    op interface \
    ports { input_buffer_292_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5612 \
    name input_buffer_296_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_296_reload \
    op interface \
    ports { input_buffer_296_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5613 \
    name input_buffer_300_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_300_reload \
    op interface \
    ports { input_buffer_300_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5614 \
    name input_buffer_304_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_304_reload \
    op interface \
    ports { input_buffer_304_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5615 \
    name input_buffer_308_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_308_reload \
    op interface \
    ports { input_buffer_308_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5616 \
    name input_buffer_312_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_312_reload \
    op interface \
    ports { input_buffer_312_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5617 \
    name input_buffer_316_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_316_reload \
    op interface \
    ports { input_buffer_316_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5618 \
    name input_buffer_320_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_320_reload \
    op interface \
    ports { input_buffer_320_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5619 \
    name input_buffer_324_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_324_reload \
    op interface \
    ports { input_buffer_324_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5620 \
    name input_buffer_328_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_328_reload \
    op interface \
    ports { input_buffer_328_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5621 \
    name input_buffer_332_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_332_reload \
    op interface \
    ports { input_buffer_332_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5622 \
    name input_buffer_336_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_336_reload \
    op interface \
    ports { input_buffer_336_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5623 \
    name input_buffer_340_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_340_reload \
    op interface \
    ports { input_buffer_340_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5624 \
    name input_buffer_344_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_344_reload \
    op interface \
    ports { input_buffer_344_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5625 \
    name input_buffer_348_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_348_reload \
    op interface \
    ports { input_buffer_348_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5626 \
    name input_buffer_352_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_352_reload \
    op interface \
    ports { input_buffer_352_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5627 \
    name input_buffer_356_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_356_reload \
    op interface \
    ports { input_buffer_356_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5628 \
    name input_buffer_360_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_360_reload \
    op interface \
    ports { input_buffer_360_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5629 \
    name input_buffer_364_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_364_reload \
    op interface \
    ports { input_buffer_364_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5630 \
    name input_buffer_368_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_368_reload \
    op interface \
    ports { input_buffer_368_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5631 \
    name input_buffer_372_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_372_reload \
    op interface \
    ports { input_buffer_372_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5632 \
    name input_buffer_376_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_376_reload \
    op interface \
    ports { input_buffer_376_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5633 \
    name input_buffer_380_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_380_reload \
    op interface \
    ports { input_buffer_380_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5634 \
    name input_buffer_384_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_384_reload \
    op interface \
    ports { input_buffer_384_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5635 \
    name input_buffer_388_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_388_reload \
    op interface \
    ports { input_buffer_388_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5636 \
    name input_buffer_392_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_392_reload \
    op interface \
    ports { input_buffer_392_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5637 \
    name input_buffer_396_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_396_reload \
    op interface \
    ports { input_buffer_396_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5638 \
    name input_buffer_400_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_400_reload \
    op interface \
    ports { input_buffer_400_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5639 \
    name input_buffer_404_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_404_reload \
    op interface \
    ports { input_buffer_404_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5640 \
    name input_buffer_408_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_408_reload \
    op interface \
    ports { input_buffer_408_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5641 \
    name input_buffer_412_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_412_reload \
    op interface \
    ports { input_buffer_412_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5642 \
    name input_buffer_416_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_416_reload \
    op interface \
    ports { input_buffer_416_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5643 \
    name input_buffer_420_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_420_reload \
    op interface \
    ports { input_buffer_420_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5644 \
    name input_buffer_424_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_424_reload \
    op interface \
    ports { input_buffer_424_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5645 \
    name input_buffer_428_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_428_reload \
    op interface \
    ports { input_buffer_428_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5646 \
    name input_buffer_432_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_432_reload \
    op interface \
    ports { input_buffer_432_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5647 \
    name input_buffer_436_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_436_reload \
    op interface \
    ports { input_buffer_436_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5648 \
    name input_buffer_440_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_440_reload \
    op interface \
    ports { input_buffer_440_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5649 \
    name input_buffer_444_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_444_reload \
    op interface \
    ports { input_buffer_444_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5650 \
    name input_buffer_225_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_225_reload \
    op interface \
    ports { input_buffer_225_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5651 \
    name input_buffer_229_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_229_reload \
    op interface \
    ports { input_buffer_229_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5652 \
    name input_buffer_233_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_233_reload \
    op interface \
    ports { input_buffer_233_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5653 \
    name input_buffer_237_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_237_reload \
    op interface \
    ports { input_buffer_237_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5654 \
    name input_buffer_241_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_241_reload \
    op interface \
    ports { input_buffer_241_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5655 \
    name input_buffer_245_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_245_reload \
    op interface \
    ports { input_buffer_245_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5656 \
    name input_buffer_249_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_249_reload \
    op interface \
    ports { input_buffer_249_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5657 \
    name input_buffer_253_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_253_reload \
    op interface \
    ports { input_buffer_253_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5658 \
    name input_buffer_257_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_257_reload \
    op interface \
    ports { input_buffer_257_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5659 \
    name input_buffer_261_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_261_reload \
    op interface \
    ports { input_buffer_261_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5660 \
    name input_buffer_265_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_265_reload \
    op interface \
    ports { input_buffer_265_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5661 \
    name input_buffer_269_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_269_reload \
    op interface \
    ports { input_buffer_269_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5662 \
    name input_buffer_273_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_273_reload \
    op interface \
    ports { input_buffer_273_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5663 \
    name input_buffer_277_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_277_reload \
    op interface \
    ports { input_buffer_277_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5664 \
    name input_buffer_281_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_281_reload \
    op interface \
    ports { input_buffer_281_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5665 \
    name input_buffer_285_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_285_reload \
    op interface \
    ports { input_buffer_285_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5666 \
    name input_buffer_289_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_289_reload \
    op interface \
    ports { input_buffer_289_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5667 \
    name input_buffer_293_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_293_reload \
    op interface \
    ports { input_buffer_293_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5668 \
    name input_buffer_297_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_297_reload \
    op interface \
    ports { input_buffer_297_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5669 \
    name input_buffer_301_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_301_reload \
    op interface \
    ports { input_buffer_301_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5670 \
    name input_buffer_305_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_305_reload \
    op interface \
    ports { input_buffer_305_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5671 \
    name input_buffer_309_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_309_reload \
    op interface \
    ports { input_buffer_309_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5672 \
    name input_buffer_313_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_313_reload \
    op interface \
    ports { input_buffer_313_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5673 \
    name input_buffer_317_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_317_reload \
    op interface \
    ports { input_buffer_317_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5674 \
    name input_buffer_321_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_321_reload \
    op interface \
    ports { input_buffer_321_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5675 \
    name input_buffer_325_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_325_reload \
    op interface \
    ports { input_buffer_325_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5676 \
    name input_buffer_329_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_329_reload \
    op interface \
    ports { input_buffer_329_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5677 \
    name input_buffer_333_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_333_reload \
    op interface \
    ports { input_buffer_333_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5678 \
    name input_buffer_337_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_337_reload \
    op interface \
    ports { input_buffer_337_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5679 \
    name input_buffer_341_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_341_reload \
    op interface \
    ports { input_buffer_341_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5680 \
    name input_buffer_345_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_345_reload \
    op interface \
    ports { input_buffer_345_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5681 \
    name input_buffer_349_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_349_reload \
    op interface \
    ports { input_buffer_349_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5682 \
    name input_buffer_353_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_353_reload \
    op interface \
    ports { input_buffer_353_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5683 \
    name input_buffer_357_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_357_reload \
    op interface \
    ports { input_buffer_357_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5684 \
    name input_buffer_361_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_361_reload \
    op interface \
    ports { input_buffer_361_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5685 \
    name input_buffer_365_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_365_reload \
    op interface \
    ports { input_buffer_365_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5686 \
    name input_buffer_369_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_369_reload \
    op interface \
    ports { input_buffer_369_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5687 \
    name input_buffer_373_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_373_reload \
    op interface \
    ports { input_buffer_373_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5688 \
    name input_buffer_377_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_377_reload \
    op interface \
    ports { input_buffer_377_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5689 \
    name input_buffer_381_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_381_reload \
    op interface \
    ports { input_buffer_381_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5690 \
    name input_buffer_385_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_385_reload \
    op interface \
    ports { input_buffer_385_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5691 \
    name input_buffer_389_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_389_reload \
    op interface \
    ports { input_buffer_389_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5692 \
    name input_buffer_393_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_393_reload \
    op interface \
    ports { input_buffer_393_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5693 \
    name input_buffer_397_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_397_reload \
    op interface \
    ports { input_buffer_397_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5694 \
    name input_buffer_401_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_401_reload \
    op interface \
    ports { input_buffer_401_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5695 \
    name input_buffer_405_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_405_reload \
    op interface \
    ports { input_buffer_405_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5696 \
    name input_buffer_409_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_409_reload \
    op interface \
    ports { input_buffer_409_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5697 \
    name input_buffer_413_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_413_reload \
    op interface \
    ports { input_buffer_413_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5698 \
    name input_buffer_417_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_417_reload \
    op interface \
    ports { input_buffer_417_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5699 \
    name input_buffer_421_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_421_reload \
    op interface \
    ports { input_buffer_421_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5700 \
    name input_buffer_425_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_425_reload \
    op interface \
    ports { input_buffer_425_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5701 \
    name input_buffer_429_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_429_reload \
    op interface \
    ports { input_buffer_429_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5702 \
    name input_buffer_433_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_433_reload \
    op interface \
    ports { input_buffer_433_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5703 \
    name input_buffer_437_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_437_reload \
    op interface \
    ports { input_buffer_437_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5704 \
    name input_buffer_441_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_441_reload \
    op interface \
    ports { input_buffer_441_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5705 \
    name input_buffer_445_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_445_reload \
    op interface \
    ports { input_buffer_445_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5706 \
    name input_buffer_226_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_226_reload \
    op interface \
    ports { input_buffer_226_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5707 \
    name input_buffer_230_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_230_reload \
    op interface \
    ports { input_buffer_230_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5708 \
    name input_buffer_234_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_234_reload \
    op interface \
    ports { input_buffer_234_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5709 \
    name input_buffer_238_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_238_reload \
    op interface \
    ports { input_buffer_238_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5710 \
    name input_buffer_242_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_242_reload \
    op interface \
    ports { input_buffer_242_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5711 \
    name input_buffer_246_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_246_reload \
    op interface \
    ports { input_buffer_246_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5712 \
    name input_buffer_250_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_250_reload \
    op interface \
    ports { input_buffer_250_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5713 \
    name input_buffer_254_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_254_reload \
    op interface \
    ports { input_buffer_254_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5714 \
    name input_buffer_258_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_258_reload \
    op interface \
    ports { input_buffer_258_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5715 \
    name input_buffer_262_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_262_reload \
    op interface \
    ports { input_buffer_262_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5716 \
    name input_buffer_266_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_266_reload \
    op interface \
    ports { input_buffer_266_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5717 \
    name input_buffer_270_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_270_reload \
    op interface \
    ports { input_buffer_270_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5718 \
    name input_buffer_274_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_274_reload \
    op interface \
    ports { input_buffer_274_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5719 \
    name input_buffer_278_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_278_reload \
    op interface \
    ports { input_buffer_278_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5720 \
    name input_buffer_282_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_282_reload \
    op interface \
    ports { input_buffer_282_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5721 \
    name input_buffer_286_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_286_reload \
    op interface \
    ports { input_buffer_286_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5722 \
    name input_buffer_290_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_290_reload \
    op interface \
    ports { input_buffer_290_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5723 \
    name input_buffer_294_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_294_reload \
    op interface \
    ports { input_buffer_294_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5724 \
    name input_buffer_298_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_298_reload \
    op interface \
    ports { input_buffer_298_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5725 \
    name input_buffer_302_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_302_reload \
    op interface \
    ports { input_buffer_302_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5726 \
    name input_buffer_306_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_306_reload \
    op interface \
    ports { input_buffer_306_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5727 \
    name input_buffer_310_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_310_reload \
    op interface \
    ports { input_buffer_310_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5728 \
    name input_buffer_314_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_314_reload \
    op interface \
    ports { input_buffer_314_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5729 \
    name input_buffer_318_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_318_reload \
    op interface \
    ports { input_buffer_318_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5730 \
    name input_buffer_322_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_322_reload \
    op interface \
    ports { input_buffer_322_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5731 \
    name input_buffer_326_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_326_reload \
    op interface \
    ports { input_buffer_326_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5732 \
    name input_buffer_330_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_330_reload \
    op interface \
    ports { input_buffer_330_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5733 \
    name input_buffer_334_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_334_reload \
    op interface \
    ports { input_buffer_334_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5734 \
    name input_buffer_338_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_338_reload \
    op interface \
    ports { input_buffer_338_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5735 \
    name input_buffer_342_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_342_reload \
    op interface \
    ports { input_buffer_342_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5736 \
    name input_buffer_346_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_346_reload \
    op interface \
    ports { input_buffer_346_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5737 \
    name input_buffer_350_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_350_reload \
    op interface \
    ports { input_buffer_350_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5738 \
    name input_buffer_354_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_354_reload \
    op interface \
    ports { input_buffer_354_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5739 \
    name input_buffer_358_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_358_reload \
    op interface \
    ports { input_buffer_358_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5740 \
    name input_buffer_362_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_362_reload \
    op interface \
    ports { input_buffer_362_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5741 \
    name input_buffer_366_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_366_reload \
    op interface \
    ports { input_buffer_366_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5742 \
    name input_buffer_370_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_370_reload \
    op interface \
    ports { input_buffer_370_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5743 \
    name input_buffer_374_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_374_reload \
    op interface \
    ports { input_buffer_374_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5744 \
    name input_buffer_378_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_378_reload \
    op interface \
    ports { input_buffer_378_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5745 \
    name input_buffer_382_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_382_reload \
    op interface \
    ports { input_buffer_382_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5746 \
    name input_buffer_386_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_386_reload \
    op interface \
    ports { input_buffer_386_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5747 \
    name input_buffer_390_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_390_reload \
    op interface \
    ports { input_buffer_390_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5748 \
    name input_buffer_394_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_394_reload \
    op interface \
    ports { input_buffer_394_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5749 \
    name input_buffer_398_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_398_reload \
    op interface \
    ports { input_buffer_398_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5750 \
    name input_buffer_402_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_402_reload \
    op interface \
    ports { input_buffer_402_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5751 \
    name input_buffer_406_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_406_reload \
    op interface \
    ports { input_buffer_406_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5752 \
    name input_buffer_410_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_410_reload \
    op interface \
    ports { input_buffer_410_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5753 \
    name input_buffer_414_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_414_reload \
    op interface \
    ports { input_buffer_414_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5754 \
    name input_buffer_418_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_418_reload \
    op interface \
    ports { input_buffer_418_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5755 \
    name input_buffer_422_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_422_reload \
    op interface \
    ports { input_buffer_422_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5756 \
    name input_buffer_426_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_426_reload \
    op interface \
    ports { input_buffer_426_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5757 \
    name input_buffer_430_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_430_reload \
    op interface \
    ports { input_buffer_430_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5758 \
    name input_buffer_434_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_434_reload \
    op interface \
    ports { input_buffer_434_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5759 \
    name input_buffer_438_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_438_reload \
    op interface \
    ports { input_buffer_438_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5760 \
    name input_buffer_442_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_442_reload \
    op interface \
    ports { input_buffer_442_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5761 \
    name input_buffer_446_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_446_reload \
    op interface \
    ports { input_buffer_446_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5762 \
    name input_buffer_227_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_227_reload \
    op interface \
    ports { input_buffer_227_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5763 \
    name input_buffer_231_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_231_reload \
    op interface \
    ports { input_buffer_231_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5764 \
    name input_buffer_235_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_235_reload \
    op interface \
    ports { input_buffer_235_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5765 \
    name input_buffer_239_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_239_reload \
    op interface \
    ports { input_buffer_239_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5766 \
    name input_buffer_243_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_243_reload \
    op interface \
    ports { input_buffer_243_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5767 \
    name input_buffer_247_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_247_reload \
    op interface \
    ports { input_buffer_247_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5768 \
    name input_buffer_251_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_251_reload \
    op interface \
    ports { input_buffer_251_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5769 \
    name input_buffer_255_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_255_reload \
    op interface \
    ports { input_buffer_255_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5770 \
    name input_buffer_259_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_259_reload \
    op interface \
    ports { input_buffer_259_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5771 \
    name input_buffer_263_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_263_reload \
    op interface \
    ports { input_buffer_263_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5772 \
    name input_buffer_267_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_267_reload \
    op interface \
    ports { input_buffer_267_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5773 \
    name input_buffer_271_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_271_reload \
    op interface \
    ports { input_buffer_271_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5774 \
    name input_buffer_275_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_275_reload \
    op interface \
    ports { input_buffer_275_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5775 \
    name input_buffer_279_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_279_reload \
    op interface \
    ports { input_buffer_279_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5776 \
    name input_buffer_283_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_283_reload \
    op interface \
    ports { input_buffer_283_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5777 \
    name input_buffer_287_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_287_reload \
    op interface \
    ports { input_buffer_287_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5778 \
    name input_buffer_291_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_291_reload \
    op interface \
    ports { input_buffer_291_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5779 \
    name input_buffer_295_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_295_reload \
    op interface \
    ports { input_buffer_295_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5780 \
    name input_buffer_299_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_299_reload \
    op interface \
    ports { input_buffer_299_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5781 \
    name input_buffer_303_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_303_reload \
    op interface \
    ports { input_buffer_303_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5782 \
    name input_buffer_307_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_307_reload \
    op interface \
    ports { input_buffer_307_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5783 \
    name input_buffer_311_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_311_reload \
    op interface \
    ports { input_buffer_311_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5784 \
    name input_buffer_315_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_315_reload \
    op interface \
    ports { input_buffer_315_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5785 \
    name input_buffer_319_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_319_reload \
    op interface \
    ports { input_buffer_319_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5786 \
    name input_buffer_323_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_323_reload \
    op interface \
    ports { input_buffer_323_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5787 \
    name input_buffer_327_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_327_reload \
    op interface \
    ports { input_buffer_327_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5788 \
    name input_buffer_331_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_331_reload \
    op interface \
    ports { input_buffer_331_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5789 \
    name input_buffer_335_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_335_reload \
    op interface \
    ports { input_buffer_335_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5790 \
    name input_buffer_339_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_339_reload \
    op interface \
    ports { input_buffer_339_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5791 \
    name input_buffer_343_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_343_reload \
    op interface \
    ports { input_buffer_343_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5792 \
    name input_buffer_347_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_347_reload \
    op interface \
    ports { input_buffer_347_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5793 \
    name input_buffer_351_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_351_reload \
    op interface \
    ports { input_buffer_351_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5794 \
    name input_buffer_355_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_355_reload \
    op interface \
    ports { input_buffer_355_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5795 \
    name input_buffer_359_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_359_reload \
    op interface \
    ports { input_buffer_359_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5796 \
    name input_buffer_363_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_363_reload \
    op interface \
    ports { input_buffer_363_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5797 \
    name input_buffer_367_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_367_reload \
    op interface \
    ports { input_buffer_367_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5798 \
    name input_buffer_371_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_371_reload \
    op interface \
    ports { input_buffer_371_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5799 \
    name input_buffer_375_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_375_reload \
    op interface \
    ports { input_buffer_375_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5800 \
    name input_buffer_379_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_379_reload \
    op interface \
    ports { input_buffer_379_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5801 \
    name input_buffer_383_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_383_reload \
    op interface \
    ports { input_buffer_383_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5802 \
    name input_buffer_387_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_387_reload \
    op interface \
    ports { input_buffer_387_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5803 \
    name input_buffer_391_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_391_reload \
    op interface \
    ports { input_buffer_391_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5804 \
    name input_buffer_395_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_395_reload \
    op interface \
    ports { input_buffer_395_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5805 \
    name input_buffer_399_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_399_reload \
    op interface \
    ports { input_buffer_399_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5806 \
    name input_buffer_403_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_403_reload \
    op interface \
    ports { input_buffer_403_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5807 \
    name input_buffer_407_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_407_reload \
    op interface \
    ports { input_buffer_407_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5808 \
    name input_buffer_411_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_411_reload \
    op interface \
    ports { input_buffer_411_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5809 \
    name input_buffer_415_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_415_reload \
    op interface \
    ports { input_buffer_415_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5810 \
    name input_buffer_419_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_419_reload \
    op interface \
    ports { input_buffer_419_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5811 \
    name input_buffer_423_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_423_reload \
    op interface \
    ports { input_buffer_423_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5812 \
    name input_buffer_427_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_427_reload \
    op interface \
    ports { input_buffer_427_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5813 \
    name input_buffer_431_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_431_reload \
    op interface \
    ports { input_buffer_431_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5814 \
    name input_buffer_435_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_435_reload \
    op interface \
    ports { input_buffer_435_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5815 \
    name input_buffer_439_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_439_reload \
    op interface \
    ports { input_buffer_439_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5816 \
    name input_buffer_443_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_443_reload \
    op interface \
    ports { input_buffer_443_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5817 \
    name input_buffer_447_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_447_reload \
    op interface \
    ports { input_buffer_447_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5818 \
    name mul \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mul \
    op interface \
    ports { mul { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5819 \
    name zext_ln2073 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln2073 \
    op interface \
    ports { zext_ln2073 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5820 \
    name df_coef_q610_load \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_df_coef_q610_load \
    op interface \
    ports { df_coef_q610_load { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5821 \
    name gmem_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem_out \
    op interface \
    ports { m_axi_gmem_out_AWVALID { O 1 bit } m_axi_gmem_out_AWREADY { I 1 bit } m_axi_gmem_out_AWADDR { O 32 vector } m_axi_gmem_out_AWID { O 1 vector } m_axi_gmem_out_AWLEN { O 32 vector } m_axi_gmem_out_AWSIZE { O 3 vector } m_axi_gmem_out_AWBURST { O 2 vector } m_axi_gmem_out_AWLOCK { O 2 vector } m_axi_gmem_out_AWCACHE { O 4 vector } m_axi_gmem_out_AWPROT { O 3 vector } m_axi_gmem_out_AWQOS { O 4 vector } m_axi_gmem_out_AWREGION { O 4 vector } m_axi_gmem_out_AWUSER { O 1 vector } m_axi_gmem_out_WVALID { O 1 bit } m_axi_gmem_out_WREADY { I 1 bit } m_axi_gmem_out_WDATA { O 16 vector } m_axi_gmem_out_WSTRB { O 2 vector } m_axi_gmem_out_WLAST { O 1 bit } m_axi_gmem_out_WID { O 1 vector } m_axi_gmem_out_WUSER { O 1 vector } m_axi_gmem_out_ARVALID { O 1 bit } m_axi_gmem_out_ARREADY { I 1 bit } m_axi_gmem_out_ARADDR { O 32 vector } m_axi_gmem_out_ARID { O 1 vector } m_axi_gmem_out_ARLEN { O 32 vector } m_axi_gmem_out_ARSIZE { O 3 vector } m_axi_gmem_out_ARBURST { O 2 vector } m_axi_gmem_out_ARLOCK { O 2 vector } m_axi_gmem_out_ARCACHE { O 4 vector } m_axi_gmem_out_ARPROT { O 3 vector } m_axi_gmem_out_ARQOS { O 4 vector } m_axi_gmem_out_ARREGION { O 4 vector } m_axi_gmem_out_ARUSER { O 1 vector } m_axi_gmem_out_RVALID { I 1 bit } m_axi_gmem_out_RREADY { O 1 bit } m_axi_gmem_out_RDATA { I 16 vector } m_axi_gmem_out_RLAST { I 1 bit } m_axi_gmem_out_RID { I 1 vector } m_axi_gmem_out_RFIFONUM { I 6 vector } m_axi_gmem_out_RUSER { I 1 vector } m_axi_gmem_out_RRESP { I 2 vector } m_axi_gmem_out_BVALID { I 1 bit } m_axi_gmem_out_BREADY { O 1 bit } m_axi_gmem_out_BRESP { I 2 vector } m_axi_gmem_out_BID { I 1 vector } m_axi_gmem_out_BUSER { I 1 vector } } \
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



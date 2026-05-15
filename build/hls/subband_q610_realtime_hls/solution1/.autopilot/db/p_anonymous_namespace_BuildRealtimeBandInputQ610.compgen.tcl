# This script segment is generated automatically by AutoPilot

set id 4423
set name SubbandRealtimeTopQ610Ip_mac_muladd_7ns_3ns_8ns_10_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 7
set in0_signed 0
set in1_width 3
set in1_signed 0
set in2_width 8
set in2_signed 0
set ce_width 1
set ce_signed 0
set out_width 10
set arg_lists {i0 {7 0 +} i1 {3 0 +} m {10 1 +} i2 {8 0 +} p {10 0 +} c_reg {1} rnd {0} acc {0} }
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
    id 4429 \
    name noisy_frame \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename noisy_frame \
    op interface \
    ports { noisy_frame_address0 { O 10 vector } noisy_frame_ce0 { O 1 bit } noisy_frame_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'noisy_frame'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 4431 \
    name fb_frame \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename fb_frame \
    op interface \
    ports { fb_frame_address0 { O 10 vector } fb_frame_ce0 { O 1 bit } fb_frame_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'fb_frame'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4425 \
    name p_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read \
    op interface \
    ports { p_read { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4426 \
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
    id 4427 \
    name p_read3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read3 \
    op interface \
    ports { p_read3 { I 7 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4428 \
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
    id 4430 \
    name noisy_frame_offset \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_noisy_frame_offset \
    op interface \
    ports { noisy_frame_offset { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4432 \
    name subband_index \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_subband_index \
    op interface \
    ports { subband_index { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4433 \
    name input_buffer_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_0 \
    op interface \
    ports { input_buffer_0 { O 16 vector } input_buffer_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4434 \
    name input_buffer_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_1 \
    op interface \
    ports { input_buffer_1 { O 16 vector } input_buffer_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4435 \
    name input_buffer_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_2 \
    op interface \
    ports { input_buffer_2 { O 16 vector } input_buffer_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4436 \
    name input_buffer_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_3 \
    op interface \
    ports { input_buffer_3 { O 16 vector } input_buffer_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4437 \
    name input_buffer_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_4 \
    op interface \
    ports { input_buffer_4 { O 16 vector } input_buffer_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4438 \
    name input_buffer_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_5 \
    op interface \
    ports { input_buffer_5 { O 16 vector } input_buffer_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4439 \
    name input_buffer_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_6 \
    op interface \
    ports { input_buffer_6 { O 16 vector } input_buffer_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4440 \
    name input_buffer_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_7 \
    op interface \
    ports { input_buffer_7 { O 16 vector } input_buffer_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4441 \
    name input_buffer_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_8 \
    op interface \
    ports { input_buffer_8 { O 16 vector } input_buffer_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4442 \
    name input_buffer_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_9 \
    op interface \
    ports { input_buffer_9 { O 16 vector } input_buffer_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4443 \
    name input_buffer_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_10 \
    op interface \
    ports { input_buffer_10 { O 16 vector } input_buffer_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4444 \
    name input_buffer_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_11 \
    op interface \
    ports { input_buffer_11 { O 16 vector } input_buffer_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4445 \
    name input_buffer_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_12 \
    op interface \
    ports { input_buffer_12 { O 16 vector } input_buffer_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4446 \
    name input_buffer_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_13 \
    op interface \
    ports { input_buffer_13 { O 16 vector } input_buffer_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4447 \
    name input_buffer_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_14 \
    op interface \
    ports { input_buffer_14 { O 16 vector } input_buffer_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4448 \
    name input_buffer_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_15 \
    op interface \
    ports { input_buffer_15 { O 16 vector } input_buffer_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4449 \
    name input_buffer_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_16 \
    op interface \
    ports { input_buffer_16 { O 16 vector } input_buffer_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4450 \
    name input_buffer_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_17 \
    op interface \
    ports { input_buffer_17 { O 16 vector } input_buffer_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4451 \
    name input_buffer_18 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_18 \
    op interface \
    ports { input_buffer_18 { O 16 vector } input_buffer_18_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4452 \
    name input_buffer_19 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_19 \
    op interface \
    ports { input_buffer_19 { O 16 vector } input_buffer_19_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4453 \
    name input_buffer_20 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_20 \
    op interface \
    ports { input_buffer_20 { O 16 vector } input_buffer_20_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4454 \
    name input_buffer_21 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_21 \
    op interface \
    ports { input_buffer_21 { O 16 vector } input_buffer_21_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4455 \
    name input_buffer_22 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_22 \
    op interface \
    ports { input_buffer_22 { O 16 vector } input_buffer_22_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4456 \
    name input_buffer_23 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_23 \
    op interface \
    ports { input_buffer_23 { O 16 vector } input_buffer_23_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4457 \
    name input_buffer_24 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_24 \
    op interface \
    ports { input_buffer_24 { O 16 vector } input_buffer_24_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4458 \
    name input_buffer_25 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_25 \
    op interface \
    ports { input_buffer_25 { O 16 vector } input_buffer_25_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4459 \
    name input_buffer_26 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_26 \
    op interface \
    ports { input_buffer_26 { O 16 vector } input_buffer_26_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4460 \
    name input_buffer_27 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_27 \
    op interface \
    ports { input_buffer_27 { O 16 vector } input_buffer_27_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4461 \
    name input_buffer_28 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_28 \
    op interface \
    ports { input_buffer_28 { O 16 vector } input_buffer_28_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4462 \
    name input_buffer_29 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_29 \
    op interface \
    ports { input_buffer_29 { O 16 vector } input_buffer_29_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4463 \
    name input_buffer_30 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_30 \
    op interface \
    ports { input_buffer_30 { O 16 vector } input_buffer_30_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4464 \
    name input_buffer_31 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_31 \
    op interface \
    ports { input_buffer_31 { O 16 vector } input_buffer_31_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4465 \
    name input_buffer_32 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_32 \
    op interface \
    ports { input_buffer_32 { O 16 vector } input_buffer_32_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4466 \
    name input_buffer_33 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_33 \
    op interface \
    ports { input_buffer_33 { O 16 vector } input_buffer_33_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4467 \
    name input_buffer_34 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_34 \
    op interface \
    ports { input_buffer_34 { O 16 vector } input_buffer_34_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4468 \
    name input_buffer_35 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_35 \
    op interface \
    ports { input_buffer_35 { O 16 vector } input_buffer_35_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4469 \
    name input_buffer_36 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_36 \
    op interface \
    ports { input_buffer_36 { O 16 vector } input_buffer_36_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4470 \
    name input_buffer_37 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_37 \
    op interface \
    ports { input_buffer_37 { O 16 vector } input_buffer_37_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4471 \
    name input_buffer_38 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_38 \
    op interface \
    ports { input_buffer_38 { O 16 vector } input_buffer_38_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4472 \
    name input_buffer_39 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_39 \
    op interface \
    ports { input_buffer_39 { O 16 vector } input_buffer_39_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4473 \
    name input_buffer_40 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_40 \
    op interface \
    ports { input_buffer_40 { O 16 vector } input_buffer_40_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4474 \
    name input_buffer_41 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_41 \
    op interface \
    ports { input_buffer_41 { O 16 vector } input_buffer_41_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4475 \
    name input_buffer_42 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_42 \
    op interface \
    ports { input_buffer_42 { O 16 vector } input_buffer_42_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4476 \
    name input_buffer_43 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_43 \
    op interface \
    ports { input_buffer_43 { O 16 vector } input_buffer_43_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4477 \
    name input_buffer_44 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_44 \
    op interface \
    ports { input_buffer_44 { O 16 vector } input_buffer_44_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4478 \
    name input_buffer_45 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_45 \
    op interface \
    ports { input_buffer_45 { O 16 vector } input_buffer_45_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4479 \
    name input_buffer_46 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_46 \
    op interface \
    ports { input_buffer_46 { O 16 vector } input_buffer_46_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4480 \
    name input_buffer_47 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_47 \
    op interface \
    ports { input_buffer_47 { O 16 vector } input_buffer_47_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4481 \
    name input_buffer_48 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_48 \
    op interface \
    ports { input_buffer_48 { O 16 vector } input_buffer_48_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4482 \
    name input_buffer_49 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_49 \
    op interface \
    ports { input_buffer_49 { O 16 vector } input_buffer_49_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4483 \
    name input_buffer_50 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_50 \
    op interface \
    ports { input_buffer_50 { O 16 vector } input_buffer_50_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4484 \
    name input_buffer_51 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_51 \
    op interface \
    ports { input_buffer_51 { O 16 vector } input_buffer_51_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4485 \
    name input_buffer_52 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_52 \
    op interface \
    ports { input_buffer_52 { O 16 vector } input_buffer_52_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4486 \
    name input_buffer_53 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_53 \
    op interface \
    ports { input_buffer_53 { O 16 vector } input_buffer_53_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4487 \
    name input_buffer_54 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_54 \
    op interface \
    ports { input_buffer_54 { O 16 vector } input_buffer_54_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4488 \
    name input_buffer_55 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_55 \
    op interface \
    ports { input_buffer_55 { O 16 vector } input_buffer_55_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4489 \
    name input_buffer_56 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_56 \
    op interface \
    ports { input_buffer_56 { O 16 vector } input_buffer_56_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4490 \
    name input_buffer_57 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_57 \
    op interface \
    ports { input_buffer_57 { O 16 vector } input_buffer_57_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4491 \
    name input_buffer_58 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_58 \
    op interface \
    ports { input_buffer_58 { O 16 vector } input_buffer_58_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4492 \
    name input_buffer_59 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_59 \
    op interface \
    ports { input_buffer_59 { O 16 vector } input_buffer_59_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4493 \
    name input_buffer_60 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_60 \
    op interface \
    ports { input_buffer_60 { O 16 vector } input_buffer_60_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4494 \
    name input_buffer_61 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_61 \
    op interface \
    ports { input_buffer_61 { O 16 vector } input_buffer_61_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4495 \
    name input_buffer_62 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_62 \
    op interface \
    ports { input_buffer_62 { O 16 vector } input_buffer_62_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4496 \
    name input_buffer_63 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_63 \
    op interface \
    ports { input_buffer_63 { O 16 vector } input_buffer_63_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4497 \
    name input_buffer_64 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_64 \
    op interface \
    ports { input_buffer_64 { O 16 vector } input_buffer_64_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4498 \
    name input_buffer_65 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_65 \
    op interface \
    ports { input_buffer_65 { O 16 vector } input_buffer_65_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4499 \
    name input_buffer_66 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_66 \
    op interface \
    ports { input_buffer_66 { O 16 vector } input_buffer_66_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4500 \
    name input_buffer_67 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_67 \
    op interface \
    ports { input_buffer_67 { O 16 vector } input_buffer_67_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4501 \
    name input_buffer_68 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_68 \
    op interface \
    ports { input_buffer_68 { O 16 vector } input_buffer_68_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4502 \
    name input_buffer_69 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_69 \
    op interface \
    ports { input_buffer_69 { O 16 vector } input_buffer_69_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4503 \
    name input_buffer_70 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_70 \
    op interface \
    ports { input_buffer_70 { O 16 vector } input_buffer_70_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4504 \
    name input_buffer_71 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_71 \
    op interface \
    ports { input_buffer_71 { O 16 vector } input_buffer_71_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4505 \
    name input_buffer_72 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_72 \
    op interface \
    ports { input_buffer_72 { O 16 vector } input_buffer_72_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4506 \
    name input_buffer_73 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_73 \
    op interface \
    ports { input_buffer_73 { O 16 vector } input_buffer_73_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4507 \
    name input_buffer_74 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_74 \
    op interface \
    ports { input_buffer_74 { O 16 vector } input_buffer_74_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4508 \
    name input_buffer_75 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_75 \
    op interface \
    ports { input_buffer_75 { O 16 vector } input_buffer_75_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4509 \
    name input_buffer_76 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_76 \
    op interface \
    ports { input_buffer_76 { O 16 vector } input_buffer_76_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4510 \
    name input_buffer_77 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_77 \
    op interface \
    ports { input_buffer_77 { O 16 vector } input_buffer_77_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4511 \
    name input_buffer_78 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_78 \
    op interface \
    ports { input_buffer_78 { O 16 vector } input_buffer_78_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4512 \
    name input_buffer_79 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_79 \
    op interface \
    ports { input_buffer_79 { O 16 vector } input_buffer_79_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4513 \
    name input_buffer_80 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_80 \
    op interface \
    ports { input_buffer_80 { O 16 vector } input_buffer_80_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4514 \
    name input_buffer_81 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_81 \
    op interface \
    ports { input_buffer_81 { O 16 vector } input_buffer_81_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4515 \
    name input_buffer_82 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_82 \
    op interface \
    ports { input_buffer_82 { O 16 vector } input_buffer_82_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4516 \
    name input_buffer_83 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_83 \
    op interface \
    ports { input_buffer_83 { O 16 vector } input_buffer_83_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4517 \
    name input_buffer_84 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_84 \
    op interface \
    ports { input_buffer_84 { O 16 vector } input_buffer_84_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4518 \
    name input_buffer_85 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_85 \
    op interface \
    ports { input_buffer_85 { O 16 vector } input_buffer_85_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4519 \
    name input_buffer_86 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_86 \
    op interface \
    ports { input_buffer_86 { O 16 vector } input_buffer_86_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4520 \
    name input_buffer_87 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_87 \
    op interface \
    ports { input_buffer_87 { O 16 vector } input_buffer_87_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4521 \
    name input_buffer_88 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_88 \
    op interface \
    ports { input_buffer_88 { O 16 vector } input_buffer_88_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4522 \
    name input_buffer_89 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_89 \
    op interface \
    ports { input_buffer_89 { O 16 vector } input_buffer_89_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4523 \
    name input_buffer_90 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_90 \
    op interface \
    ports { input_buffer_90 { O 16 vector } input_buffer_90_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4524 \
    name input_buffer_91 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_91 \
    op interface \
    ports { input_buffer_91 { O 16 vector } input_buffer_91_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4525 \
    name input_buffer_92 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_92 \
    op interface \
    ports { input_buffer_92 { O 16 vector } input_buffer_92_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4526 \
    name input_buffer_93 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_93 \
    op interface \
    ports { input_buffer_93 { O 16 vector } input_buffer_93_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4527 \
    name input_buffer_94 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_94 \
    op interface \
    ports { input_buffer_94 { O 16 vector } input_buffer_94_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4528 \
    name input_buffer_95 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_95 \
    op interface \
    ports { input_buffer_95 { O 16 vector } input_buffer_95_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4529 \
    name input_buffer_96 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_96 \
    op interface \
    ports { input_buffer_96 { O 16 vector } input_buffer_96_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4530 \
    name input_buffer_97 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_97 \
    op interface \
    ports { input_buffer_97 { O 16 vector } input_buffer_97_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4531 \
    name input_buffer_98 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_98 \
    op interface \
    ports { input_buffer_98 { O 16 vector } input_buffer_98_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4532 \
    name input_buffer_99 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_99 \
    op interface \
    ports { input_buffer_99 { O 16 vector } input_buffer_99_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4533 \
    name input_buffer_100 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_100 \
    op interface \
    ports { input_buffer_100 { O 16 vector } input_buffer_100_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4534 \
    name input_buffer_101 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_101 \
    op interface \
    ports { input_buffer_101 { O 16 vector } input_buffer_101_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4535 \
    name input_buffer_102 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_102 \
    op interface \
    ports { input_buffer_102 { O 16 vector } input_buffer_102_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4536 \
    name input_buffer_103 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_103 \
    op interface \
    ports { input_buffer_103 { O 16 vector } input_buffer_103_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4537 \
    name input_buffer_104 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_104 \
    op interface \
    ports { input_buffer_104 { O 16 vector } input_buffer_104_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4538 \
    name input_buffer_105 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_105 \
    op interface \
    ports { input_buffer_105 { O 16 vector } input_buffer_105_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4539 \
    name input_buffer_106 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_106 \
    op interface \
    ports { input_buffer_106 { O 16 vector } input_buffer_106_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4540 \
    name input_buffer_107 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_107 \
    op interface \
    ports { input_buffer_107 { O 16 vector } input_buffer_107_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4541 \
    name input_buffer_108 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_108 \
    op interface \
    ports { input_buffer_108 { O 16 vector } input_buffer_108_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4542 \
    name input_buffer_109 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_109 \
    op interface \
    ports { input_buffer_109 { O 16 vector } input_buffer_109_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4543 \
    name input_buffer_110 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_110 \
    op interface \
    ports { input_buffer_110 { O 16 vector } input_buffer_110_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4544 \
    name input_buffer_111 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_111 \
    op interface \
    ports { input_buffer_111 { O 16 vector } input_buffer_111_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4545 \
    name input_buffer_112 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_112 \
    op interface \
    ports { input_buffer_112 { O 16 vector } input_buffer_112_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4546 \
    name input_buffer_113 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_113 \
    op interface \
    ports { input_buffer_113 { O 16 vector } input_buffer_113_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4547 \
    name input_buffer_114 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_114 \
    op interface \
    ports { input_buffer_114 { O 16 vector } input_buffer_114_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4548 \
    name input_buffer_115 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_115 \
    op interface \
    ports { input_buffer_115 { O 16 vector } input_buffer_115_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4549 \
    name input_buffer_116 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_116 \
    op interface \
    ports { input_buffer_116 { O 16 vector } input_buffer_116_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4550 \
    name input_buffer_117 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_117 \
    op interface \
    ports { input_buffer_117 { O 16 vector } input_buffer_117_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4551 \
    name input_buffer_118 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_118 \
    op interface \
    ports { input_buffer_118 { O 16 vector } input_buffer_118_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4552 \
    name input_buffer_119 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_119 \
    op interface \
    ports { input_buffer_119 { O 16 vector } input_buffer_119_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4553 \
    name input_buffer_120 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_120 \
    op interface \
    ports { input_buffer_120 { O 16 vector } input_buffer_120_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4554 \
    name input_buffer_121 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_121 \
    op interface \
    ports { input_buffer_121 { O 16 vector } input_buffer_121_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4555 \
    name input_buffer_122 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_122 \
    op interface \
    ports { input_buffer_122 { O 16 vector } input_buffer_122_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4556 \
    name input_buffer_123 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_123 \
    op interface \
    ports { input_buffer_123 { O 16 vector } input_buffer_123_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4557 \
    name input_buffer_124 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_124 \
    op interface \
    ports { input_buffer_124 { O 16 vector } input_buffer_124_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4558 \
    name input_buffer_125 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_125 \
    op interface \
    ports { input_buffer_125 { O 16 vector } input_buffer_125_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4559 \
    name input_buffer_126 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_126 \
    op interface \
    ports { input_buffer_126 { O 16 vector } input_buffer_126_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4560 \
    name input_buffer_127 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_127 \
    op interface \
    ports { input_buffer_127 { O 16 vector } input_buffer_127_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4561 \
    name input_buffer_128 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_128 \
    op interface \
    ports { input_buffer_128 { O 16 vector } input_buffer_128_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4562 \
    name input_buffer_129 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_129 \
    op interface \
    ports { input_buffer_129 { O 16 vector } input_buffer_129_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4563 \
    name input_buffer_130 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_130 \
    op interface \
    ports { input_buffer_130 { O 16 vector } input_buffer_130_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4564 \
    name input_buffer_131 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_131 \
    op interface \
    ports { input_buffer_131 { O 16 vector } input_buffer_131_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4565 \
    name input_buffer_132 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_132 \
    op interface \
    ports { input_buffer_132 { O 16 vector } input_buffer_132_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4566 \
    name input_buffer_133 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_133 \
    op interface \
    ports { input_buffer_133 { O 16 vector } input_buffer_133_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4567 \
    name input_buffer_134 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_134 \
    op interface \
    ports { input_buffer_134 { O 16 vector } input_buffer_134_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4568 \
    name input_buffer_135 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_135 \
    op interface \
    ports { input_buffer_135 { O 16 vector } input_buffer_135_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4569 \
    name input_buffer_136 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_136 \
    op interface \
    ports { input_buffer_136 { O 16 vector } input_buffer_136_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4570 \
    name input_buffer_137 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_137 \
    op interface \
    ports { input_buffer_137 { O 16 vector } input_buffer_137_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4571 \
    name input_buffer_138 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_138 \
    op interface \
    ports { input_buffer_138 { O 16 vector } input_buffer_138_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4572 \
    name input_buffer_139 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_139 \
    op interface \
    ports { input_buffer_139 { O 16 vector } input_buffer_139_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4573 \
    name input_buffer_140 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_140 \
    op interface \
    ports { input_buffer_140 { O 16 vector } input_buffer_140_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4574 \
    name input_buffer_141 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_141 \
    op interface \
    ports { input_buffer_141 { O 16 vector } input_buffer_141_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4575 \
    name input_buffer_142 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_142 \
    op interface \
    ports { input_buffer_142 { O 16 vector } input_buffer_142_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4576 \
    name input_buffer_143 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_143 \
    op interface \
    ports { input_buffer_143 { O 16 vector } input_buffer_143_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4577 \
    name input_buffer_144 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_144 \
    op interface \
    ports { input_buffer_144 { O 16 vector } input_buffer_144_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4578 \
    name input_buffer_145 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_145 \
    op interface \
    ports { input_buffer_145 { O 16 vector } input_buffer_145_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4579 \
    name input_buffer_146 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_146 \
    op interface \
    ports { input_buffer_146 { O 16 vector } input_buffer_146_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4580 \
    name input_buffer_147 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_147 \
    op interface \
    ports { input_buffer_147 { O 16 vector } input_buffer_147_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4581 \
    name input_buffer_148 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_148 \
    op interface \
    ports { input_buffer_148 { O 16 vector } input_buffer_148_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4582 \
    name input_buffer_149 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_149 \
    op interface \
    ports { input_buffer_149 { O 16 vector } input_buffer_149_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4583 \
    name input_buffer_150 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_150 \
    op interface \
    ports { input_buffer_150 { O 16 vector } input_buffer_150_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4584 \
    name input_buffer_151 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_151 \
    op interface \
    ports { input_buffer_151 { O 16 vector } input_buffer_151_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4585 \
    name input_buffer_152 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_152 \
    op interface \
    ports { input_buffer_152 { O 16 vector } input_buffer_152_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4586 \
    name input_buffer_153 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_153 \
    op interface \
    ports { input_buffer_153 { O 16 vector } input_buffer_153_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4587 \
    name input_buffer_154 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_154 \
    op interface \
    ports { input_buffer_154 { O 16 vector } input_buffer_154_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4588 \
    name input_buffer_155 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_155 \
    op interface \
    ports { input_buffer_155 { O 16 vector } input_buffer_155_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4589 \
    name input_buffer_156 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_156 \
    op interface \
    ports { input_buffer_156 { O 16 vector } input_buffer_156_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4590 \
    name input_buffer_157 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_157 \
    op interface \
    ports { input_buffer_157 { O 16 vector } input_buffer_157_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4591 \
    name input_buffer_158 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_158 \
    op interface \
    ports { input_buffer_158 { O 16 vector } input_buffer_158_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4592 \
    name input_buffer_159 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_159 \
    op interface \
    ports { input_buffer_159 { O 16 vector } input_buffer_159_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4593 \
    name input_buffer_160 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_160 \
    op interface \
    ports { input_buffer_160 { O 16 vector } input_buffer_160_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4594 \
    name input_buffer_161 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_161 \
    op interface \
    ports { input_buffer_161 { O 16 vector } input_buffer_161_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4595 \
    name input_buffer_162 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_162 \
    op interface \
    ports { input_buffer_162 { O 16 vector } input_buffer_162_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4596 \
    name input_buffer_163 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_163 \
    op interface \
    ports { input_buffer_163 { O 16 vector } input_buffer_163_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4597 \
    name input_buffer_164 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_164 \
    op interface \
    ports { input_buffer_164 { O 16 vector } input_buffer_164_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4598 \
    name input_buffer_165 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_165 \
    op interface \
    ports { input_buffer_165 { O 16 vector } input_buffer_165_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4599 \
    name input_buffer_166 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_166 \
    op interface \
    ports { input_buffer_166 { O 16 vector } input_buffer_166_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4600 \
    name input_buffer_167 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_167 \
    op interface \
    ports { input_buffer_167 { O 16 vector } input_buffer_167_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4601 \
    name input_buffer_168 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_168 \
    op interface \
    ports { input_buffer_168 { O 16 vector } input_buffer_168_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4602 \
    name input_buffer_169 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_169 \
    op interface \
    ports { input_buffer_169 { O 16 vector } input_buffer_169_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4603 \
    name input_buffer_170 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_170 \
    op interface \
    ports { input_buffer_170 { O 16 vector } input_buffer_170_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4604 \
    name input_buffer_171 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_171 \
    op interface \
    ports { input_buffer_171 { O 16 vector } input_buffer_171_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4605 \
    name input_buffer_172 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_172 \
    op interface \
    ports { input_buffer_172 { O 16 vector } input_buffer_172_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4606 \
    name input_buffer_173 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_173 \
    op interface \
    ports { input_buffer_173 { O 16 vector } input_buffer_173_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4607 \
    name input_buffer_174 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_174 \
    op interface \
    ports { input_buffer_174 { O 16 vector } input_buffer_174_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4608 \
    name input_buffer_175 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_175 \
    op interface \
    ports { input_buffer_175 { O 16 vector } input_buffer_175_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4609 \
    name input_buffer_176 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_176 \
    op interface \
    ports { input_buffer_176 { O 16 vector } input_buffer_176_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4610 \
    name input_buffer_177 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_177 \
    op interface \
    ports { input_buffer_177 { O 16 vector } input_buffer_177_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4611 \
    name input_buffer_178 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_178 \
    op interface \
    ports { input_buffer_178 { O 16 vector } input_buffer_178_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4612 \
    name input_buffer_179 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_179 \
    op interface \
    ports { input_buffer_179 { O 16 vector } input_buffer_179_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4613 \
    name input_buffer_180 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_180 \
    op interface \
    ports { input_buffer_180 { O 16 vector } input_buffer_180_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4614 \
    name input_buffer_181 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_181 \
    op interface \
    ports { input_buffer_181 { O 16 vector } input_buffer_181_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4615 \
    name input_buffer_182 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_182 \
    op interface \
    ports { input_buffer_182 { O 16 vector } input_buffer_182_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4616 \
    name input_buffer_183 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_183 \
    op interface \
    ports { input_buffer_183 { O 16 vector } input_buffer_183_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4617 \
    name input_buffer_184 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_184 \
    op interface \
    ports { input_buffer_184 { O 16 vector } input_buffer_184_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4618 \
    name input_buffer_185 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_185 \
    op interface \
    ports { input_buffer_185 { O 16 vector } input_buffer_185_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4619 \
    name input_buffer_186 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_186 \
    op interface \
    ports { input_buffer_186 { O 16 vector } input_buffer_186_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4620 \
    name input_buffer_187 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_187 \
    op interface \
    ports { input_buffer_187 { O 16 vector } input_buffer_187_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4621 \
    name input_buffer_188 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_188 \
    op interface \
    ports { input_buffer_188 { O 16 vector } input_buffer_188_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4622 \
    name input_buffer_189 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_189 \
    op interface \
    ports { input_buffer_189 { O 16 vector } input_buffer_189_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4623 \
    name input_buffer_190 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_190 \
    op interface \
    ports { input_buffer_190 { O 16 vector } input_buffer_190_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4624 \
    name input_buffer_191 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_191 \
    op interface \
    ports { input_buffer_191 { O 16 vector } input_buffer_191_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4625 \
    name input_buffer_192 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_192 \
    op interface \
    ports { input_buffer_192 { O 16 vector } input_buffer_192_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4626 \
    name input_buffer_193 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_193 \
    op interface \
    ports { input_buffer_193 { O 16 vector } input_buffer_193_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4627 \
    name input_buffer_194 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_194 \
    op interface \
    ports { input_buffer_194 { O 16 vector } input_buffer_194_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4628 \
    name input_buffer_195 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_195 \
    op interface \
    ports { input_buffer_195 { O 16 vector } input_buffer_195_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4629 \
    name input_buffer_196 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_196 \
    op interface \
    ports { input_buffer_196 { O 16 vector } input_buffer_196_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4630 \
    name input_buffer_197 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_197 \
    op interface \
    ports { input_buffer_197 { O 16 vector } input_buffer_197_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4631 \
    name input_buffer_198 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_198 \
    op interface \
    ports { input_buffer_198 { O 16 vector } input_buffer_198_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4632 \
    name input_buffer_199 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_199 \
    op interface \
    ports { input_buffer_199 { O 16 vector } input_buffer_199_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4633 \
    name input_buffer_200 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_200 \
    op interface \
    ports { input_buffer_200 { O 16 vector } input_buffer_200_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4634 \
    name input_buffer_201 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_201 \
    op interface \
    ports { input_buffer_201 { O 16 vector } input_buffer_201_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4635 \
    name input_buffer_202 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_202 \
    op interface \
    ports { input_buffer_202 { O 16 vector } input_buffer_202_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4636 \
    name input_buffer_203 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_203 \
    op interface \
    ports { input_buffer_203 { O 16 vector } input_buffer_203_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4637 \
    name input_buffer_204 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_204 \
    op interface \
    ports { input_buffer_204 { O 16 vector } input_buffer_204_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4638 \
    name input_buffer_205 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_205 \
    op interface \
    ports { input_buffer_205 { O 16 vector } input_buffer_205_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4639 \
    name input_buffer_206 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_206 \
    op interface \
    ports { input_buffer_206 { O 16 vector } input_buffer_206_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4640 \
    name input_buffer_207 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_207 \
    op interface \
    ports { input_buffer_207 { O 16 vector } input_buffer_207_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4641 \
    name input_buffer_208 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_208 \
    op interface \
    ports { input_buffer_208 { O 16 vector } input_buffer_208_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4642 \
    name input_buffer_209 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_209 \
    op interface \
    ports { input_buffer_209 { O 16 vector } input_buffer_209_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4643 \
    name input_buffer_210 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_210 \
    op interface \
    ports { input_buffer_210 { O 16 vector } input_buffer_210_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4644 \
    name input_buffer_211 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_211 \
    op interface \
    ports { input_buffer_211 { O 16 vector } input_buffer_211_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4645 \
    name input_buffer_212 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_212 \
    op interface \
    ports { input_buffer_212 { O 16 vector } input_buffer_212_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4646 \
    name input_buffer_213 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_213 \
    op interface \
    ports { input_buffer_213 { O 16 vector } input_buffer_213_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4647 \
    name input_buffer_214 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_214 \
    op interface \
    ports { input_buffer_214 { O 16 vector } input_buffer_214_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4648 \
    name input_buffer_215 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_215 \
    op interface \
    ports { input_buffer_215 { O 16 vector } input_buffer_215_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4649 \
    name input_buffer_216 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_216 \
    op interface \
    ports { input_buffer_216 { O 16 vector } input_buffer_216_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4650 \
    name input_buffer_217 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_217 \
    op interface \
    ports { input_buffer_217 { O 16 vector } input_buffer_217_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4651 \
    name input_buffer_218 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_218 \
    op interface \
    ports { input_buffer_218 { O 16 vector } input_buffer_218_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4652 \
    name input_buffer_219 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_219 \
    op interface \
    ports { input_buffer_219 { O 16 vector } input_buffer_219_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4653 \
    name input_buffer_220 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_220 \
    op interface \
    ports { input_buffer_220 { O 16 vector } input_buffer_220_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4654 \
    name input_buffer_221 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_221 \
    op interface \
    ports { input_buffer_221 { O 16 vector } input_buffer_221_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4655 \
    name input_buffer_222 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_222 \
    op interface \
    ports { input_buffer_222 { O 16 vector } input_buffer_222_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4656 \
    name input_buffer_223 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_buffer_223 \
    op interface \
    ports { input_buffer_223 { O 16 vector } input_buffer_223_ap_vld { O 1 bit } } \
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



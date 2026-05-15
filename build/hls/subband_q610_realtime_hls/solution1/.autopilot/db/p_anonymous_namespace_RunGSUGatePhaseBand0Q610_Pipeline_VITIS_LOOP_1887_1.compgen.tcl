# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandRealtimeTopQ610Ip_sparsemux_225_8_16_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {auto}
}


set name SubbandRealtimeTopQ610Ip_mul_11s_14s_25_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {fabric} LATENCY 0 ALLOW_PRAGMA 1
}


set name SubbandRealtimeTopQ610Ip_mul_16s_16s_32_3_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {dsp} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandRealtimeTopQ610Ip_p_anonymous_namespace_RunGSUGatePhaseBand0Q610_Pipeline_VITIS_LOOP_1887_1_subbkb BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler SubbandRealtimeTopQ610Ip_p_anonymous_namespace_RunGSUGatePhaseBand0Q610_Pipeline_VITIS_LOOP_1887_1_subcud BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
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
    id 3419 \
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
    id 3420 \
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
    id 3421 \
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
    id 3422 \
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
    id 3424 \
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
    id 3425 \
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
    id 3427 \
    name hx_state_q610_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename hx_state_q610_0 \
    op interface \
    ports { hx_state_q610_0_address1 { O 12 vector } hx_state_q610_0_ce1 { O 1 bit } hx_state_q610_0_we1 { O 1 bit } hx_state_q610_0_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hx_state_q610_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3429 \
    name hx_state_q610_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename hx_state_q610_1 \
    op interface \
    ports { hx_state_q610_1_address1 { O 12 vector } hx_state_q610_1_ce1 { O 1 bit } hx_state_q610_1_we1 { O 1 bit } hx_state_q610_1_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hx_state_q610_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3431 \
    name cx_state_q610_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename cx_state_q610_0 \
    op interface \
    ports { cx_state_q610_0_address1 { O 12 vector } cx_state_q610_0_ce1 { O 1 bit } cx_state_q610_0_we1 { O 1 bit } cx_state_q610_0_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'cx_state_q610_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3433 \
    name cx_state_q610_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename cx_state_q610_1 \
    op interface \
    ports { cx_state_q610_1_address1 { O 12 vector } cx_state_q610_1_ce1 { O 1 bit } cx_state_q610_1_we1 { O 1 bit } cx_state_q610_1_d1 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'cx_state_q610_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 3435 \
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
    id 3437 \
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
    id 3195 \
    name prev_cx_q610_1_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_1_val \
    op interface \
    ports { prev_cx_q610_1_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3196 \
    name prev_cx_q610_3_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_3_val \
    op interface \
    ports { prev_cx_q610_3_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3197 \
    name prev_cx_q610_5_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_5_val \
    op interface \
    ports { prev_cx_q610_5_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3198 \
    name prev_cx_q610_7_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_7_val \
    op interface \
    ports { prev_cx_q610_7_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3199 \
    name prev_cx_q610_9_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_9_val \
    op interface \
    ports { prev_cx_q610_9_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3200 \
    name prev_cx_q610_11_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_11_val \
    op interface \
    ports { prev_cx_q610_11_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3201 \
    name prev_cx_q610_13_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_13_val \
    op interface \
    ports { prev_cx_q610_13_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3202 \
    name prev_cx_q610_15_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_15_val \
    op interface \
    ports { prev_cx_q610_15_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3203 \
    name prev_cx_q610_17_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_17_val \
    op interface \
    ports { prev_cx_q610_17_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3204 \
    name prev_cx_q610_19_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_19_val \
    op interface \
    ports { prev_cx_q610_19_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3205 \
    name prev_cx_q610_21_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_21_val \
    op interface \
    ports { prev_cx_q610_21_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3206 \
    name prev_cx_q610_23_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_23_val \
    op interface \
    ports { prev_cx_q610_23_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3207 \
    name prev_cx_q610_25_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_25_val \
    op interface \
    ports { prev_cx_q610_25_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3208 \
    name prev_cx_q610_27_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_27_val \
    op interface \
    ports { prev_cx_q610_27_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3209 \
    name prev_cx_q610_29_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_29_val \
    op interface \
    ports { prev_cx_q610_29_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3210 \
    name prev_cx_q610_31_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_31_val \
    op interface \
    ports { prev_cx_q610_31_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3211 \
    name prev_cx_q610_33_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_33_val \
    op interface \
    ports { prev_cx_q610_33_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3212 \
    name prev_cx_q610_35_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_35_val \
    op interface \
    ports { prev_cx_q610_35_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3213 \
    name prev_cx_q610_37_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_37_val \
    op interface \
    ports { prev_cx_q610_37_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3214 \
    name prev_cx_q610_39_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_39_val \
    op interface \
    ports { prev_cx_q610_39_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3215 \
    name prev_cx_q610_41_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_41_val \
    op interface \
    ports { prev_cx_q610_41_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3216 \
    name prev_cx_q610_43_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_43_val \
    op interface \
    ports { prev_cx_q610_43_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3217 \
    name prev_cx_q610_45_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_45_val \
    op interface \
    ports { prev_cx_q610_45_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3218 \
    name prev_cx_q610_47_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_47_val \
    op interface \
    ports { prev_cx_q610_47_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3219 \
    name prev_cx_q610_49_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_49_val \
    op interface \
    ports { prev_cx_q610_49_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3220 \
    name prev_cx_q610_51_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_51_val \
    op interface \
    ports { prev_cx_q610_51_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3221 \
    name prev_cx_q610_53_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_53_val \
    op interface \
    ports { prev_cx_q610_53_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3222 \
    name prev_cx_q610_55_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_55_val \
    op interface \
    ports { prev_cx_q610_55_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3223 \
    name prev_cx_q610_57_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_57_val \
    op interface \
    ports { prev_cx_q610_57_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3224 \
    name prev_cx_q610_59_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_59_val \
    op interface \
    ports { prev_cx_q610_59_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3225 \
    name prev_cx_q610_61_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_61_val \
    op interface \
    ports { prev_cx_q610_61_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3226 \
    name prev_cx_q610_63_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_63_val \
    op interface \
    ports { prev_cx_q610_63_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3227 \
    name prev_cx_q610_65_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_65_val \
    op interface \
    ports { prev_cx_q610_65_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3228 \
    name prev_cx_q610_67_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_67_val \
    op interface \
    ports { prev_cx_q610_67_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3229 \
    name prev_cx_q610_69_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_69_val \
    op interface \
    ports { prev_cx_q610_69_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3230 \
    name prev_cx_q610_71_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_71_val \
    op interface \
    ports { prev_cx_q610_71_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3231 \
    name prev_cx_q610_73_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_73_val \
    op interface \
    ports { prev_cx_q610_73_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3232 \
    name prev_cx_q610_75_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_75_val \
    op interface \
    ports { prev_cx_q610_75_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3233 \
    name prev_cx_q610_77_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_77_val \
    op interface \
    ports { prev_cx_q610_77_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3234 \
    name prev_cx_q610_79_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_79_val \
    op interface \
    ports { prev_cx_q610_79_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3235 \
    name prev_cx_q610_81_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_81_val \
    op interface \
    ports { prev_cx_q610_81_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3236 \
    name prev_cx_q610_83_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_83_val \
    op interface \
    ports { prev_cx_q610_83_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3237 \
    name prev_cx_q610_85_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_85_val \
    op interface \
    ports { prev_cx_q610_85_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3238 \
    name prev_cx_q610_87_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_87_val \
    op interface \
    ports { prev_cx_q610_87_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3239 \
    name prev_cx_q610_89_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_89_val \
    op interface \
    ports { prev_cx_q610_89_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3240 \
    name prev_cx_q610_91_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_91_val \
    op interface \
    ports { prev_cx_q610_91_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3241 \
    name prev_cx_q610_93_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_93_val \
    op interface \
    ports { prev_cx_q610_93_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3242 \
    name prev_cx_q610_95_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_95_val \
    op interface \
    ports { prev_cx_q610_95_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3243 \
    name prev_cx_q610_97_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_97_val \
    op interface \
    ports { prev_cx_q610_97_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3244 \
    name prev_cx_q610_99_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_99_val \
    op interface \
    ports { prev_cx_q610_99_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3245 \
    name prev_cx_q610_101_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_101_val \
    op interface \
    ports { prev_cx_q610_101_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3246 \
    name prev_cx_q610_103_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_103_val \
    op interface \
    ports { prev_cx_q610_103_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3247 \
    name prev_cx_q610_105_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_105_val \
    op interface \
    ports { prev_cx_q610_105_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3248 \
    name prev_cx_q610_107_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_107_val \
    op interface \
    ports { prev_cx_q610_107_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3249 \
    name prev_cx_q610_109_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_109_val \
    op interface \
    ports { prev_cx_q610_109_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3250 \
    name prev_cx_q610_111_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_111_val \
    op interface \
    ports { prev_cx_q610_111_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3251 \
    name prev_cx_q610_113_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_113_val \
    op interface \
    ports { prev_cx_q610_113_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3252 \
    name prev_cx_q610_115_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_115_val \
    op interface \
    ports { prev_cx_q610_115_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3253 \
    name prev_cx_q610_117_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_117_val \
    op interface \
    ports { prev_cx_q610_117_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3254 \
    name prev_cx_q610_119_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_119_val \
    op interface \
    ports { prev_cx_q610_119_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3255 \
    name prev_cx_q610_121_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_121_val \
    op interface \
    ports { prev_cx_q610_121_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3256 \
    name prev_cx_q610_123_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_123_val \
    op interface \
    ports { prev_cx_q610_123_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3257 \
    name prev_cx_q610_125_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_125_val \
    op interface \
    ports { prev_cx_q610_125_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3258 \
    name prev_cx_q610_127_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_127_val \
    op interface \
    ports { prev_cx_q610_127_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3259 \
    name prev_cx_q610_129_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_129_val \
    op interface \
    ports { prev_cx_q610_129_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3260 \
    name prev_cx_q610_131_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_131_val \
    op interface \
    ports { prev_cx_q610_131_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3261 \
    name prev_cx_q610_133_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_133_val \
    op interface \
    ports { prev_cx_q610_133_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3262 \
    name prev_cx_q610_135_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_135_val \
    op interface \
    ports { prev_cx_q610_135_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3263 \
    name prev_cx_q610_137_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_137_val \
    op interface \
    ports { prev_cx_q610_137_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3264 \
    name prev_cx_q610_139_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_139_val \
    op interface \
    ports { prev_cx_q610_139_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3265 \
    name prev_cx_q610_141_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_141_val \
    op interface \
    ports { prev_cx_q610_141_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3266 \
    name prev_cx_q610_143_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_143_val \
    op interface \
    ports { prev_cx_q610_143_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3267 \
    name prev_cx_q610_145_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_145_val \
    op interface \
    ports { prev_cx_q610_145_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3268 \
    name prev_cx_q610_147_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_147_val \
    op interface \
    ports { prev_cx_q610_147_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3269 \
    name prev_cx_q610_149_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_149_val \
    op interface \
    ports { prev_cx_q610_149_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3270 \
    name prev_cx_q610_151_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_151_val \
    op interface \
    ports { prev_cx_q610_151_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3271 \
    name prev_cx_q610_153_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_153_val \
    op interface \
    ports { prev_cx_q610_153_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3272 \
    name prev_cx_q610_155_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_155_val \
    op interface \
    ports { prev_cx_q610_155_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3273 \
    name prev_cx_q610_157_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_157_val \
    op interface \
    ports { prev_cx_q610_157_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3274 \
    name prev_cx_q610_159_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_159_val \
    op interface \
    ports { prev_cx_q610_159_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3275 \
    name prev_cx_q610_161_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_161_val \
    op interface \
    ports { prev_cx_q610_161_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3276 \
    name prev_cx_q610_163_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_163_val \
    op interface \
    ports { prev_cx_q610_163_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3277 \
    name prev_cx_q610_165_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_165_val \
    op interface \
    ports { prev_cx_q610_165_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3278 \
    name prev_cx_q610_167_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_167_val \
    op interface \
    ports { prev_cx_q610_167_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3279 \
    name prev_cx_q610_169_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_169_val \
    op interface \
    ports { prev_cx_q610_169_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3280 \
    name prev_cx_q610_171_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_171_val \
    op interface \
    ports { prev_cx_q610_171_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3281 \
    name prev_cx_q610_173_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_173_val \
    op interface \
    ports { prev_cx_q610_173_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3282 \
    name prev_cx_q610_175_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_175_val \
    op interface \
    ports { prev_cx_q610_175_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3283 \
    name prev_cx_q610_177_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_177_val \
    op interface \
    ports { prev_cx_q610_177_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3284 \
    name prev_cx_q610_179_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_179_val \
    op interface \
    ports { prev_cx_q610_179_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3285 \
    name prev_cx_q610_181_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_181_val \
    op interface \
    ports { prev_cx_q610_181_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3286 \
    name prev_cx_q610_183_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_183_val \
    op interface \
    ports { prev_cx_q610_183_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3287 \
    name prev_cx_q610_185_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_185_val \
    op interface \
    ports { prev_cx_q610_185_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3288 \
    name prev_cx_q610_187_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_187_val \
    op interface \
    ports { prev_cx_q610_187_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3289 \
    name prev_cx_q610_189_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_189_val \
    op interface \
    ports { prev_cx_q610_189_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3290 \
    name prev_cx_q610_191_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_191_val \
    op interface \
    ports { prev_cx_q610_191_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3291 \
    name prev_cx_q610_193_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_193_val \
    op interface \
    ports { prev_cx_q610_193_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3292 \
    name prev_cx_q610_195_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_195_val \
    op interface \
    ports { prev_cx_q610_195_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3293 \
    name prev_cx_q610_197_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_197_val \
    op interface \
    ports { prev_cx_q610_197_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3294 \
    name prev_cx_q610_199_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_199_val \
    op interface \
    ports { prev_cx_q610_199_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3295 \
    name prev_cx_q610_201_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_201_val \
    op interface \
    ports { prev_cx_q610_201_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3296 \
    name prev_cx_q610_203_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_203_val \
    op interface \
    ports { prev_cx_q610_203_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3297 \
    name prev_cx_q610_205_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_205_val \
    op interface \
    ports { prev_cx_q610_205_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3298 \
    name prev_cx_q610_207_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_207_val \
    op interface \
    ports { prev_cx_q610_207_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3299 \
    name prev_cx_q610_209_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_209_val \
    op interface \
    ports { prev_cx_q610_209_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3300 \
    name prev_cx_q610_211_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_211_val \
    op interface \
    ports { prev_cx_q610_211_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3301 \
    name prev_cx_q610_213_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_213_val \
    op interface \
    ports { prev_cx_q610_213_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3302 \
    name prev_cx_q610_215_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_215_val \
    op interface \
    ports { prev_cx_q610_215_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3303 \
    name prev_cx_q610_217_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_217_val \
    op interface \
    ports { prev_cx_q610_217_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3304 \
    name prev_cx_q610_219_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_219_val \
    op interface \
    ports { prev_cx_q610_219_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3305 \
    name prev_cx_q610_221_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_221_val \
    op interface \
    ports { prev_cx_q610_221_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3306 \
    name prev_cx_q610_223_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_223_val \
    op interface \
    ports { prev_cx_q610_223_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3307 \
    name prev_cx_q610_0_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_0_val \
    op interface \
    ports { prev_cx_q610_0_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3308 \
    name prev_cx_q610_2_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_2_val \
    op interface \
    ports { prev_cx_q610_2_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3309 \
    name prev_cx_q610_4_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_4_val \
    op interface \
    ports { prev_cx_q610_4_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3310 \
    name prev_cx_q610_6_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_6_val \
    op interface \
    ports { prev_cx_q610_6_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3311 \
    name prev_cx_q610_8_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_8_val \
    op interface \
    ports { prev_cx_q610_8_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3312 \
    name prev_cx_q610_10_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_10_val \
    op interface \
    ports { prev_cx_q610_10_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3313 \
    name prev_cx_q610_12_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_12_val \
    op interface \
    ports { prev_cx_q610_12_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3314 \
    name prev_cx_q610_14_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_14_val \
    op interface \
    ports { prev_cx_q610_14_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3315 \
    name prev_cx_q610_16_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_16_val \
    op interface \
    ports { prev_cx_q610_16_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3316 \
    name prev_cx_q610_18_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_18_val \
    op interface \
    ports { prev_cx_q610_18_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3317 \
    name prev_cx_q610_20_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_20_val \
    op interface \
    ports { prev_cx_q610_20_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3318 \
    name prev_cx_q610_22_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_22_val \
    op interface \
    ports { prev_cx_q610_22_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3319 \
    name prev_cx_q610_24_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_24_val \
    op interface \
    ports { prev_cx_q610_24_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3320 \
    name prev_cx_q610_26_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_26_val \
    op interface \
    ports { prev_cx_q610_26_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3321 \
    name prev_cx_q610_28_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_28_val \
    op interface \
    ports { prev_cx_q610_28_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3322 \
    name prev_cx_q610_30_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_30_val \
    op interface \
    ports { prev_cx_q610_30_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3323 \
    name prev_cx_q610_32_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_32_val \
    op interface \
    ports { prev_cx_q610_32_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3324 \
    name prev_cx_q610_34_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_34_val \
    op interface \
    ports { prev_cx_q610_34_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3325 \
    name prev_cx_q610_36_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_36_val \
    op interface \
    ports { prev_cx_q610_36_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3326 \
    name prev_cx_q610_38_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_38_val \
    op interface \
    ports { prev_cx_q610_38_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3327 \
    name prev_cx_q610_40_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_40_val \
    op interface \
    ports { prev_cx_q610_40_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3328 \
    name prev_cx_q610_42_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_42_val \
    op interface \
    ports { prev_cx_q610_42_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3329 \
    name prev_cx_q610_44_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_44_val \
    op interface \
    ports { prev_cx_q610_44_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3330 \
    name prev_cx_q610_46_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_46_val \
    op interface \
    ports { prev_cx_q610_46_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3331 \
    name prev_cx_q610_48_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_48_val \
    op interface \
    ports { prev_cx_q610_48_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3332 \
    name prev_cx_q610_50_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_50_val \
    op interface \
    ports { prev_cx_q610_50_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3333 \
    name prev_cx_q610_52_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_52_val \
    op interface \
    ports { prev_cx_q610_52_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3334 \
    name prev_cx_q610_54_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_54_val \
    op interface \
    ports { prev_cx_q610_54_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3335 \
    name prev_cx_q610_56_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_56_val \
    op interface \
    ports { prev_cx_q610_56_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3336 \
    name prev_cx_q610_58_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_58_val \
    op interface \
    ports { prev_cx_q610_58_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3337 \
    name prev_cx_q610_60_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_60_val \
    op interface \
    ports { prev_cx_q610_60_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3338 \
    name prev_cx_q610_62_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_62_val \
    op interface \
    ports { prev_cx_q610_62_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3339 \
    name prev_cx_q610_64_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_64_val \
    op interface \
    ports { prev_cx_q610_64_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3340 \
    name prev_cx_q610_66_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_66_val \
    op interface \
    ports { prev_cx_q610_66_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3341 \
    name prev_cx_q610_68_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_68_val \
    op interface \
    ports { prev_cx_q610_68_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3342 \
    name prev_cx_q610_70_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_70_val \
    op interface \
    ports { prev_cx_q610_70_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3343 \
    name prev_cx_q610_72_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_72_val \
    op interface \
    ports { prev_cx_q610_72_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3344 \
    name prev_cx_q610_74_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_74_val \
    op interface \
    ports { prev_cx_q610_74_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3345 \
    name prev_cx_q610_76_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_76_val \
    op interface \
    ports { prev_cx_q610_76_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3346 \
    name prev_cx_q610_78_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_78_val \
    op interface \
    ports { prev_cx_q610_78_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3347 \
    name prev_cx_q610_80_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_80_val \
    op interface \
    ports { prev_cx_q610_80_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3348 \
    name prev_cx_q610_82_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_82_val \
    op interface \
    ports { prev_cx_q610_82_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3349 \
    name prev_cx_q610_84_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_84_val \
    op interface \
    ports { prev_cx_q610_84_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3350 \
    name prev_cx_q610_86_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_86_val \
    op interface \
    ports { prev_cx_q610_86_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3351 \
    name prev_cx_q610_88_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_88_val \
    op interface \
    ports { prev_cx_q610_88_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3352 \
    name prev_cx_q610_90_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_90_val \
    op interface \
    ports { prev_cx_q610_90_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3353 \
    name prev_cx_q610_92_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_92_val \
    op interface \
    ports { prev_cx_q610_92_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3354 \
    name prev_cx_q610_94_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_94_val \
    op interface \
    ports { prev_cx_q610_94_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3355 \
    name prev_cx_q610_96_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_96_val \
    op interface \
    ports { prev_cx_q610_96_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3356 \
    name prev_cx_q610_98_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_98_val \
    op interface \
    ports { prev_cx_q610_98_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3357 \
    name prev_cx_q610_100_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_100_val \
    op interface \
    ports { prev_cx_q610_100_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3358 \
    name prev_cx_q610_102_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_102_val \
    op interface \
    ports { prev_cx_q610_102_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3359 \
    name prev_cx_q610_104_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_104_val \
    op interface \
    ports { prev_cx_q610_104_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3360 \
    name prev_cx_q610_106_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_106_val \
    op interface \
    ports { prev_cx_q610_106_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3361 \
    name prev_cx_q610_108_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_108_val \
    op interface \
    ports { prev_cx_q610_108_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3362 \
    name prev_cx_q610_110_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_110_val \
    op interface \
    ports { prev_cx_q610_110_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3363 \
    name prev_cx_q610_112_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_112_val \
    op interface \
    ports { prev_cx_q610_112_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3364 \
    name prev_cx_q610_114_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_114_val \
    op interface \
    ports { prev_cx_q610_114_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3365 \
    name prev_cx_q610_116_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_116_val \
    op interface \
    ports { prev_cx_q610_116_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3366 \
    name prev_cx_q610_118_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_118_val \
    op interface \
    ports { prev_cx_q610_118_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3367 \
    name prev_cx_q610_120_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_120_val \
    op interface \
    ports { prev_cx_q610_120_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3368 \
    name prev_cx_q610_122_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_122_val \
    op interface \
    ports { prev_cx_q610_122_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3369 \
    name prev_cx_q610_124_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_124_val \
    op interface \
    ports { prev_cx_q610_124_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3370 \
    name prev_cx_q610_126_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_126_val \
    op interface \
    ports { prev_cx_q610_126_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3371 \
    name prev_cx_q610_128_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_128_val \
    op interface \
    ports { prev_cx_q610_128_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3372 \
    name prev_cx_q610_130_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_130_val \
    op interface \
    ports { prev_cx_q610_130_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3373 \
    name prev_cx_q610_132_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_132_val \
    op interface \
    ports { prev_cx_q610_132_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3374 \
    name prev_cx_q610_134_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_134_val \
    op interface \
    ports { prev_cx_q610_134_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3375 \
    name prev_cx_q610_136_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_136_val \
    op interface \
    ports { prev_cx_q610_136_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3376 \
    name prev_cx_q610_138_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_138_val \
    op interface \
    ports { prev_cx_q610_138_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3377 \
    name prev_cx_q610_140_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_140_val \
    op interface \
    ports { prev_cx_q610_140_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3378 \
    name prev_cx_q610_142_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_142_val \
    op interface \
    ports { prev_cx_q610_142_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3379 \
    name prev_cx_q610_144_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_144_val \
    op interface \
    ports { prev_cx_q610_144_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3380 \
    name prev_cx_q610_146_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_146_val \
    op interface \
    ports { prev_cx_q610_146_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3381 \
    name prev_cx_q610_148_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_148_val \
    op interface \
    ports { prev_cx_q610_148_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3382 \
    name prev_cx_q610_150_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_150_val \
    op interface \
    ports { prev_cx_q610_150_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3383 \
    name prev_cx_q610_152_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_152_val \
    op interface \
    ports { prev_cx_q610_152_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3384 \
    name prev_cx_q610_154_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_154_val \
    op interface \
    ports { prev_cx_q610_154_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3385 \
    name prev_cx_q610_156_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_156_val \
    op interface \
    ports { prev_cx_q610_156_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3386 \
    name prev_cx_q610_158_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_158_val \
    op interface \
    ports { prev_cx_q610_158_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3387 \
    name prev_cx_q610_160_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_160_val \
    op interface \
    ports { prev_cx_q610_160_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3388 \
    name prev_cx_q610_162_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_162_val \
    op interface \
    ports { prev_cx_q610_162_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3389 \
    name prev_cx_q610_164_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_164_val \
    op interface \
    ports { prev_cx_q610_164_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3390 \
    name prev_cx_q610_166_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_166_val \
    op interface \
    ports { prev_cx_q610_166_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3391 \
    name prev_cx_q610_168_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_168_val \
    op interface \
    ports { prev_cx_q610_168_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3392 \
    name prev_cx_q610_170_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_170_val \
    op interface \
    ports { prev_cx_q610_170_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3393 \
    name prev_cx_q610_172_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_172_val \
    op interface \
    ports { prev_cx_q610_172_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3394 \
    name prev_cx_q610_174_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_174_val \
    op interface \
    ports { prev_cx_q610_174_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3395 \
    name prev_cx_q610_176_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_176_val \
    op interface \
    ports { prev_cx_q610_176_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3396 \
    name prev_cx_q610_178_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_178_val \
    op interface \
    ports { prev_cx_q610_178_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3397 \
    name prev_cx_q610_180_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_180_val \
    op interface \
    ports { prev_cx_q610_180_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3398 \
    name prev_cx_q610_182_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_182_val \
    op interface \
    ports { prev_cx_q610_182_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3399 \
    name prev_cx_q610_184_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_184_val \
    op interface \
    ports { prev_cx_q610_184_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3400 \
    name prev_cx_q610_186_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_186_val \
    op interface \
    ports { prev_cx_q610_186_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3401 \
    name prev_cx_q610_188_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_188_val \
    op interface \
    ports { prev_cx_q610_188_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3402 \
    name prev_cx_q610_190_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_190_val \
    op interface \
    ports { prev_cx_q610_190_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3403 \
    name prev_cx_q610_192_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_192_val \
    op interface \
    ports { prev_cx_q610_192_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3404 \
    name prev_cx_q610_194_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_194_val \
    op interface \
    ports { prev_cx_q610_194_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3405 \
    name prev_cx_q610_196_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_196_val \
    op interface \
    ports { prev_cx_q610_196_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3406 \
    name prev_cx_q610_198_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_198_val \
    op interface \
    ports { prev_cx_q610_198_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3407 \
    name prev_cx_q610_200_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_200_val \
    op interface \
    ports { prev_cx_q610_200_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3408 \
    name prev_cx_q610_202_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_202_val \
    op interface \
    ports { prev_cx_q610_202_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3409 \
    name prev_cx_q610_204_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_204_val \
    op interface \
    ports { prev_cx_q610_204_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3410 \
    name prev_cx_q610_206_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_206_val \
    op interface \
    ports { prev_cx_q610_206_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3411 \
    name prev_cx_q610_208_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_208_val \
    op interface \
    ports { prev_cx_q610_208_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3412 \
    name prev_cx_q610_210_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_210_val \
    op interface \
    ports { prev_cx_q610_210_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3413 \
    name prev_cx_q610_212_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_212_val \
    op interface \
    ports { prev_cx_q610_212_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3414 \
    name prev_cx_q610_214_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_214_val \
    op interface \
    ports { prev_cx_q610_214_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3415 \
    name prev_cx_q610_216_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_216_val \
    op interface \
    ports { prev_cx_q610_216_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3416 \
    name prev_cx_q610_218_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_218_val \
    op interface \
    ports { prev_cx_q610_218_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3417 \
    name prev_cx_q610_220_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_220_val \
    op interface \
    ports { prev_cx_q610_220_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3418 \
    name prev_cx_q610_222_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_222_val \
    op interface \
    ports { prev_cx_q610_222_val { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3423 \
    name common_sum_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_common_sum_stream \
    op interface \
    ports { common_sum_stream_dout { I 96 vector } common_sum_stream_empty_n { I 1 bit } common_sum_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3426 \
    name sub_ln1914_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_ln1914_1 \
    op interface \
    ports { sub_ln1914_1 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3428 \
    name sub_ln1914 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_ln1914 \
    op interface \
    ports { sub_ln1914 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3430 \
    name sub_ln1913_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_ln1913_1 \
    op interface \
    ports { sub_ln1913_1 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3432 \
    name sub_ln1913 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_ln1913 \
    op interface \
    ports { sub_ln1913 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3434 \
    name sub_ln1915_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_ln1915_1 \
    op interface \
    ports { sub_ln1915_1 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3436 \
    name sub_ln1915 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_ln1915 \
    op interface \
    ports { sub_ln1915 { I 12 vector } } \
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
set InstName SubbandRealtimeTopQ610Ip_flow_control_loop_pipe_sequential_init_U
set CompName SubbandRealtimeTopQ610Ip_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix SubbandRealtimeTopQ610Ip_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}



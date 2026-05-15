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
    id 2367 \
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
    id 2368 \
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
    id 2369 \
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
    id 2370 \
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
    id 2371 \
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
    id 2372 \
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
    id 2597 \
    name hx_state_q610_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename hx_state_q610_0 \
    op interface \
    ports { hx_state_q610_0_address0 { O 10 vector } hx_state_q610_0_ce0 { O 1 bit } hx_state_q610_0_we0 { O 1 bit } hx_state_q610_0_d0 { O 11 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hx_state_q610_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2599 \
    name hx_state_q610_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename hx_state_q610_1 \
    op interface \
    ports { hx_state_q610_1_address0 { O 10 vector } hx_state_q610_1_ce0 { O 1 bit } hx_state_q610_1_we0 { O 1 bit } hx_state_q610_1_d0 { O 11 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hx_state_q610_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2601 \
    name cx_state_q610_0 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename cx_state_q610_0 \
    op interface \
    ports { cx_state_q610_0_address0 { O 10 vector } cx_state_q610_0_ce0 { O 1 bit } cx_state_q610_0_we0 { O 1 bit } cx_state_q610_0_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'cx_state_q610_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2603 \
    name cx_state_q610_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename cx_state_q610_1 \
    op interface \
    ports { cx_state_q610_1_address0 { O 10 vector } cx_state_q610_1_ce0 { O 1 bit } cx_state_q610_1_we0 { O 1 bit } cx_state_q610_1_d0 { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'cx_state_q610_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2605 \
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
    id 2606 \
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


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2366 \
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
    id 2373 \
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
    id 2374 \
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
    id 2375 \
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
    id 2376 \
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
    id 2377 \
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
    id 2378 \
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
    id 2379 \
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
    id 2380 \
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
    id 2381 \
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
    id 2382 \
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
    id 2383 \
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
    id 2384 \
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
    id 2385 \
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
    id 2386 \
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
    id 2387 \
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
    id 2388 \
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
    id 2389 \
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
    id 2390 \
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
    id 2391 \
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
    id 2392 \
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
    id 2393 \
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
    id 2394 \
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
    id 2395 \
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
    id 2396 \
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
    id 2397 \
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
    id 2398 \
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
    id 2399 \
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
    id 2400 \
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
    id 2401 \
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
    id 2402 \
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
    id 2403 \
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
    id 2404 \
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
    id 2405 \
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
    id 2406 \
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
    id 2407 \
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
    id 2408 \
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
    id 2409 \
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
    id 2410 \
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
    id 2411 \
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
    id 2412 \
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
    id 2413 \
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
    id 2414 \
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
    id 2415 \
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
    id 2416 \
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
    id 2417 \
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
    id 2418 \
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
    id 2419 \
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
    id 2420 \
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
    id 2421 \
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
    id 2422 \
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
    id 2423 \
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
    id 2424 \
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
    id 2425 \
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
    id 2426 \
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
    id 2427 \
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
    id 2428 \
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
    id 2429 \
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
    id 2430 \
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
    id 2431 \
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
    id 2432 \
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
    id 2433 \
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
    id 2434 \
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
    id 2435 \
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
    id 2436 \
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
    id 2437 \
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
    id 2438 \
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
    id 2439 \
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
    id 2440 \
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
    id 2441 \
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
    id 2442 \
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
    id 2443 \
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
    id 2444 \
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
    id 2445 \
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
    id 2446 \
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
    id 2447 \
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
    id 2448 \
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
    id 2449 \
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
    id 2450 \
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
    id 2451 \
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
    id 2452 \
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
    id 2453 \
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
    id 2454 \
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
    id 2455 \
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
    id 2456 \
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
    id 2457 \
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
    id 2458 \
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
    id 2459 \
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
    id 2460 \
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
    id 2461 \
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
    id 2462 \
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
    id 2463 \
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
    id 2464 \
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
    id 2465 \
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
    id 2466 \
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
    id 2467 \
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
    id 2468 \
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
    id 2469 \
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
    id 2470 \
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
    id 2471 \
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
    id 2472 \
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
    id 2473 \
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
    id 2474 \
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
    id 2475 \
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
    id 2476 \
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
    id 2477 \
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
    id 2478 \
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
    id 2479 \
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
    id 2480 \
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
    id 2481 \
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
    id 2482 \
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
    id 2483 \
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
    id 2484 \
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
    id 2485 \
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
    id 2486 \
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
    id 2487 \
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
    id 2488 \
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
    id 2489 \
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
    id 2490 \
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
    id 2491 \
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
    id 2492 \
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
    id 2493 \
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
    id 2494 \
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
    id 2495 \
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
    id 2496 \
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
    id 2497 \
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
    id 2498 \
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
    id 2499 \
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
    id 2500 \
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
    id 2501 \
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
    id 2502 \
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
    id 2503 \
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
    id 2504 \
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
    id 2505 \
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
    id 2506 \
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
    id 2507 \
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
    id 2508 \
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
    id 2509 \
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
    id 2510 \
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
    id 2511 \
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
    id 2512 \
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
    id 2513 \
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
    id 2514 \
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
    id 2515 \
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
    id 2516 \
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
    id 2517 \
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
    id 2518 \
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
    id 2519 \
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
    id 2520 \
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
    id 2521 \
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
    id 2522 \
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
    id 2523 \
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
    id 2524 \
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
    id 2525 \
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
    id 2526 \
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
    id 2527 \
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
    id 2528 \
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
    id 2529 \
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
    id 2530 \
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
    id 2531 \
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
    id 2532 \
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
    id 2533 \
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
    id 2534 \
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
    id 2535 \
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
    id 2536 \
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
    id 2537 \
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
    id 2538 \
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
    id 2539 \
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
    id 2540 \
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
    id 2541 \
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
    id 2542 \
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
    id 2543 \
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
    id 2544 \
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
    id 2545 \
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
    id 2546 \
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
    id 2547 \
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
    id 2548 \
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
    id 2549 \
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
    id 2550 \
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
    id 2551 \
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
    id 2552 \
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
    id 2553 \
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
    id 2554 \
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
    id 2555 \
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
    id 2556 \
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
    id 2557 \
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
    id 2558 \
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
    id 2559 \
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
    id 2560 \
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
    id 2561 \
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
    id 2562 \
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
    id 2563 \
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
    id 2564 \
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
    id 2565 \
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
    id 2566 \
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
    id 2567 \
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
    id 2568 \
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
    id 2569 \
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
    id 2570 \
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
    id 2571 \
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
    id 2572 \
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
    id 2573 \
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
    id 2574 \
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
    id 2575 \
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
    id 2576 \
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
    id 2577 \
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
    id 2578 \
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
    id 2579 \
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
    id 2580 \
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
    id 2581 \
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
    id 2582 \
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
    id 2583 \
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
    id 2584 \
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
    id 2585 \
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
    id 2586 \
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
    id 2587 \
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
    id 2588 \
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
    id 2589 \
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
    id 2590 \
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
    id 2591 \
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
    id 2592 \
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
    id 2593 \
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
    id 2594 \
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
    id 2595 \
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
    id 2596 \
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
    id 2598 \
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
    id 2600 \
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
    id 2602 \
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
    id 2604 \
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



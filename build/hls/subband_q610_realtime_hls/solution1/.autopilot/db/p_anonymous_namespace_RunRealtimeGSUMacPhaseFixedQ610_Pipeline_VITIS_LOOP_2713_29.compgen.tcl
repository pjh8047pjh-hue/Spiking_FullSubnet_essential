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
    id 2477 \
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
    id 2469 \
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
    id 2470 \
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
    id 2471 \
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
    id 2472 \
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
    id 2473 \
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
    id 2474 \
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
    id 2475 \
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
    id 2476 \
    name sub_ln2719 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_ln2719 \
    op interface \
    ports { sub_ln2719 { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2478 \
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
    id 2479 \
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
    id 2480 \
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
    id 2481 \
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
    id 2482 \
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
    id 2483 \
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
    id 2484 \
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
    id 2485 \
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
    id 2486 \
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
    id 2487 \
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
    id 2488 \
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
    id 2489 \
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
    id 2490 \
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
    id 2491 \
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
    id 2492 \
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
    id 2493 \
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
    id 2494 \
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
    id 2495 \
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
    id 2496 \
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
    id 2497 \
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
    id 2498 \
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
    id 2499 \
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
    id 2500 \
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
    id 2501 \
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
    id 2502 \
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
    id 2503 \
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
    id 2504 \
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
    id 2505 \
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
    id 2506 \
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
    id 2507 \
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
    id 2508 \
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
    id 2509 \
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
    id 2510 \
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
    id 2511 \
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
    id 2512 \
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
    id 2513 \
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
    id 2514 \
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
    id 2515 \
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
    id 2516 \
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
    id 2517 \
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
    id 2518 \
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
    id 2519 \
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
    id 2520 \
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
    id 2521 \
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
    id 2522 \
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
    id 2523 \
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
    id 2524 \
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
    id 2525 \
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
    id 2526 \
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
    id 2527 \
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
    id 2528 \
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
    id 2529 \
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
    id 2530 \
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
    id 2531 \
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
    id 2532 \
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
    id 2533 \
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
    id 2534 \
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
    id 2535 \
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
    id 2536 \
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
    id 2537 \
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
    id 2538 \
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
    id 2539 \
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
    id 2540 \
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
    id 2541 \
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
    id 2542 \
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
    id 2543 \
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
    id 2544 \
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
    id 2545 \
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
    id 2546 \
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
    id 2547 \
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
    id 2548 \
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
    id 2549 \
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
    id 2550 \
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
    id 2551 \
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
    id 2552 \
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
    id 2553 \
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
    id 2554 \
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
    id 2555 \
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
    id 2556 \
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
    id 2557 \
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
    id 2558 \
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
    id 2559 \
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
    id 2560 \
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
    id 2561 \
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
    id 2562 \
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
    id 2563 \
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
    id 2564 \
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
    id 2565 \
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
    id 2566 \
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
    id 2567 \
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
    id 2568 \
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
    id 2569 \
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
    id 2570 \
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
    id 2571 \
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
    id 2572 \
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
    id 2573 \
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
    id 2574 \
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
    id 2575 \
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
    id 2576 \
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
    id 2577 \
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
    id 2578 \
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
    id 2579 \
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
    id 2580 \
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
    id 2581 \
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
    id 2582 \
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
    id 2583 \
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
    id 2584 \
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
    id 2585 \
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
    id 2586 \
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
    id 2587 \
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
    id 2588 \
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
    id 2589 \
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
    id 2590 \
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
    id 2591 \
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
    id 2592 \
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
    id 2593 \
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
    id 2594 \
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
    id 2595 \
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
    id 2596 \
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
    id 2597 \
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
    id 2598 \
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
    id 2599 \
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
    id 2600 \
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
    id 2601 \
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
    id 2602 \
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
    id 2603 \
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
    id 2604 \
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
    id 2605 \
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
    id 2606 \
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
    id 2607 \
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
    id 2608 \
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
    id 2609 \
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
    id 2610 \
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
    id 2611 \
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
    id 2612 \
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
    id 2613 \
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
    id 2614 \
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
    id 2615 \
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
    id 2616 \
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
    id 2617 \
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
    id 2618 \
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
    id 2619 \
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
    id 2620 \
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
    id 2621 \
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
    id 2622 \
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
    id 2623 \
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
    id 2624 \
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
    id 2625 \
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
    id 2626 \
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
    id 2627 \
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
    id 2628 \
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
    id 2629 \
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
    id 2630 \
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
    id 2631 \
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
    id 2632 \
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
    id 2633 \
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
    id 2634 \
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
    id 2635 \
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
    id 2636 \
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
    id 2637 \
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
    id 2638 \
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
    id 2639 \
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
    id 2640 \
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
    id 2641 \
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
    id 2642 \
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
    id 2643 \
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
    id 2644 \
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
    id 2645 \
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
    id 2646 \
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
    id 2647 \
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
    id 2648 \
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
    id 2649 \
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
    id 2650 \
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
    id 2651 \
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
    id 2652 \
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
    id 2653 \
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
    id 2654 \
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
    id 2655 \
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
    id 2656 \
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
    id 2657 \
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
    id 2658 \
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
    id 2659 \
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
    id 2660 \
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
    id 2661 \
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
    id 2662 \
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
    id 2663 \
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
    id 2664 \
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
    id 2665 \
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
    id 2666 \
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
    id 2667 \
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
    id 2668 \
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
    id 2669 \
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
    id 2670 \
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
    id 2671 \
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
    id 2672 \
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
    id 2673 \
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
    id 2674 \
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
    id 2675 \
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
    id 2676 \
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
    id 2677 \
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
    id 2678 \
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
    id 2679 \
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
    id 2680 \
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
    id 2681 \
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
    id 2682 \
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
    id 2683 \
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
    id 2684 \
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
    id 2685 \
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
    id 2686 \
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
    id 2687 \
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
    id 2688 \
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
    id 2689 \
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
    id 2690 \
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
    id 2691 \
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
    id 2692 \
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
    id 2693 \
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
    id 2694 \
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
    id 2695 \
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
    id 2696 \
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
    id 2697 \
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
    id 2698 \
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
    id 2699 \
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
    id 2700 \
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
    id 2701 \
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
    id 2702 \
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
    id 2703 \
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
    id 2704 \
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
    id 2705 \
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
    id 2706 \
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
    id 2707 \
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
    id 2708 \
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
    id 2709 \
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
    id 2710 \
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
    id 2711 \
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
    id 2712 \
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
    id 2713 \
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
    id 2714 \
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
    id 2715 \
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
    id 2716 \
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
    id 2717 \
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
    id 2718 \
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
    id 2719 \
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
    id 2720 \
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
    id 2721 \
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
    id 2722 \
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
    id 2723 \
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
    id 2724 \
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
    id 2725 \
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
    id 2726 \
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



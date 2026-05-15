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
    id 1842 \
    name SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_13 \
    op interface \
    ports { SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_13_address0 { O 10 vector } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_13_ce0 { O 1 bit } SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_13_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'SubbandBand0TopQ610_ap_int_const_ap_int_const_ap_int_const_ap_int_const_ap_i_13'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1585 \
    name prev_hx_q610_0_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_0_val \
    op interface \
    ports { prev_hx_q610_0_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1586 \
    name prev_hx_q610_32_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_32_val \
    op interface \
    ports { prev_hx_q610_32_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1587 \
    name prev_hx_q610_64_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_64_val \
    op interface \
    ports { prev_hx_q610_64_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1588 \
    name prev_hx_q610_96_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_96_val \
    op interface \
    ports { prev_hx_q610_96_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1589 \
    name prev_hx_q610_128_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_128_val \
    op interface \
    ports { prev_hx_q610_128_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1590 \
    name prev_hx_q610_160_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_160_val \
    op interface \
    ports { prev_hx_q610_160_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1591 \
    name prev_hx_q610_192_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_192_val \
    op interface \
    ports { prev_hx_q610_192_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1592 \
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
    id 1593 \
    name prev_hx_q610_1_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_1_val \
    op interface \
    ports { prev_hx_q610_1_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1594 \
    name prev_hx_q610_33_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_33_val \
    op interface \
    ports { prev_hx_q610_33_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1595 \
    name prev_hx_q610_65_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_65_val \
    op interface \
    ports { prev_hx_q610_65_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1596 \
    name prev_hx_q610_97_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_97_val \
    op interface \
    ports { prev_hx_q610_97_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1597 \
    name prev_hx_q610_129_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_129_val \
    op interface \
    ports { prev_hx_q610_129_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1598 \
    name prev_hx_q610_161_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_161_val \
    op interface \
    ports { prev_hx_q610_161_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1599 \
    name prev_hx_q610_193_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_193_val \
    op interface \
    ports { prev_hx_q610_193_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1600 \
    name prev_hx_q610_2_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_2_val \
    op interface \
    ports { prev_hx_q610_2_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1601 \
    name prev_hx_q610_34_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_34_val \
    op interface \
    ports { prev_hx_q610_34_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1602 \
    name prev_hx_q610_66_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_66_val \
    op interface \
    ports { prev_hx_q610_66_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1603 \
    name prev_hx_q610_98_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_98_val \
    op interface \
    ports { prev_hx_q610_98_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1604 \
    name prev_hx_q610_130_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_130_val \
    op interface \
    ports { prev_hx_q610_130_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1605 \
    name prev_hx_q610_162_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_162_val \
    op interface \
    ports { prev_hx_q610_162_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1606 \
    name prev_hx_q610_194_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_194_val \
    op interface \
    ports { prev_hx_q610_194_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1607 \
    name prev_hx_q610_3_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_3_val \
    op interface \
    ports { prev_hx_q610_3_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1608 \
    name prev_hx_q610_35_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_35_val \
    op interface \
    ports { prev_hx_q610_35_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1609 \
    name prev_hx_q610_67_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_67_val \
    op interface \
    ports { prev_hx_q610_67_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1610 \
    name prev_hx_q610_99_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_99_val \
    op interface \
    ports { prev_hx_q610_99_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1611 \
    name prev_hx_q610_131_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_131_val \
    op interface \
    ports { prev_hx_q610_131_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1612 \
    name prev_hx_q610_163_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_163_val \
    op interface \
    ports { prev_hx_q610_163_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1613 \
    name prev_hx_q610_195_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_195_val \
    op interface \
    ports { prev_hx_q610_195_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1614 \
    name prev_hx_q610_4_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_4_val \
    op interface \
    ports { prev_hx_q610_4_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1615 \
    name prev_hx_q610_36_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_36_val \
    op interface \
    ports { prev_hx_q610_36_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1616 \
    name prev_hx_q610_68_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_68_val \
    op interface \
    ports { prev_hx_q610_68_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1617 \
    name prev_hx_q610_100_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_100_val \
    op interface \
    ports { prev_hx_q610_100_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1618 \
    name prev_hx_q610_132_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_132_val \
    op interface \
    ports { prev_hx_q610_132_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1619 \
    name prev_hx_q610_164_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_164_val \
    op interface \
    ports { prev_hx_q610_164_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1620 \
    name prev_hx_q610_196_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_196_val \
    op interface \
    ports { prev_hx_q610_196_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1621 \
    name prev_hx_q610_5_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_5_val \
    op interface \
    ports { prev_hx_q610_5_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1622 \
    name prev_hx_q610_37_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_37_val \
    op interface \
    ports { prev_hx_q610_37_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1623 \
    name prev_hx_q610_69_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_69_val \
    op interface \
    ports { prev_hx_q610_69_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1624 \
    name prev_hx_q610_101_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_101_val \
    op interface \
    ports { prev_hx_q610_101_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1625 \
    name prev_hx_q610_133_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_133_val \
    op interface \
    ports { prev_hx_q610_133_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1626 \
    name prev_hx_q610_165_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_165_val \
    op interface \
    ports { prev_hx_q610_165_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1627 \
    name prev_hx_q610_197_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_197_val \
    op interface \
    ports { prev_hx_q610_197_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1628 \
    name prev_hx_q610_6_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_6_val \
    op interface \
    ports { prev_hx_q610_6_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1629 \
    name prev_hx_q610_38_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_38_val \
    op interface \
    ports { prev_hx_q610_38_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1630 \
    name prev_hx_q610_70_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_70_val \
    op interface \
    ports { prev_hx_q610_70_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1631 \
    name prev_hx_q610_102_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_102_val \
    op interface \
    ports { prev_hx_q610_102_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1632 \
    name prev_hx_q610_134_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_134_val \
    op interface \
    ports { prev_hx_q610_134_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1633 \
    name prev_hx_q610_166_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_166_val \
    op interface \
    ports { prev_hx_q610_166_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1634 \
    name prev_hx_q610_198_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_198_val \
    op interface \
    ports { prev_hx_q610_198_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1635 \
    name prev_hx_q610_7_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_7_val \
    op interface \
    ports { prev_hx_q610_7_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1636 \
    name prev_hx_q610_39_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_39_val \
    op interface \
    ports { prev_hx_q610_39_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1637 \
    name prev_hx_q610_71_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_71_val \
    op interface \
    ports { prev_hx_q610_71_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1638 \
    name prev_hx_q610_103_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_103_val \
    op interface \
    ports { prev_hx_q610_103_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1639 \
    name prev_hx_q610_135_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_135_val \
    op interface \
    ports { prev_hx_q610_135_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1640 \
    name prev_hx_q610_167_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_167_val \
    op interface \
    ports { prev_hx_q610_167_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1641 \
    name prev_hx_q610_199_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_199_val \
    op interface \
    ports { prev_hx_q610_199_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1642 \
    name prev_hx_q610_8_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_8_val \
    op interface \
    ports { prev_hx_q610_8_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1643 \
    name prev_hx_q610_40_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_40_val \
    op interface \
    ports { prev_hx_q610_40_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1644 \
    name prev_hx_q610_72_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_72_val \
    op interface \
    ports { prev_hx_q610_72_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1645 \
    name prev_hx_q610_104_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_104_val \
    op interface \
    ports { prev_hx_q610_104_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1646 \
    name prev_hx_q610_136_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_136_val \
    op interface \
    ports { prev_hx_q610_136_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1647 \
    name prev_hx_q610_168_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_168_val \
    op interface \
    ports { prev_hx_q610_168_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1648 \
    name prev_hx_q610_200_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_200_val \
    op interface \
    ports { prev_hx_q610_200_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1649 \
    name prev_hx_q610_9_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_9_val \
    op interface \
    ports { prev_hx_q610_9_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1650 \
    name prev_hx_q610_41_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_41_val \
    op interface \
    ports { prev_hx_q610_41_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1651 \
    name prev_hx_q610_73_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_73_val \
    op interface \
    ports { prev_hx_q610_73_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1652 \
    name prev_hx_q610_105_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_105_val \
    op interface \
    ports { prev_hx_q610_105_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1653 \
    name prev_hx_q610_137_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_137_val \
    op interface \
    ports { prev_hx_q610_137_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1654 \
    name prev_hx_q610_169_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_169_val \
    op interface \
    ports { prev_hx_q610_169_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1655 \
    name prev_hx_q610_201_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_201_val \
    op interface \
    ports { prev_hx_q610_201_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1656 \
    name prev_hx_q610_10_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_10_val \
    op interface \
    ports { prev_hx_q610_10_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1657 \
    name prev_hx_q610_42_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_42_val \
    op interface \
    ports { prev_hx_q610_42_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1658 \
    name prev_hx_q610_74_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_74_val \
    op interface \
    ports { prev_hx_q610_74_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1659 \
    name prev_hx_q610_106_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_106_val \
    op interface \
    ports { prev_hx_q610_106_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1660 \
    name prev_hx_q610_138_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_138_val \
    op interface \
    ports { prev_hx_q610_138_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1661 \
    name prev_hx_q610_170_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_170_val \
    op interface \
    ports { prev_hx_q610_170_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1662 \
    name prev_hx_q610_202_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_202_val \
    op interface \
    ports { prev_hx_q610_202_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1663 \
    name prev_hx_q610_11_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_11_val \
    op interface \
    ports { prev_hx_q610_11_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1664 \
    name prev_hx_q610_43_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_43_val \
    op interface \
    ports { prev_hx_q610_43_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1665 \
    name prev_hx_q610_75_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_75_val \
    op interface \
    ports { prev_hx_q610_75_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1666 \
    name prev_hx_q610_107_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_107_val \
    op interface \
    ports { prev_hx_q610_107_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1667 \
    name prev_hx_q610_139_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_139_val \
    op interface \
    ports { prev_hx_q610_139_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1668 \
    name prev_hx_q610_171_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_171_val \
    op interface \
    ports { prev_hx_q610_171_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1669 \
    name prev_hx_q610_203_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_203_val \
    op interface \
    ports { prev_hx_q610_203_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1670 \
    name prev_hx_q610_12_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_12_val \
    op interface \
    ports { prev_hx_q610_12_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1671 \
    name prev_hx_q610_44_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_44_val \
    op interface \
    ports { prev_hx_q610_44_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1672 \
    name prev_hx_q610_76_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_76_val \
    op interface \
    ports { prev_hx_q610_76_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1673 \
    name prev_hx_q610_108_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_108_val \
    op interface \
    ports { prev_hx_q610_108_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1674 \
    name prev_hx_q610_140_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_140_val \
    op interface \
    ports { prev_hx_q610_140_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1675 \
    name prev_hx_q610_172_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_172_val \
    op interface \
    ports { prev_hx_q610_172_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1676 \
    name prev_hx_q610_204_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_204_val \
    op interface \
    ports { prev_hx_q610_204_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1677 \
    name prev_hx_q610_13_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_13_val \
    op interface \
    ports { prev_hx_q610_13_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1678 \
    name prev_hx_q610_45_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_45_val \
    op interface \
    ports { prev_hx_q610_45_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1679 \
    name prev_hx_q610_77_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_77_val \
    op interface \
    ports { prev_hx_q610_77_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1680 \
    name prev_hx_q610_109_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_109_val \
    op interface \
    ports { prev_hx_q610_109_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1681 \
    name prev_hx_q610_141_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_141_val \
    op interface \
    ports { prev_hx_q610_141_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1682 \
    name prev_hx_q610_173_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_173_val \
    op interface \
    ports { prev_hx_q610_173_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1683 \
    name prev_hx_q610_205_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_205_val \
    op interface \
    ports { prev_hx_q610_205_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1684 \
    name prev_hx_q610_14_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_14_val \
    op interface \
    ports { prev_hx_q610_14_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1685 \
    name prev_hx_q610_46_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_46_val \
    op interface \
    ports { prev_hx_q610_46_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1686 \
    name prev_hx_q610_78_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_78_val \
    op interface \
    ports { prev_hx_q610_78_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1687 \
    name prev_hx_q610_110_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_110_val \
    op interface \
    ports { prev_hx_q610_110_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1688 \
    name prev_hx_q610_142_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_142_val \
    op interface \
    ports { prev_hx_q610_142_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1689 \
    name prev_hx_q610_174_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_174_val \
    op interface \
    ports { prev_hx_q610_174_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1690 \
    name prev_hx_q610_206_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_206_val \
    op interface \
    ports { prev_hx_q610_206_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1691 \
    name prev_hx_q610_15_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_15_val \
    op interface \
    ports { prev_hx_q610_15_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1692 \
    name prev_hx_q610_47_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_47_val \
    op interface \
    ports { prev_hx_q610_47_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1693 \
    name prev_hx_q610_79_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_79_val \
    op interface \
    ports { prev_hx_q610_79_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1694 \
    name prev_hx_q610_111_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_111_val \
    op interface \
    ports { prev_hx_q610_111_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1695 \
    name prev_hx_q610_143_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_143_val \
    op interface \
    ports { prev_hx_q610_143_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1696 \
    name prev_hx_q610_175_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_175_val \
    op interface \
    ports { prev_hx_q610_175_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1697 \
    name prev_hx_q610_207_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_207_val \
    op interface \
    ports { prev_hx_q610_207_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1698 \
    name prev_hx_q610_16_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_16_val \
    op interface \
    ports { prev_hx_q610_16_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1699 \
    name prev_hx_q610_48_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_48_val \
    op interface \
    ports { prev_hx_q610_48_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1700 \
    name prev_hx_q610_80_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_80_val \
    op interface \
    ports { prev_hx_q610_80_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1701 \
    name prev_hx_q610_112_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_112_val \
    op interface \
    ports { prev_hx_q610_112_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1702 \
    name prev_hx_q610_144_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_144_val \
    op interface \
    ports { prev_hx_q610_144_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1703 \
    name prev_hx_q610_176_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_176_val \
    op interface \
    ports { prev_hx_q610_176_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1704 \
    name prev_hx_q610_208_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_208_val \
    op interface \
    ports { prev_hx_q610_208_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1705 \
    name prev_hx_q610_17_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_17_val \
    op interface \
    ports { prev_hx_q610_17_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1706 \
    name prev_hx_q610_49_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_49_val \
    op interface \
    ports { prev_hx_q610_49_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1707 \
    name prev_hx_q610_81_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_81_val \
    op interface \
    ports { prev_hx_q610_81_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1708 \
    name prev_hx_q610_113_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_113_val \
    op interface \
    ports { prev_hx_q610_113_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1709 \
    name prev_hx_q610_145_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_145_val \
    op interface \
    ports { prev_hx_q610_145_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1710 \
    name prev_hx_q610_177_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_177_val \
    op interface \
    ports { prev_hx_q610_177_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1711 \
    name prev_hx_q610_209_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_209_val \
    op interface \
    ports { prev_hx_q610_209_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1712 \
    name prev_hx_q610_18_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_18_val \
    op interface \
    ports { prev_hx_q610_18_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1713 \
    name prev_hx_q610_50_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_50_val \
    op interface \
    ports { prev_hx_q610_50_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1714 \
    name prev_hx_q610_82_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_82_val \
    op interface \
    ports { prev_hx_q610_82_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1715 \
    name prev_hx_q610_114_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_114_val \
    op interface \
    ports { prev_hx_q610_114_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1716 \
    name prev_hx_q610_146_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_146_val \
    op interface \
    ports { prev_hx_q610_146_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1717 \
    name prev_hx_q610_178_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_178_val \
    op interface \
    ports { prev_hx_q610_178_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1718 \
    name prev_hx_q610_210_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_210_val \
    op interface \
    ports { prev_hx_q610_210_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1719 \
    name prev_hx_q610_19_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_19_val \
    op interface \
    ports { prev_hx_q610_19_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1720 \
    name prev_hx_q610_51_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_51_val \
    op interface \
    ports { prev_hx_q610_51_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1721 \
    name prev_hx_q610_83_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_83_val \
    op interface \
    ports { prev_hx_q610_83_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1722 \
    name prev_hx_q610_115_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_115_val \
    op interface \
    ports { prev_hx_q610_115_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1723 \
    name prev_hx_q610_147_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_147_val \
    op interface \
    ports { prev_hx_q610_147_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1724 \
    name prev_hx_q610_179_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_179_val \
    op interface \
    ports { prev_hx_q610_179_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1725 \
    name prev_hx_q610_211_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_211_val \
    op interface \
    ports { prev_hx_q610_211_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1726 \
    name prev_hx_q610_20_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_20_val \
    op interface \
    ports { prev_hx_q610_20_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1727 \
    name prev_hx_q610_52_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_52_val \
    op interface \
    ports { prev_hx_q610_52_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1728 \
    name prev_hx_q610_84_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_84_val \
    op interface \
    ports { prev_hx_q610_84_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1729 \
    name prev_hx_q610_116_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_116_val \
    op interface \
    ports { prev_hx_q610_116_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1730 \
    name prev_hx_q610_148_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_148_val \
    op interface \
    ports { prev_hx_q610_148_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1731 \
    name prev_hx_q610_180_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_180_val \
    op interface \
    ports { prev_hx_q610_180_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1732 \
    name prev_hx_q610_212_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_212_val \
    op interface \
    ports { prev_hx_q610_212_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1733 \
    name prev_hx_q610_21_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_21_val \
    op interface \
    ports { prev_hx_q610_21_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1734 \
    name prev_hx_q610_53_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_53_val \
    op interface \
    ports { prev_hx_q610_53_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1735 \
    name prev_hx_q610_85_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_85_val \
    op interface \
    ports { prev_hx_q610_85_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1736 \
    name prev_hx_q610_117_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_117_val \
    op interface \
    ports { prev_hx_q610_117_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1737 \
    name prev_hx_q610_149_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_149_val \
    op interface \
    ports { prev_hx_q610_149_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1738 \
    name prev_hx_q610_181_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_181_val \
    op interface \
    ports { prev_hx_q610_181_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1739 \
    name prev_hx_q610_213_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_213_val \
    op interface \
    ports { prev_hx_q610_213_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1740 \
    name prev_hx_q610_22_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_22_val \
    op interface \
    ports { prev_hx_q610_22_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1741 \
    name prev_hx_q610_54_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_54_val \
    op interface \
    ports { prev_hx_q610_54_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1742 \
    name prev_hx_q610_86_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_86_val \
    op interface \
    ports { prev_hx_q610_86_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1743 \
    name prev_hx_q610_118_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_118_val \
    op interface \
    ports { prev_hx_q610_118_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1744 \
    name prev_hx_q610_150_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_150_val \
    op interface \
    ports { prev_hx_q610_150_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1745 \
    name prev_hx_q610_182_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_182_val \
    op interface \
    ports { prev_hx_q610_182_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1746 \
    name prev_hx_q610_214_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_214_val \
    op interface \
    ports { prev_hx_q610_214_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1747 \
    name prev_hx_q610_23_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_23_val \
    op interface \
    ports { prev_hx_q610_23_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1748 \
    name prev_hx_q610_55_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_55_val \
    op interface \
    ports { prev_hx_q610_55_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1749 \
    name prev_hx_q610_87_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_87_val \
    op interface \
    ports { prev_hx_q610_87_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1750 \
    name prev_hx_q610_119_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_119_val \
    op interface \
    ports { prev_hx_q610_119_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1751 \
    name prev_hx_q610_151_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_151_val \
    op interface \
    ports { prev_hx_q610_151_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1752 \
    name prev_hx_q610_183_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_183_val \
    op interface \
    ports { prev_hx_q610_183_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1753 \
    name prev_hx_q610_215_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_215_val \
    op interface \
    ports { prev_hx_q610_215_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1754 \
    name prev_hx_q610_24_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_24_val \
    op interface \
    ports { prev_hx_q610_24_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1755 \
    name prev_hx_q610_56_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_56_val \
    op interface \
    ports { prev_hx_q610_56_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1756 \
    name prev_hx_q610_88_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_88_val \
    op interface \
    ports { prev_hx_q610_88_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1757 \
    name prev_hx_q610_120_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_120_val \
    op interface \
    ports { prev_hx_q610_120_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1758 \
    name prev_hx_q610_152_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_152_val \
    op interface \
    ports { prev_hx_q610_152_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1759 \
    name prev_hx_q610_184_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_184_val \
    op interface \
    ports { prev_hx_q610_184_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1760 \
    name prev_hx_q610_216_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_216_val \
    op interface \
    ports { prev_hx_q610_216_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1761 \
    name prev_hx_q610_25_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_25_val \
    op interface \
    ports { prev_hx_q610_25_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1762 \
    name prev_hx_q610_57_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_57_val \
    op interface \
    ports { prev_hx_q610_57_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1763 \
    name prev_hx_q610_89_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_89_val \
    op interface \
    ports { prev_hx_q610_89_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1764 \
    name prev_hx_q610_121_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_121_val \
    op interface \
    ports { prev_hx_q610_121_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1765 \
    name prev_hx_q610_153_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_153_val \
    op interface \
    ports { prev_hx_q610_153_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1766 \
    name prev_hx_q610_185_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_185_val \
    op interface \
    ports { prev_hx_q610_185_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1767 \
    name prev_hx_q610_217_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_217_val \
    op interface \
    ports { prev_hx_q610_217_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1768 \
    name prev_hx_q610_26_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_26_val \
    op interface \
    ports { prev_hx_q610_26_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1769 \
    name prev_hx_q610_58_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_58_val \
    op interface \
    ports { prev_hx_q610_58_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1770 \
    name prev_hx_q610_90_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_90_val \
    op interface \
    ports { prev_hx_q610_90_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1771 \
    name prev_hx_q610_122_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_122_val \
    op interface \
    ports { prev_hx_q610_122_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1772 \
    name prev_hx_q610_154_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_154_val \
    op interface \
    ports { prev_hx_q610_154_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1773 \
    name prev_hx_q610_186_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_186_val \
    op interface \
    ports { prev_hx_q610_186_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1774 \
    name prev_hx_q610_218_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_218_val \
    op interface \
    ports { prev_hx_q610_218_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1775 \
    name prev_hx_q610_27_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_27_val \
    op interface \
    ports { prev_hx_q610_27_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1776 \
    name prev_hx_q610_59_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_59_val \
    op interface \
    ports { prev_hx_q610_59_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1777 \
    name prev_hx_q610_91_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_91_val \
    op interface \
    ports { prev_hx_q610_91_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1778 \
    name prev_hx_q610_123_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_123_val \
    op interface \
    ports { prev_hx_q610_123_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1779 \
    name prev_hx_q610_155_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_155_val \
    op interface \
    ports { prev_hx_q610_155_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1780 \
    name prev_hx_q610_187_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_187_val \
    op interface \
    ports { prev_hx_q610_187_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1781 \
    name prev_hx_q610_219_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_219_val \
    op interface \
    ports { prev_hx_q610_219_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1782 \
    name prev_hx_q610_28_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_28_val \
    op interface \
    ports { prev_hx_q610_28_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1783 \
    name prev_hx_q610_60_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_60_val \
    op interface \
    ports { prev_hx_q610_60_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1784 \
    name prev_hx_q610_92_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_92_val \
    op interface \
    ports { prev_hx_q610_92_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1785 \
    name prev_hx_q610_124_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_124_val \
    op interface \
    ports { prev_hx_q610_124_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1786 \
    name prev_hx_q610_156_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_156_val \
    op interface \
    ports { prev_hx_q610_156_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1787 \
    name prev_hx_q610_188_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_188_val \
    op interface \
    ports { prev_hx_q610_188_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1788 \
    name prev_hx_q610_220_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_220_val \
    op interface \
    ports { prev_hx_q610_220_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1789 \
    name prev_hx_q610_29_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_29_val \
    op interface \
    ports { prev_hx_q610_29_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1790 \
    name prev_hx_q610_61_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_61_val \
    op interface \
    ports { prev_hx_q610_61_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1791 \
    name prev_hx_q610_93_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_93_val \
    op interface \
    ports { prev_hx_q610_93_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1792 \
    name prev_hx_q610_125_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_125_val \
    op interface \
    ports { prev_hx_q610_125_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1793 \
    name prev_hx_q610_157_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_157_val \
    op interface \
    ports { prev_hx_q610_157_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1794 \
    name prev_hx_q610_189_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_189_val \
    op interface \
    ports { prev_hx_q610_189_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1795 \
    name prev_hx_q610_221_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_221_val \
    op interface \
    ports { prev_hx_q610_221_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1796 \
    name prev_hx_q610_30_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_30_val \
    op interface \
    ports { prev_hx_q610_30_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1797 \
    name prev_hx_q610_62_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_62_val \
    op interface \
    ports { prev_hx_q610_62_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1798 \
    name prev_hx_q610_94_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_94_val \
    op interface \
    ports { prev_hx_q610_94_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1799 \
    name prev_hx_q610_126_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_126_val \
    op interface \
    ports { prev_hx_q610_126_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1800 \
    name prev_hx_q610_158_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_158_val \
    op interface \
    ports { prev_hx_q610_158_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1801 \
    name prev_hx_q610_190_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_190_val \
    op interface \
    ports { prev_hx_q610_190_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1802 \
    name prev_hx_q610_222_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_222_val \
    op interface \
    ports { prev_hx_q610_222_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1803 \
    name prev_hx_q610_31_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_31_val \
    op interface \
    ports { prev_hx_q610_31_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1804 \
    name prev_hx_q610_63_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_63_val \
    op interface \
    ports { prev_hx_q610_63_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1805 \
    name prev_hx_q610_95_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_95_val \
    op interface \
    ports { prev_hx_q610_95_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1806 \
    name prev_hx_q610_127_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_127_val \
    op interface \
    ports { prev_hx_q610_127_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1807 \
    name prev_hx_q610_159_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_159_val \
    op interface \
    ports { prev_hx_q610_159_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1808 \
    name prev_hx_q610_191_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_191_val \
    op interface \
    ports { prev_hx_q610_191_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1809 \
    name prev_hx_q610_223_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_223_val \
    op interface \
    ports { prev_hx_q610_223_val { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1810 \
    name p_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out \
    op interface \
    ports { p_out { O 30 vector } p_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1811 \
    name p_out1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out1 \
    op interface \
    ports { p_out1 { O 30 vector } p_out1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1812 \
    name p_out2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out2 \
    op interface \
    ports { p_out2 { O 30 vector } p_out2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1813 \
    name p_out3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out3 \
    op interface \
    ports { p_out3 { O 30 vector } p_out3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1814 \
    name p_out4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out4 \
    op interface \
    ports { p_out4 { O 30 vector } p_out4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1815 \
    name p_out5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out5 \
    op interface \
    ports { p_out5 { O 30 vector } p_out5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1816 \
    name p_out6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out6 \
    op interface \
    ports { p_out6 { O 30 vector } p_out6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1817 \
    name p_out7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out7 \
    op interface \
    ports { p_out7 { O 30 vector } p_out7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1818 \
    name p_out8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out8 \
    op interface \
    ports { p_out8 { O 30 vector } p_out8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1819 \
    name p_out9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out9 \
    op interface \
    ports { p_out9 { O 30 vector } p_out9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1820 \
    name p_out10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out10 \
    op interface \
    ports { p_out10 { O 30 vector } p_out10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1821 \
    name p_out11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out11 \
    op interface \
    ports { p_out11 { O 30 vector } p_out11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1822 \
    name p_out12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out12 \
    op interface \
    ports { p_out12 { O 30 vector } p_out12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1823 \
    name p_out13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out13 \
    op interface \
    ports { p_out13 { O 30 vector } p_out13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1824 \
    name p_out14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out14 \
    op interface \
    ports { p_out14 { O 30 vector } p_out14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1825 \
    name p_out15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out15 \
    op interface \
    ports { p_out15 { O 30 vector } p_out15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1826 \
    name p_out16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out16 \
    op interface \
    ports { p_out16 { O 30 vector } p_out16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1827 \
    name p_out17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out17 \
    op interface \
    ports { p_out17 { O 30 vector } p_out17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1828 \
    name p_out18 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out18 \
    op interface \
    ports { p_out18 { O 30 vector } p_out18_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1829 \
    name p_out19 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out19 \
    op interface \
    ports { p_out19 { O 30 vector } p_out19_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1830 \
    name p_out20 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out20 \
    op interface \
    ports { p_out20 { O 30 vector } p_out20_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1831 \
    name p_out21 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out21 \
    op interface \
    ports { p_out21 { O 30 vector } p_out21_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1832 \
    name p_out22 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out22 \
    op interface \
    ports { p_out22 { O 30 vector } p_out22_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1833 \
    name p_out23 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out23 \
    op interface \
    ports { p_out23 { O 30 vector } p_out23_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1834 \
    name p_out24 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out24 \
    op interface \
    ports { p_out24 { O 30 vector } p_out24_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1835 \
    name p_out25 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out25 \
    op interface \
    ports { p_out25 { O 30 vector } p_out25_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1836 \
    name p_out26 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out26 \
    op interface \
    ports { p_out26 { O 30 vector } p_out26_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1837 \
    name p_out27 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out27 \
    op interface \
    ports { p_out27 { O 30 vector } p_out27_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1838 \
    name p_out28 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out28 \
    op interface \
    ports { p_out28 { O 30 vector } p_out28_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1839 \
    name p_out29 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out29 \
    op interface \
    ports { p_out29 { O 30 vector } p_out29_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1840 \
    name p_out30 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out30 \
    op interface \
    ports { p_out30 { O 30 vector } p_out30_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1841 \
    name p_out31 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p_out31 \
    op interface \
    ports { p_out31 { O 30 vector } p_out31_ap_vld { O 1 bit } } \
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



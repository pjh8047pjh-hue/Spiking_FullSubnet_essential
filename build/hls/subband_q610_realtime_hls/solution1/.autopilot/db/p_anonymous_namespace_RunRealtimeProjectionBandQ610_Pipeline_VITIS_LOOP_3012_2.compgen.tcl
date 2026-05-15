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
    id 5486 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_address0 { O 11 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_pr'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5229 \
    name projection_input_672_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_672_reload \
    op interface \
    ports { projection_input_672_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5230 \
    name projection_input_704_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_704_reload \
    op interface \
    ports { projection_input_704_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5231 \
    name projection_input_736_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_736_reload \
    op interface \
    ports { projection_input_736_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5232 \
    name projection_input_768_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_768_reload \
    op interface \
    ports { projection_input_768_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5233 \
    name projection_input_800_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_800_reload \
    op interface \
    ports { projection_input_800_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5234 \
    name projection_input_832_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_832_reload \
    op interface \
    ports { projection_input_832_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5235 \
    name projection_input_864_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_864_reload \
    op interface \
    ports { projection_input_864_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5236 \
    name sub_ln3017 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_ln3017 \
    op interface \
    ports { sub_ln3017 { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5237 \
    name projection_input_673_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_673_reload \
    op interface \
    ports { projection_input_673_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5238 \
    name projection_input_705_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_705_reload \
    op interface \
    ports { projection_input_705_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5239 \
    name projection_input_737_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_737_reload \
    op interface \
    ports { projection_input_737_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5240 \
    name projection_input_769_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_769_reload \
    op interface \
    ports { projection_input_769_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5241 \
    name projection_input_801_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_801_reload \
    op interface \
    ports { projection_input_801_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5242 \
    name projection_input_833_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_833_reload \
    op interface \
    ports { projection_input_833_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5243 \
    name projection_input_865_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_865_reload \
    op interface \
    ports { projection_input_865_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5244 \
    name projection_input_674_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_674_reload \
    op interface \
    ports { projection_input_674_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5245 \
    name projection_input_706_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_706_reload \
    op interface \
    ports { projection_input_706_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5246 \
    name projection_input_738_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_738_reload \
    op interface \
    ports { projection_input_738_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5247 \
    name projection_input_770_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_770_reload \
    op interface \
    ports { projection_input_770_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5248 \
    name projection_input_802_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_802_reload \
    op interface \
    ports { projection_input_802_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5249 \
    name projection_input_834_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_834_reload \
    op interface \
    ports { projection_input_834_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5250 \
    name projection_input_866_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_866_reload \
    op interface \
    ports { projection_input_866_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5251 \
    name projection_input_675_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_675_reload \
    op interface \
    ports { projection_input_675_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5252 \
    name projection_input_707_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_707_reload \
    op interface \
    ports { projection_input_707_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5253 \
    name projection_input_739_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_739_reload \
    op interface \
    ports { projection_input_739_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5254 \
    name projection_input_771_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_771_reload \
    op interface \
    ports { projection_input_771_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5255 \
    name projection_input_803_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_803_reload \
    op interface \
    ports { projection_input_803_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5256 \
    name projection_input_835_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_835_reload \
    op interface \
    ports { projection_input_835_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5257 \
    name projection_input_867_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_867_reload \
    op interface \
    ports { projection_input_867_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5258 \
    name projection_input_676_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_676_reload \
    op interface \
    ports { projection_input_676_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5259 \
    name projection_input_708_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_708_reload \
    op interface \
    ports { projection_input_708_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5260 \
    name projection_input_740_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_740_reload \
    op interface \
    ports { projection_input_740_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5261 \
    name projection_input_772_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_772_reload \
    op interface \
    ports { projection_input_772_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5262 \
    name projection_input_804_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_804_reload \
    op interface \
    ports { projection_input_804_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5263 \
    name projection_input_836_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_836_reload \
    op interface \
    ports { projection_input_836_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5264 \
    name projection_input_868_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_868_reload \
    op interface \
    ports { projection_input_868_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5265 \
    name projection_input_677_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_677_reload \
    op interface \
    ports { projection_input_677_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5266 \
    name projection_input_709_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_709_reload \
    op interface \
    ports { projection_input_709_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5267 \
    name projection_input_741_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_741_reload \
    op interface \
    ports { projection_input_741_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5268 \
    name projection_input_773_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_773_reload \
    op interface \
    ports { projection_input_773_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5269 \
    name projection_input_805_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_805_reload \
    op interface \
    ports { projection_input_805_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5270 \
    name projection_input_837_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_837_reload \
    op interface \
    ports { projection_input_837_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5271 \
    name projection_input_869_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_869_reload \
    op interface \
    ports { projection_input_869_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5272 \
    name projection_input_678_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_678_reload \
    op interface \
    ports { projection_input_678_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5273 \
    name projection_input_710_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_710_reload \
    op interface \
    ports { projection_input_710_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5274 \
    name projection_input_742_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_742_reload \
    op interface \
    ports { projection_input_742_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5275 \
    name projection_input_774_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_774_reload \
    op interface \
    ports { projection_input_774_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5276 \
    name projection_input_806_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_806_reload \
    op interface \
    ports { projection_input_806_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5277 \
    name projection_input_838_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_838_reload \
    op interface \
    ports { projection_input_838_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5278 \
    name projection_input_870_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_870_reload \
    op interface \
    ports { projection_input_870_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5279 \
    name projection_input_679_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_679_reload \
    op interface \
    ports { projection_input_679_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5280 \
    name projection_input_711_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_711_reload \
    op interface \
    ports { projection_input_711_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5281 \
    name projection_input_743_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_743_reload \
    op interface \
    ports { projection_input_743_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5282 \
    name projection_input_775_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_775_reload \
    op interface \
    ports { projection_input_775_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5283 \
    name projection_input_807_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_807_reload \
    op interface \
    ports { projection_input_807_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5284 \
    name projection_input_839_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_839_reload \
    op interface \
    ports { projection_input_839_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5285 \
    name projection_input_871_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_871_reload \
    op interface \
    ports { projection_input_871_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5286 \
    name projection_input_680_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_680_reload \
    op interface \
    ports { projection_input_680_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5287 \
    name projection_input_712_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_712_reload \
    op interface \
    ports { projection_input_712_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5288 \
    name projection_input_744_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_744_reload \
    op interface \
    ports { projection_input_744_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5289 \
    name projection_input_776_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_776_reload \
    op interface \
    ports { projection_input_776_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5290 \
    name projection_input_808_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_808_reload \
    op interface \
    ports { projection_input_808_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5291 \
    name projection_input_840_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_840_reload \
    op interface \
    ports { projection_input_840_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5292 \
    name projection_input_872_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_872_reload \
    op interface \
    ports { projection_input_872_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5293 \
    name projection_input_681_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_681_reload \
    op interface \
    ports { projection_input_681_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5294 \
    name projection_input_713_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_713_reload \
    op interface \
    ports { projection_input_713_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5295 \
    name projection_input_745_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_745_reload \
    op interface \
    ports { projection_input_745_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5296 \
    name projection_input_777_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_777_reload \
    op interface \
    ports { projection_input_777_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5297 \
    name projection_input_809_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_809_reload \
    op interface \
    ports { projection_input_809_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5298 \
    name projection_input_841_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_841_reload \
    op interface \
    ports { projection_input_841_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5299 \
    name projection_input_873_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_873_reload \
    op interface \
    ports { projection_input_873_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5300 \
    name projection_input_682_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_682_reload \
    op interface \
    ports { projection_input_682_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5301 \
    name projection_input_714_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_714_reload \
    op interface \
    ports { projection_input_714_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5302 \
    name projection_input_746_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_746_reload \
    op interface \
    ports { projection_input_746_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5303 \
    name projection_input_778_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_778_reload \
    op interface \
    ports { projection_input_778_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5304 \
    name projection_input_810_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_810_reload \
    op interface \
    ports { projection_input_810_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5305 \
    name projection_input_842_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_842_reload \
    op interface \
    ports { projection_input_842_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5306 \
    name projection_input_874_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_874_reload \
    op interface \
    ports { projection_input_874_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5307 \
    name projection_input_683_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_683_reload \
    op interface \
    ports { projection_input_683_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5308 \
    name projection_input_715_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_715_reload \
    op interface \
    ports { projection_input_715_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5309 \
    name projection_input_747_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_747_reload \
    op interface \
    ports { projection_input_747_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5310 \
    name projection_input_779_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_779_reload \
    op interface \
    ports { projection_input_779_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5311 \
    name projection_input_811_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_811_reload \
    op interface \
    ports { projection_input_811_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5312 \
    name projection_input_843_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_843_reload \
    op interface \
    ports { projection_input_843_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5313 \
    name projection_input_875_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_875_reload \
    op interface \
    ports { projection_input_875_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5314 \
    name projection_input_684_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_684_reload \
    op interface \
    ports { projection_input_684_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5315 \
    name projection_input_716_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_716_reload \
    op interface \
    ports { projection_input_716_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5316 \
    name projection_input_748_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_748_reload \
    op interface \
    ports { projection_input_748_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5317 \
    name projection_input_780_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_780_reload \
    op interface \
    ports { projection_input_780_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5318 \
    name projection_input_812_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_812_reload \
    op interface \
    ports { projection_input_812_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5319 \
    name projection_input_844_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_844_reload \
    op interface \
    ports { projection_input_844_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5320 \
    name projection_input_876_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_876_reload \
    op interface \
    ports { projection_input_876_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5321 \
    name projection_input_685_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_685_reload \
    op interface \
    ports { projection_input_685_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5322 \
    name projection_input_717_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_717_reload \
    op interface \
    ports { projection_input_717_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5323 \
    name projection_input_749_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_749_reload \
    op interface \
    ports { projection_input_749_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5324 \
    name projection_input_781_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_781_reload \
    op interface \
    ports { projection_input_781_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5325 \
    name projection_input_813_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_813_reload \
    op interface \
    ports { projection_input_813_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5326 \
    name projection_input_845_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_845_reload \
    op interface \
    ports { projection_input_845_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5327 \
    name projection_input_877_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_877_reload \
    op interface \
    ports { projection_input_877_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5328 \
    name projection_input_686_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_686_reload \
    op interface \
    ports { projection_input_686_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5329 \
    name projection_input_718_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_718_reload \
    op interface \
    ports { projection_input_718_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5330 \
    name projection_input_750_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_750_reload \
    op interface \
    ports { projection_input_750_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5331 \
    name projection_input_782_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_782_reload \
    op interface \
    ports { projection_input_782_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5332 \
    name projection_input_814_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_814_reload \
    op interface \
    ports { projection_input_814_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5333 \
    name projection_input_846_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_846_reload \
    op interface \
    ports { projection_input_846_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5334 \
    name projection_input_878_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_878_reload \
    op interface \
    ports { projection_input_878_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5335 \
    name projection_input_687_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_687_reload \
    op interface \
    ports { projection_input_687_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5336 \
    name projection_input_719_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_719_reload \
    op interface \
    ports { projection_input_719_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5337 \
    name projection_input_751_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_751_reload \
    op interface \
    ports { projection_input_751_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5338 \
    name projection_input_783_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_783_reload \
    op interface \
    ports { projection_input_783_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5339 \
    name projection_input_815_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_815_reload \
    op interface \
    ports { projection_input_815_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5340 \
    name projection_input_847_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_847_reload \
    op interface \
    ports { projection_input_847_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5341 \
    name projection_input_879_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_879_reload \
    op interface \
    ports { projection_input_879_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5342 \
    name projection_input_688_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_688_reload \
    op interface \
    ports { projection_input_688_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5343 \
    name projection_input_720_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_720_reload \
    op interface \
    ports { projection_input_720_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5344 \
    name projection_input_752_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_752_reload \
    op interface \
    ports { projection_input_752_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5345 \
    name projection_input_784_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_784_reload \
    op interface \
    ports { projection_input_784_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5346 \
    name projection_input_816_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_816_reload \
    op interface \
    ports { projection_input_816_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5347 \
    name projection_input_848_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_848_reload \
    op interface \
    ports { projection_input_848_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5348 \
    name projection_input_880_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_880_reload \
    op interface \
    ports { projection_input_880_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5349 \
    name projection_input_689_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_689_reload \
    op interface \
    ports { projection_input_689_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5350 \
    name projection_input_721_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_721_reload \
    op interface \
    ports { projection_input_721_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5351 \
    name projection_input_753_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_753_reload \
    op interface \
    ports { projection_input_753_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5352 \
    name projection_input_785_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_785_reload \
    op interface \
    ports { projection_input_785_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5353 \
    name projection_input_817_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_817_reload \
    op interface \
    ports { projection_input_817_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5354 \
    name projection_input_849_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_849_reload \
    op interface \
    ports { projection_input_849_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5355 \
    name projection_input_881_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_881_reload \
    op interface \
    ports { projection_input_881_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5356 \
    name projection_input_690_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_690_reload \
    op interface \
    ports { projection_input_690_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5357 \
    name projection_input_722_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_722_reload \
    op interface \
    ports { projection_input_722_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5358 \
    name projection_input_754_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_754_reload \
    op interface \
    ports { projection_input_754_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5359 \
    name projection_input_786_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_786_reload \
    op interface \
    ports { projection_input_786_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5360 \
    name projection_input_818_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_818_reload \
    op interface \
    ports { projection_input_818_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5361 \
    name projection_input_850_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_850_reload \
    op interface \
    ports { projection_input_850_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5362 \
    name projection_input_882_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_882_reload \
    op interface \
    ports { projection_input_882_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5363 \
    name projection_input_691_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_691_reload \
    op interface \
    ports { projection_input_691_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5364 \
    name projection_input_723_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_723_reload \
    op interface \
    ports { projection_input_723_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5365 \
    name projection_input_755_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_755_reload \
    op interface \
    ports { projection_input_755_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5366 \
    name projection_input_787_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_787_reload \
    op interface \
    ports { projection_input_787_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5367 \
    name projection_input_819_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_819_reload \
    op interface \
    ports { projection_input_819_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5368 \
    name projection_input_851_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_851_reload \
    op interface \
    ports { projection_input_851_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5369 \
    name projection_input_883_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_883_reload \
    op interface \
    ports { projection_input_883_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5370 \
    name projection_input_692_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_692_reload \
    op interface \
    ports { projection_input_692_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5371 \
    name projection_input_724_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_724_reload \
    op interface \
    ports { projection_input_724_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5372 \
    name projection_input_756_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_756_reload \
    op interface \
    ports { projection_input_756_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5373 \
    name projection_input_788_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_788_reload \
    op interface \
    ports { projection_input_788_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5374 \
    name projection_input_820_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_820_reload \
    op interface \
    ports { projection_input_820_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5375 \
    name projection_input_852_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_852_reload \
    op interface \
    ports { projection_input_852_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5376 \
    name projection_input_884_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_884_reload \
    op interface \
    ports { projection_input_884_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5377 \
    name projection_input_693_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_693_reload \
    op interface \
    ports { projection_input_693_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5378 \
    name projection_input_725_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_725_reload \
    op interface \
    ports { projection_input_725_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5379 \
    name projection_input_757_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_757_reload \
    op interface \
    ports { projection_input_757_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5380 \
    name projection_input_789_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_789_reload \
    op interface \
    ports { projection_input_789_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5381 \
    name projection_input_821_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_821_reload \
    op interface \
    ports { projection_input_821_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5382 \
    name projection_input_853_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_853_reload \
    op interface \
    ports { projection_input_853_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5383 \
    name projection_input_885_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_885_reload \
    op interface \
    ports { projection_input_885_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5384 \
    name projection_input_694_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_694_reload \
    op interface \
    ports { projection_input_694_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5385 \
    name projection_input_726_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_726_reload \
    op interface \
    ports { projection_input_726_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5386 \
    name projection_input_758_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_758_reload \
    op interface \
    ports { projection_input_758_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5387 \
    name projection_input_790_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_790_reload \
    op interface \
    ports { projection_input_790_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5388 \
    name projection_input_822_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_822_reload \
    op interface \
    ports { projection_input_822_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5389 \
    name projection_input_854_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_854_reload \
    op interface \
    ports { projection_input_854_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5390 \
    name projection_input_886_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_886_reload \
    op interface \
    ports { projection_input_886_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5391 \
    name projection_input_695_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_695_reload \
    op interface \
    ports { projection_input_695_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5392 \
    name projection_input_727_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_727_reload \
    op interface \
    ports { projection_input_727_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5393 \
    name projection_input_759_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_759_reload \
    op interface \
    ports { projection_input_759_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5394 \
    name projection_input_791_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_791_reload \
    op interface \
    ports { projection_input_791_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5395 \
    name projection_input_823_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_823_reload \
    op interface \
    ports { projection_input_823_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5396 \
    name projection_input_855_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_855_reload \
    op interface \
    ports { projection_input_855_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5397 \
    name projection_input_887_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_887_reload \
    op interface \
    ports { projection_input_887_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5398 \
    name projection_input_696_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_696_reload \
    op interface \
    ports { projection_input_696_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5399 \
    name projection_input_728_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_728_reload \
    op interface \
    ports { projection_input_728_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5400 \
    name projection_input_760_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_760_reload \
    op interface \
    ports { projection_input_760_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5401 \
    name projection_input_792_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_792_reload \
    op interface \
    ports { projection_input_792_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5402 \
    name projection_input_824_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_824_reload \
    op interface \
    ports { projection_input_824_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5403 \
    name projection_input_856_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_856_reload \
    op interface \
    ports { projection_input_856_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5404 \
    name projection_input_888_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_888_reload \
    op interface \
    ports { projection_input_888_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5405 \
    name projection_input_697_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_697_reload \
    op interface \
    ports { projection_input_697_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5406 \
    name projection_input_729_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_729_reload \
    op interface \
    ports { projection_input_729_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5407 \
    name projection_input_761_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_761_reload \
    op interface \
    ports { projection_input_761_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5408 \
    name projection_input_793_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_793_reload \
    op interface \
    ports { projection_input_793_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5409 \
    name projection_input_825_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_825_reload \
    op interface \
    ports { projection_input_825_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5410 \
    name projection_input_857_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_857_reload \
    op interface \
    ports { projection_input_857_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5411 \
    name projection_input_889_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_889_reload \
    op interface \
    ports { projection_input_889_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5412 \
    name projection_input_698_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_698_reload \
    op interface \
    ports { projection_input_698_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5413 \
    name projection_input_730_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_730_reload \
    op interface \
    ports { projection_input_730_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5414 \
    name projection_input_762_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_762_reload \
    op interface \
    ports { projection_input_762_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5415 \
    name projection_input_794_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_794_reload \
    op interface \
    ports { projection_input_794_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5416 \
    name projection_input_826_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_826_reload \
    op interface \
    ports { projection_input_826_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5417 \
    name projection_input_858_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_858_reload \
    op interface \
    ports { projection_input_858_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5418 \
    name projection_input_890_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_890_reload \
    op interface \
    ports { projection_input_890_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5419 \
    name projection_input_699_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_699_reload \
    op interface \
    ports { projection_input_699_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5420 \
    name projection_input_731_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_731_reload \
    op interface \
    ports { projection_input_731_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5421 \
    name projection_input_763_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_763_reload \
    op interface \
    ports { projection_input_763_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5422 \
    name projection_input_795_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_795_reload \
    op interface \
    ports { projection_input_795_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5423 \
    name projection_input_827_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_827_reload \
    op interface \
    ports { projection_input_827_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5424 \
    name projection_input_859_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_859_reload \
    op interface \
    ports { projection_input_859_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5425 \
    name projection_input_891_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_891_reload \
    op interface \
    ports { projection_input_891_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5426 \
    name projection_input_700_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_700_reload \
    op interface \
    ports { projection_input_700_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5427 \
    name projection_input_732_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_732_reload \
    op interface \
    ports { projection_input_732_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5428 \
    name projection_input_764_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_764_reload \
    op interface \
    ports { projection_input_764_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5429 \
    name projection_input_796_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_796_reload \
    op interface \
    ports { projection_input_796_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5430 \
    name projection_input_828_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_828_reload \
    op interface \
    ports { projection_input_828_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5431 \
    name projection_input_860_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_860_reload \
    op interface \
    ports { projection_input_860_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5432 \
    name projection_input_892_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_892_reload \
    op interface \
    ports { projection_input_892_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5433 \
    name projection_input_701_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_701_reload \
    op interface \
    ports { projection_input_701_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5434 \
    name projection_input_733_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_733_reload \
    op interface \
    ports { projection_input_733_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5435 \
    name projection_input_765_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_765_reload \
    op interface \
    ports { projection_input_765_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5436 \
    name projection_input_797_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_797_reload \
    op interface \
    ports { projection_input_797_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5437 \
    name projection_input_829_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_829_reload \
    op interface \
    ports { projection_input_829_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5438 \
    name projection_input_861_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_861_reload \
    op interface \
    ports { projection_input_861_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5439 \
    name projection_input_893_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_893_reload \
    op interface \
    ports { projection_input_893_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5440 \
    name projection_input_702_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_702_reload \
    op interface \
    ports { projection_input_702_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5441 \
    name projection_input_734_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_734_reload \
    op interface \
    ports { projection_input_734_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5442 \
    name projection_input_766_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_766_reload \
    op interface \
    ports { projection_input_766_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5443 \
    name projection_input_798_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_798_reload \
    op interface \
    ports { projection_input_798_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5444 \
    name projection_input_830_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_830_reload \
    op interface \
    ports { projection_input_830_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5445 \
    name projection_input_862_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_862_reload \
    op interface \
    ports { projection_input_862_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5446 \
    name projection_input_894_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_894_reload \
    op interface \
    ports { projection_input_894_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5447 \
    name projection_input_703_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_703_reload \
    op interface \
    ports { projection_input_703_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5448 \
    name projection_input_735_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_735_reload \
    op interface \
    ports { projection_input_735_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5449 \
    name projection_input_767_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_767_reload \
    op interface \
    ports { projection_input_767_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5450 \
    name projection_input_799_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_799_reload \
    op interface \
    ports { projection_input_799_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5451 \
    name projection_input_831_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_831_reload \
    op interface \
    ports { projection_input_831_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5452 \
    name projection_input_863_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_863_reload \
    op interface \
    ports { projection_input_863_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5453 \
    name projection_input_895_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_895_reload \
    op interface \
    ports { projection_input_895_reload { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5454 \
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
    id 5455 \
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
    id 5456 \
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
    id 5457 \
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
    id 5458 \
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
    id 5459 \
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
    id 5460 \
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
    id 5461 \
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
    id 5462 \
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
    id 5463 \
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
    id 5464 \
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
    id 5465 \
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
    id 5466 \
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
    id 5467 \
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
    id 5468 \
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
    id 5469 \
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
    id 5470 \
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
    id 5471 \
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
    id 5472 \
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
    id 5473 \
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
    id 5474 \
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
    id 5475 \
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
    id 5476 \
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
    id 5477 \
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
    id 5478 \
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
    id 5479 \
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
    id 5480 \
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
    id 5481 \
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
    id 5482 \
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
    id 5483 \
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
    id 5484 \
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
    id 5485 \
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



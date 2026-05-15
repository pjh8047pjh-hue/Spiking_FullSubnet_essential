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
    id 626 \
    name hx_state_q610_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename hx_state_q610_0 \
    op interface \
    ports { hx_state_q610_0_address0 { O 10 vector } hx_state_q610_0_ce0 { O 1 bit } hx_state_q610_0_q0 { I 11 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hx_state_q610_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 628 \
    name hx_state_q610_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename hx_state_q610_1 \
    op interface \
    ports { hx_state_q610_1_address0 { O 10 vector } hx_state_q610_1_ce0 { O 1 bit } hx_state_q610_1_q0 { I 11 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'hx_state_q610_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 630 \
    name cx_state_q610_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename cx_state_q610_0 \
    op interface \
    ports { cx_state_q610_0_address0 { O 10 vector } cx_state_q610_0_ce0 { O 1 bit } cx_state_q610_0_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'cx_state_q610_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 632 \
    name cx_state_q610_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename cx_state_q610_1 \
    op interface \
    ports { cx_state_q610_1_address0 { O 10 vector } cx_state_q610_1_ce0 { O 1 bit } cx_state_q610_1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'cx_state_q610_1'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 177 \
    name prev_hx_q610_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_0 \
    op interface \
    ports { prev_hx_q610_0 { O 11 vector } prev_hx_q610_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 178 \
    name prev_hx_q610_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_1 \
    op interface \
    ports { prev_hx_q610_1 { O 11 vector } prev_hx_q610_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 179 \
    name prev_cx_q610_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_0 \
    op interface \
    ports { prev_cx_q610_0 { O 16 vector } prev_cx_q610_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 180 \
    name prev_cx_q610_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_1 \
    op interface \
    ports { prev_cx_q610_1 { O 16 vector } prev_cx_q610_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 181 \
    name prev_cx_q610_223 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_223 \
    op interface \
    ports { prev_cx_q610_223 { O 16 vector } prev_cx_q610_223_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 182 \
    name prev_cx_q610_222 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_222 \
    op interface \
    ports { prev_cx_q610_222 { O 16 vector } prev_cx_q610_222_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 183 \
    name prev_cx_q610_221 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_221 \
    op interface \
    ports { prev_cx_q610_221 { O 16 vector } prev_cx_q610_221_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 184 \
    name prev_cx_q610_220 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_220 \
    op interface \
    ports { prev_cx_q610_220 { O 16 vector } prev_cx_q610_220_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 185 \
    name prev_cx_q610_219 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_219 \
    op interface \
    ports { prev_cx_q610_219 { O 16 vector } prev_cx_q610_219_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 186 \
    name prev_cx_q610_218 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_218 \
    op interface \
    ports { prev_cx_q610_218 { O 16 vector } prev_cx_q610_218_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 187 \
    name prev_cx_q610_217 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_217 \
    op interface \
    ports { prev_cx_q610_217 { O 16 vector } prev_cx_q610_217_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 188 \
    name prev_cx_q610_216 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_216 \
    op interface \
    ports { prev_cx_q610_216 { O 16 vector } prev_cx_q610_216_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 189 \
    name prev_cx_q610_215 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_215 \
    op interface \
    ports { prev_cx_q610_215 { O 16 vector } prev_cx_q610_215_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 190 \
    name prev_cx_q610_214 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_214 \
    op interface \
    ports { prev_cx_q610_214 { O 16 vector } prev_cx_q610_214_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 191 \
    name prev_cx_q610_213 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_213 \
    op interface \
    ports { prev_cx_q610_213 { O 16 vector } prev_cx_q610_213_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 192 \
    name prev_cx_q610_212 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_212 \
    op interface \
    ports { prev_cx_q610_212 { O 16 vector } prev_cx_q610_212_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 193 \
    name prev_cx_q610_211 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_211 \
    op interface \
    ports { prev_cx_q610_211 { O 16 vector } prev_cx_q610_211_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 194 \
    name prev_cx_q610_210 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_210 \
    op interface \
    ports { prev_cx_q610_210 { O 16 vector } prev_cx_q610_210_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 195 \
    name prev_cx_q610_209 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_209 \
    op interface \
    ports { prev_cx_q610_209 { O 16 vector } prev_cx_q610_209_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 196 \
    name prev_cx_q610_208 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_208 \
    op interface \
    ports { prev_cx_q610_208 { O 16 vector } prev_cx_q610_208_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 197 \
    name prev_cx_q610_207 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_207 \
    op interface \
    ports { prev_cx_q610_207 { O 16 vector } prev_cx_q610_207_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 198 \
    name prev_cx_q610_206 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_206 \
    op interface \
    ports { prev_cx_q610_206 { O 16 vector } prev_cx_q610_206_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 199 \
    name prev_cx_q610_205 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_205 \
    op interface \
    ports { prev_cx_q610_205 { O 16 vector } prev_cx_q610_205_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 200 \
    name prev_cx_q610_204 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_204 \
    op interface \
    ports { prev_cx_q610_204 { O 16 vector } prev_cx_q610_204_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 201 \
    name prev_cx_q610_203 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_203 \
    op interface \
    ports { prev_cx_q610_203 { O 16 vector } prev_cx_q610_203_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 202 \
    name prev_cx_q610_202 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_202 \
    op interface \
    ports { prev_cx_q610_202 { O 16 vector } prev_cx_q610_202_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 203 \
    name prev_cx_q610_201 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_201 \
    op interface \
    ports { prev_cx_q610_201 { O 16 vector } prev_cx_q610_201_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 204 \
    name prev_cx_q610_200 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_200 \
    op interface \
    ports { prev_cx_q610_200 { O 16 vector } prev_cx_q610_200_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 205 \
    name prev_cx_q610_199 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_199 \
    op interface \
    ports { prev_cx_q610_199 { O 16 vector } prev_cx_q610_199_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 206 \
    name prev_cx_q610_198 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_198 \
    op interface \
    ports { prev_cx_q610_198 { O 16 vector } prev_cx_q610_198_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 207 \
    name prev_cx_q610_197 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_197 \
    op interface \
    ports { prev_cx_q610_197 { O 16 vector } prev_cx_q610_197_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 208 \
    name prev_cx_q610_196 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_196 \
    op interface \
    ports { prev_cx_q610_196 { O 16 vector } prev_cx_q610_196_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 209 \
    name prev_cx_q610_195 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_195 \
    op interface \
    ports { prev_cx_q610_195 { O 16 vector } prev_cx_q610_195_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 210 \
    name prev_cx_q610_194 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_194 \
    op interface \
    ports { prev_cx_q610_194 { O 16 vector } prev_cx_q610_194_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 211 \
    name prev_cx_q610_193 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_193 \
    op interface \
    ports { prev_cx_q610_193 { O 16 vector } prev_cx_q610_193_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 212 \
    name prev_cx_q610_192 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_192 \
    op interface \
    ports { prev_cx_q610_192 { O 16 vector } prev_cx_q610_192_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 213 \
    name prev_cx_q610_191 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_191 \
    op interface \
    ports { prev_cx_q610_191 { O 16 vector } prev_cx_q610_191_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 214 \
    name prev_cx_q610_190 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_190 \
    op interface \
    ports { prev_cx_q610_190 { O 16 vector } prev_cx_q610_190_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 215 \
    name prev_cx_q610_189 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_189 \
    op interface \
    ports { prev_cx_q610_189 { O 16 vector } prev_cx_q610_189_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 216 \
    name prev_cx_q610_188 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_188 \
    op interface \
    ports { prev_cx_q610_188 { O 16 vector } prev_cx_q610_188_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 217 \
    name prev_cx_q610_187 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_187 \
    op interface \
    ports { prev_cx_q610_187 { O 16 vector } prev_cx_q610_187_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 218 \
    name prev_cx_q610_186 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_186 \
    op interface \
    ports { prev_cx_q610_186 { O 16 vector } prev_cx_q610_186_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 219 \
    name prev_cx_q610_185 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_185 \
    op interface \
    ports { prev_cx_q610_185 { O 16 vector } prev_cx_q610_185_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 220 \
    name prev_cx_q610_184 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_184 \
    op interface \
    ports { prev_cx_q610_184 { O 16 vector } prev_cx_q610_184_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 221 \
    name prev_cx_q610_183 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_183 \
    op interface \
    ports { prev_cx_q610_183 { O 16 vector } prev_cx_q610_183_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 222 \
    name prev_cx_q610_182 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_182 \
    op interface \
    ports { prev_cx_q610_182 { O 16 vector } prev_cx_q610_182_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 223 \
    name prev_cx_q610_181 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_181 \
    op interface \
    ports { prev_cx_q610_181 { O 16 vector } prev_cx_q610_181_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 224 \
    name prev_cx_q610_180 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_180 \
    op interface \
    ports { prev_cx_q610_180 { O 16 vector } prev_cx_q610_180_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 225 \
    name prev_cx_q610_179 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_179 \
    op interface \
    ports { prev_cx_q610_179 { O 16 vector } prev_cx_q610_179_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 226 \
    name prev_cx_q610_178 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_178 \
    op interface \
    ports { prev_cx_q610_178 { O 16 vector } prev_cx_q610_178_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 227 \
    name prev_cx_q610_177 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_177 \
    op interface \
    ports { prev_cx_q610_177 { O 16 vector } prev_cx_q610_177_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 228 \
    name prev_cx_q610_176 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_176 \
    op interface \
    ports { prev_cx_q610_176 { O 16 vector } prev_cx_q610_176_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 229 \
    name prev_cx_q610_175 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_175 \
    op interface \
    ports { prev_cx_q610_175 { O 16 vector } prev_cx_q610_175_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 230 \
    name prev_cx_q610_174 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_174 \
    op interface \
    ports { prev_cx_q610_174 { O 16 vector } prev_cx_q610_174_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 231 \
    name prev_cx_q610_173 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_173 \
    op interface \
    ports { prev_cx_q610_173 { O 16 vector } prev_cx_q610_173_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 232 \
    name prev_cx_q610_172 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_172 \
    op interface \
    ports { prev_cx_q610_172 { O 16 vector } prev_cx_q610_172_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 233 \
    name prev_cx_q610_171 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_171 \
    op interface \
    ports { prev_cx_q610_171 { O 16 vector } prev_cx_q610_171_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 234 \
    name prev_cx_q610_170 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_170 \
    op interface \
    ports { prev_cx_q610_170 { O 16 vector } prev_cx_q610_170_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 235 \
    name prev_cx_q610_169 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_169 \
    op interface \
    ports { prev_cx_q610_169 { O 16 vector } prev_cx_q610_169_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 236 \
    name prev_cx_q610_168 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_168 \
    op interface \
    ports { prev_cx_q610_168 { O 16 vector } prev_cx_q610_168_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 237 \
    name prev_cx_q610_167 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_167 \
    op interface \
    ports { prev_cx_q610_167 { O 16 vector } prev_cx_q610_167_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 238 \
    name prev_cx_q610_166 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_166 \
    op interface \
    ports { prev_cx_q610_166 { O 16 vector } prev_cx_q610_166_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 239 \
    name prev_cx_q610_165 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_165 \
    op interface \
    ports { prev_cx_q610_165 { O 16 vector } prev_cx_q610_165_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 240 \
    name prev_cx_q610_164 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_164 \
    op interface \
    ports { prev_cx_q610_164 { O 16 vector } prev_cx_q610_164_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 241 \
    name prev_cx_q610_163 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_163 \
    op interface \
    ports { prev_cx_q610_163 { O 16 vector } prev_cx_q610_163_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 242 \
    name prev_cx_q610_162 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_162 \
    op interface \
    ports { prev_cx_q610_162 { O 16 vector } prev_cx_q610_162_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 243 \
    name prev_cx_q610_161 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_161 \
    op interface \
    ports { prev_cx_q610_161 { O 16 vector } prev_cx_q610_161_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 244 \
    name prev_cx_q610_160 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_160 \
    op interface \
    ports { prev_cx_q610_160 { O 16 vector } prev_cx_q610_160_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 245 \
    name prev_cx_q610_159 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_159 \
    op interface \
    ports { prev_cx_q610_159 { O 16 vector } prev_cx_q610_159_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 246 \
    name prev_cx_q610_158 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_158 \
    op interface \
    ports { prev_cx_q610_158 { O 16 vector } prev_cx_q610_158_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 247 \
    name prev_cx_q610_157 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_157 \
    op interface \
    ports { prev_cx_q610_157 { O 16 vector } prev_cx_q610_157_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 248 \
    name prev_cx_q610_156 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_156 \
    op interface \
    ports { prev_cx_q610_156 { O 16 vector } prev_cx_q610_156_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 249 \
    name prev_cx_q610_155 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_155 \
    op interface \
    ports { prev_cx_q610_155 { O 16 vector } prev_cx_q610_155_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 250 \
    name prev_cx_q610_154 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_154 \
    op interface \
    ports { prev_cx_q610_154 { O 16 vector } prev_cx_q610_154_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 251 \
    name prev_cx_q610_153 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_153 \
    op interface \
    ports { prev_cx_q610_153 { O 16 vector } prev_cx_q610_153_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 252 \
    name prev_cx_q610_152 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_152 \
    op interface \
    ports { prev_cx_q610_152 { O 16 vector } prev_cx_q610_152_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 253 \
    name prev_cx_q610_151 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_151 \
    op interface \
    ports { prev_cx_q610_151 { O 16 vector } prev_cx_q610_151_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 254 \
    name prev_cx_q610_150 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_150 \
    op interface \
    ports { prev_cx_q610_150 { O 16 vector } prev_cx_q610_150_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 255 \
    name prev_cx_q610_149 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_149 \
    op interface \
    ports { prev_cx_q610_149 { O 16 vector } prev_cx_q610_149_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 256 \
    name prev_cx_q610_148 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_148 \
    op interface \
    ports { prev_cx_q610_148 { O 16 vector } prev_cx_q610_148_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 257 \
    name prev_cx_q610_147 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_147 \
    op interface \
    ports { prev_cx_q610_147 { O 16 vector } prev_cx_q610_147_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 258 \
    name prev_cx_q610_146 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_146 \
    op interface \
    ports { prev_cx_q610_146 { O 16 vector } prev_cx_q610_146_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 259 \
    name prev_cx_q610_145 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_145 \
    op interface \
    ports { prev_cx_q610_145 { O 16 vector } prev_cx_q610_145_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 260 \
    name prev_cx_q610_144 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_144 \
    op interface \
    ports { prev_cx_q610_144 { O 16 vector } prev_cx_q610_144_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 261 \
    name prev_cx_q610_143 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_143 \
    op interface \
    ports { prev_cx_q610_143 { O 16 vector } prev_cx_q610_143_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 262 \
    name prev_cx_q610_142 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_142 \
    op interface \
    ports { prev_cx_q610_142 { O 16 vector } prev_cx_q610_142_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 263 \
    name prev_cx_q610_141 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_141 \
    op interface \
    ports { prev_cx_q610_141 { O 16 vector } prev_cx_q610_141_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 264 \
    name prev_cx_q610_140 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_140 \
    op interface \
    ports { prev_cx_q610_140 { O 16 vector } prev_cx_q610_140_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 265 \
    name prev_cx_q610_139 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_139 \
    op interface \
    ports { prev_cx_q610_139 { O 16 vector } prev_cx_q610_139_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 266 \
    name prev_cx_q610_138 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_138 \
    op interface \
    ports { prev_cx_q610_138 { O 16 vector } prev_cx_q610_138_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 267 \
    name prev_cx_q610_137 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_137 \
    op interface \
    ports { prev_cx_q610_137 { O 16 vector } prev_cx_q610_137_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 268 \
    name prev_cx_q610_136 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_136 \
    op interface \
    ports { prev_cx_q610_136 { O 16 vector } prev_cx_q610_136_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 269 \
    name prev_cx_q610_135 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_135 \
    op interface \
    ports { prev_cx_q610_135 { O 16 vector } prev_cx_q610_135_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 270 \
    name prev_cx_q610_134 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_134 \
    op interface \
    ports { prev_cx_q610_134 { O 16 vector } prev_cx_q610_134_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 271 \
    name prev_cx_q610_133 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_133 \
    op interface \
    ports { prev_cx_q610_133 { O 16 vector } prev_cx_q610_133_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 272 \
    name prev_cx_q610_132 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_132 \
    op interface \
    ports { prev_cx_q610_132 { O 16 vector } prev_cx_q610_132_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 273 \
    name prev_cx_q610_131 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_131 \
    op interface \
    ports { prev_cx_q610_131 { O 16 vector } prev_cx_q610_131_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 274 \
    name prev_cx_q610_130 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_130 \
    op interface \
    ports { prev_cx_q610_130 { O 16 vector } prev_cx_q610_130_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 275 \
    name prev_cx_q610_129 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_129 \
    op interface \
    ports { prev_cx_q610_129 { O 16 vector } prev_cx_q610_129_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 276 \
    name prev_cx_q610_128 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_128 \
    op interface \
    ports { prev_cx_q610_128 { O 16 vector } prev_cx_q610_128_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 277 \
    name prev_cx_q610_127 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_127 \
    op interface \
    ports { prev_cx_q610_127 { O 16 vector } prev_cx_q610_127_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 278 \
    name prev_cx_q610_126 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_126 \
    op interface \
    ports { prev_cx_q610_126 { O 16 vector } prev_cx_q610_126_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 279 \
    name prev_cx_q610_125 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_125 \
    op interface \
    ports { prev_cx_q610_125 { O 16 vector } prev_cx_q610_125_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 280 \
    name prev_cx_q610_124 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_124 \
    op interface \
    ports { prev_cx_q610_124 { O 16 vector } prev_cx_q610_124_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 281 \
    name prev_cx_q610_123 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_123 \
    op interface \
    ports { prev_cx_q610_123 { O 16 vector } prev_cx_q610_123_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 282 \
    name prev_cx_q610_122 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_122 \
    op interface \
    ports { prev_cx_q610_122 { O 16 vector } prev_cx_q610_122_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 283 \
    name prev_cx_q610_121 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_121 \
    op interface \
    ports { prev_cx_q610_121 { O 16 vector } prev_cx_q610_121_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 284 \
    name prev_cx_q610_120 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_120 \
    op interface \
    ports { prev_cx_q610_120 { O 16 vector } prev_cx_q610_120_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 285 \
    name prev_cx_q610_119 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_119 \
    op interface \
    ports { prev_cx_q610_119 { O 16 vector } prev_cx_q610_119_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 286 \
    name prev_cx_q610_118 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_118 \
    op interface \
    ports { prev_cx_q610_118 { O 16 vector } prev_cx_q610_118_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 287 \
    name prev_cx_q610_117 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_117 \
    op interface \
    ports { prev_cx_q610_117 { O 16 vector } prev_cx_q610_117_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 288 \
    name prev_cx_q610_116 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_116 \
    op interface \
    ports { prev_cx_q610_116 { O 16 vector } prev_cx_q610_116_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 289 \
    name prev_cx_q610_115 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_115 \
    op interface \
    ports { prev_cx_q610_115 { O 16 vector } prev_cx_q610_115_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 290 \
    name prev_cx_q610_114 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_114 \
    op interface \
    ports { prev_cx_q610_114 { O 16 vector } prev_cx_q610_114_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 291 \
    name prev_cx_q610_113 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_113 \
    op interface \
    ports { prev_cx_q610_113 { O 16 vector } prev_cx_q610_113_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 292 \
    name prev_cx_q610_112 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_112 \
    op interface \
    ports { prev_cx_q610_112 { O 16 vector } prev_cx_q610_112_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 293 \
    name prev_cx_q610_111 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_111 \
    op interface \
    ports { prev_cx_q610_111 { O 16 vector } prev_cx_q610_111_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 294 \
    name prev_cx_q610_110 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_110 \
    op interface \
    ports { prev_cx_q610_110 { O 16 vector } prev_cx_q610_110_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 295 \
    name prev_cx_q610_109 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_109 \
    op interface \
    ports { prev_cx_q610_109 { O 16 vector } prev_cx_q610_109_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 296 \
    name prev_cx_q610_108 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_108 \
    op interface \
    ports { prev_cx_q610_108 { O 16 vector } prev_cx_q610_108_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 297 \
    name prev_cx_q610_107 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_107 \
    op interface \
    ports { prev_cx_q610_107 { O 16 vector } prev_cx_q610_107_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 298 \
    name prev_cx_q610_106 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_106 \
    op interface \
    ports { prev_cx_q610_106 { O 16 vector } prev_cx_q610_106_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 299 \
    name prev_cx_q610_105 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_105 \
    op interface \
    ports { prev_cx_q610_105 { O 16 vector } prev_cx_q610_105_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 300 \
    name prev_cx_q610_104 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_104 \
    op interface \
    ports { prev_cx_q610_104 { O 16 vector } prev_cx_q610_104_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 301 \
    name prev_cx_q610_103 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_103 \
    op interface \
    ports { prev_cx_q610_103 { O 16 vector } prev_cx_q610_103_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 302 \
    name prev_cx_q610_102 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_102 \
    op interface \
    ports { prev_cx_q610_102 { O 16 vector } prev_cx_q610_102_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 303 \
    name prev_cx_q610_101 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_101 \
    op interface \
    ports { prev_cx_q610_101 { O 16 vector } prev_cx_q610_101_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 304 \
    name prev_cx_q610_100 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_100 \
    op interface \
    ports { prev_cx_q610_100 { O 16 vector } prev_cx_q610_100_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 305 \
    name prev_cx_q610_99 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_99 \
    op interface \
    ports { prev_cx_q610_99 { O 16 vector } prev_cx_q610_99_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 306 \
    name prev_cx_q610_98 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_98 \
    op interface \
    ports { prev_cx_q610_98 { O 16 vector } prev_cx_q610_98_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 307 \
    name prev_cx_q610_97 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_97 \
    op interface \
    ports { prev_cx_q610_97 { O 16 vector } prev_cx_q610_97_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 308 \
    name prev_cx_q610_96 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_96 \
    op interface \
    ports { prev_cx_q610_96 { O 16 vector } prev_cx_q610_96_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 309 \
    name prev_cx_q610_95 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_95 \
    op interface \
    ports { prev_cx_q610_95 { O 16 vector } prev_cx_q610_95_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 310 \
    name prev_cx_q610_94 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_94 \
    op interface \
    ports { prev_cx_q610_94 { O 16 vector } prev_cx_q610_94_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 311 \
    name prev_cx_q610_93 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_93 \
    op interface \
    ports { prev_cx_q610_93 { O 16 vector } prev_cx_q610_93_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 312 \
    name prev_cx_q610_92 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_92 \
    op interface \
    ports { prev_cx_q610_92 { O 16 vector } prev_cx_q610_92_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 313 \
    name prev_cx_q610_91 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_91 \
    op interface \
    ports { prev_cx_q610_91 { O 16 vector } prev_cx_q610_91_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 314 \
    name prev_cx_q610_90 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_90 \
    op interface \
    ports { prev_cx_q610_90 { O 16 vector } prev_cx_q610_90_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 315 \
    name prev_cx_q610_89 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_89 \
    op interface \
    ports { prev_cx_q610_89 { O 16 vector } prev_cx_q610_89_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 316 \
    name prev_cx_q610_88 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_88 \
    op interface \
    ports { prev_cx_q610_88 { O 16 vector } prev_cx_q610_88_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 317 \
    name prev_cx_q610_87 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_87 \
    op interface \
    ports { prev_cx_q610_87 { O 16 vector } prev_cx_q610_87_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 318 \
    name prev_cx_q610_86 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_86 \
    op interface \
    ports { prev_cx_q610_86 { O 16 vector } prev_cx_q610_86_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 319 \
    name prev_cx_q610_85 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_85 \
    op interface \
    ports { prev_cx_q610_85 { O 16 vector } prev_cx_q610_85_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 320 \
    name prev_cx_q610_84 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_84 \
    op interface \
    ports { prev_cx_q610_84 { O 16 vector } prev_cx_q610_84_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 321 \
    name prev_cx_q610_83 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_83 \
    op interface \
    ports { prev_cx_q610_83 { O 16 vector } prev_cx_q610_83_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 322 \
    name prev_cx_q610_82 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_82 \
    op interface \
    ports { prev_cx_q610_82 { O 16 vector } prev_cx_q610_82_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 323 \
    name prev_cx_q610_81 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_81 \
    op interface \
    ports { prev_cx_q610_81 { O 16 vector } prev_cx_q610_81_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 324 \
    name prev_cx_q610_80 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_80 \
    op interface \
    ports { prev_cx_q610_80 { O 16 vector } prev_cx_q610_80_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 325 \
    name prev_cx_q610_79 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_79 \
    op interface \
    ports { prev_cx_q610_79 { O 16 vector } prev_cx_q610_79_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 326 \
    name prev_cx_q610_78 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_78 \
    op interface \
    ports { prev_cx_q610_78 { O 16 vector } prev_cx_q610_78_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 327 \
    name prev_cx_q610_77 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_77 \
    op interface \
    ports { prev_cx_q610_77 { O 16 vector } prev_cx_q610_77_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 328 \
    name prev_cx_q610_76 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_76 \
    op interface \
    ports { prev_cx_q610_76 { O 16 vector } prev_cx_q610_76_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 329 \
    name prev_cx_q610_75 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_75 \
    op interface \
    ports { prev_cx_q610_75 { O 16 vector } prev_cx_q610_75_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 330 \
    name prev_cx_q610_74 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_74 \
    op interface \
    ports { prev_cx_q610_74 { O 16 vector } prev_cx_q610_74_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 331 \
    name prev_cx_q610_73 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_73 \
    op interface \
    ports { prev_cx_q610_73 { O 16 vector } prev_cx_q610_73_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 332 \
    name prev_cx_q610_72 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_72 \
    op interface \
    ports { prev_cx_q610_72 { O 16 vector } prev_cx_q610_72_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 333 \
    name prev_cx_q610_71 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_71 \
    op interface \
    ports { prev_cx_q610_71 { O 16 vector } prev_cx_q610_71_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 334 \
    name prev_cx_q610_70 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_70 \
    op interface \
    ports { prev_cx_q610_70 { O 16 vector } prev_cx_q610_70_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 335 \
    name prev_cx_q610_69 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_69 \
    op interface \
    ports { prev_cx_q610_69 { O 16 vector } prev_cx_q610_69_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 336 \
    name prev_cx_q610_68 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_68 \
    op interface \
    ports { prev_cx_q610_68 { O 16 vector } prev_cx_q610_68_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 337 \
    name prev_cx_q610_67 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_67 \
    op interface \
    ports { prev_cx_q610_67 { O 16 vector } prev_cx_q610_67_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 338 \
    name prev_cx_q610_66 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_66 \
    op interface \
    ports { prev_cx_q610_66 { O 16 vector } prev_cx_q610_66_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 339 \
    name prev_cx_q610_65 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_65 \
    op interface \
    ports { prev_cx_q610_65 { O 16 vector } prev_cx_q610_65_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 340 \
    name prev_cx_q610_64 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_64 \
    op interface \
    ports { prev_cx_q610_64 { O 16 vector } prev_cx_q610_64_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 341 \
    name prev_cx_q610_63 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_63 \
    op interface \
    ports { prev_cx_q610_63 { O 16 vector } prev_cx_q610_63_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 342 \
    name prev_cx_q610_62 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_62 \
    op interface \
    ports { prev_cx_q610_62 { O 16 vector } prev_cx_q610_62_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 343 \
    name prev_cx_q610_61 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_61 \
    op interface \
    ports { prev_cx_q610_61 { O 16 vector } prev_cx_q610_61_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 344 \
    name prev_cx_q610_60 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_60 \
    op interface \
    ports { prev_cx_q610_60 { O 16 vector } prev_cx_q610_60_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 345 \
    name prev_cx_q610_59 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_59 \
    op interface \
    ports { prev_cx_q610_59 { O 16 vector } prev_cx_q610_59_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 346 \
    name prev_cx_q610_58 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_58 \
    op interface \
    ports { prev_cx_q610_58 { O 16 vector } prev_cx_q610_58_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 347 \
    name prev_cx_q610_57 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_57 \
    op interface \
    ports { prev_cx_q610_57 { O 16 vector } prev_cx_q610_57_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 348 \
    name prev_cx_q610_56 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_56 \
    op interface \
    ports { prev_cx_q610_56 { O 16 vector } prev_cx_q610_56_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 349 \
    name prev_cx_q610_55 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_55 \
    op interface \
    ports { prev_cx_q610_55 { O 16 vector } prev_cx_q610_55_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 350 \
    name prev_cx_q610_54 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_54 \
    op interface \
    ports { prev_cx_q610_54 { O 16 vector } prev_cx_q610_54_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 351 \
    name prev_cx_q610_53 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_53 \
    op interface \
    ports { prev_cx_q610_53 { O 16 vector } prev_cx_q610_53_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 352 \
    name prev_cx_q610_52 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_52 \
    op interface \
    ports { prev_cx_q610_52 { O 16 vector } prev_cx_q610_52_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 353 \
    name prev_cx_q610_51 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_51 \
    op interface \
    ports { prev_cx_q610_51 { O 16 vector } prev_cx_q610_51_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 354 \
    name prev_cx_q610_50 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_50 \
    op interface \
    ports { prev_cx_q610_50 { O 16 vector } prev_cx_q610_50_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 355 \
    name prev_cx_q610_49 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_49 \
    op interface \
    ports { prev_cx_q610_49 { O 16 vector } prev_cx_q610_49_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 356 \
    name prev_cx_q610_48 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_48 \
    op interface \
    ports { prev_cx_q610_48 { O 16 vector } prev_cx_q610_48_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 357 \
    name prev_cx_q610_47 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_47 \
    op interface \
    ports { prev_cx_q610_47 { O 16 vector } prev_cx_q610_47_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 358 \
    name prev_cx_q610_46 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_46 \
    op interface \
    ports { prev_cx_q610_46 { O 16 vector } prev_cx_q610_46_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 359 \
    name prev_cx_q610_45 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_45 \
    op interface \
    ports { prev_cx_q610_45 { O 16 vector } prev_cx_q610_45_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 360 \
    name prev_cx_q610_44 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_44 \
    op interface \
    ports { prev_cx_q610_44 { O 16 vector } prev_cx_q610_44_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 361 \
    name prev_cx_q610_43 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_43 \
    op interface \
    ports { prev_cx_q610_43 { O 16 vector } prev_cx_q610_43_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 362 \
    name prev_cx_q610_42 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_42 \
    op interface \
    ports { prev_cx_q610_42 { O 16 vector } prev_cx_q610_42_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 363 \
    name prev_cx_q610_41 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_41 \
    op interface \
    ports { prev_cx_q610_41 { O 16 vector } prev_cx_q610_41_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 364 \
    name prev_cx_q610_40 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_40 \
    op interface \
    ports { prev_cx_q610_40 { O 16 vector } prev_cx_q610_40_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 365 \
    name prev_cx_q610_39 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_39 \
    op interface \
    ports { prev_cx_q610_39 { O 16 vector } prev_cx_q610_39_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 366 \
    name prev_cx_q610_38 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_38 \
    op interface \
    ports { prev_cx_q610_38 { O 16 vector } prev_cx_q610_38_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 367 \
    name prev_cx_q610_37 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_37 \
    op interface \
    ports { prev_cx_q610_37 { O 16 vector } prev_cx_q610_37_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 368 \
    name prev_cx_q610_36 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_36 \
    op interface \
    ports { prev_cx_q610_36 { O 16 vector } prev_cx_q610_36_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 369 \
    name prev_cx_q610_35 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_35 \
    op interface \
    ports { prev_cx_q610_35 { O 16 vector } prev_cx_q610_35_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 370 \
    name prev_cx_q610_34 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_34 \
    op interface \
    ports { prev_cx_q610_34 { O 16 vector } prev_cx_q610_34_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 371 \
    name prev_cx_q610_33 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_33 \
    op interface \
    ports { prev_cx_q610_33 { O 16 vector } prev_cx_q610_33_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 372 \
    name prev_cx_q610_32 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_32 \
    op interface \
    ports { prev_cx_q610_32 { O 16 vector } prev_cx_q610_32_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 373 \
    name prev_cx_q610_31 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_31 \
    op interface \
    ports { prev_cx_q610_31 { O 16 vector } prev_cx_q610_31_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 374 \
    name prev_cx_q610_30 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_30 \
    op interface \
    ports { prev_cx_q610_30 { O 16 vector } prev_cx_q610_30_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 375 \
    name prev_cx_q610_29 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_29 \
    op interface \
    ports { prev_cx_q610_29 { O 16 vector } prev_cx_q610_29_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 376 \
    name prev_cx_q610_28 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_28 \
    op interface \
    ports { prev_cx_q610_28 { O 16 vector } prev_cx_q610_28_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 377 \
    name prev_cx_q610_27 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_27 \
    op interface \
    ports { prev_cx_q610_27 { O 16 vector } prev_cx_q610_27_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 378 \
    name prev_cx_q610_26 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_26 \
    op interface \
    ports { prev_cx_q610_26 { O 16 vector } prev_cx_q610_26_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 379 \
    name prev_cx_q610_25 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_25 \
    op interface \
    ports { prev_cx_q610_25 { O 16 vector } prev_cx_q610_25_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 380 \
    name prev_cx_q610_24 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_24 \
    op interface \
    ports { prev_cx_q610_24 { O 16 vector } prev_cx_q610_24_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 381 \
    name prev_cx_q610_23 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_23 \
    op interface \
    ports { prev_cx_q610_23 { O 16 vector } prev_cx_q610_23_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 382 \
    name prev_cx_q610_22 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_22 \
    op interface \
    ports { prev_cx_q610_22 { O 16 vector } prev_cx_q610_22_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 383 \
    name prev_cx_q610_21 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_21 \
    op interface \
    ports { prev_cx_q610_21 { O 16 vector } prev_cx_q610_21_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 384 \
    name prev_cx_q610_20 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_20 \
    op interface \
    ports { prev_cx_q610_20 { O 16 vector } prev_cx_q610_20_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 385 \
    name prev_cx_q610_19 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_19 \
    op interface \
    ports { prev_cx_q610_19 { O 16 vector } prev_cx_q610_19_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 386 \
    name prev_cx_q610_18 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_18 \
    op interface \
    ports { prev_cx_q610_18 { O 16 vector } prev_cx_q610_18_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 387 \
    name prev_cx_q610_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_17 \
    op interface \
    ports { prev_cx_q610_17 { O 16 vector } prev_cx_q610_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 388 \
    name prev_cx_q610_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_16 \
    op interface \
    ports { prev_cx_q610_16 { O 16 vector } prev_cx_q610_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 389 \
    name prev_cx_q610_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_15 \
    op interface \
    ports { prev_cx_q610_15 { O 16 vector } prev_cx_q610_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 390 \
    name prev_cx_q610_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_14 \
    op interface \
    ports { prev_cx_q610_14 { O 16 vector } prev_cx_q610_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 391 \
    name prev_cx_q610_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_13 \
    op interface \
    ports { prev_cx_q610_13 { O 16 vector } prev_cx_q610_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 392 \
    name prev_cx_q610_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_12 \
    op interface \
    ports { prev_cx_q610_12 { O 16 vector } prev_cx_q610_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 393 \
    name prev_cx_q610_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_11 \
    op interface \
    ports { prev_cx_q610_11 { O 16 vector } prev_cx_q610_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 394 \
    name prev_cx_q610_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_10 \
    op interface \
    ports { prev_cx_q610_10 { O 16 vector } prev_cx_q610_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 395 \
    name prev_cx_q610_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_9 \
    op interface \
    ports { prev_cx_q610_9 { O 16 vector } prev_cx_q610_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 396 \
    name prev_cx_q610_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_8 \
    op interface \
    ports { prev_cx_q610_8 { O 16 vector } prev_cx_q610_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 397 \
    name prev_cx_q610_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_7 \
    op interface \
    ports { prev_cx_q610_7 { O 16 vector } prev_cx_q610_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 398 \
    name prev_cx_q610_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_6 \
    op interface \
    ports { prev_cx_q610_6 { O 16 vector } prev_cx_q610_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 399 \
    name prev_cx_q610_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_5 \
    op interface \
    ports { prev_cx_q610_5 { O 16 vector } prev_cx_q610_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 400 \
    name prev_cx_q610_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_4 \
    op interface \
    ports { prev_cx_q610_4 { O 16 vector } prev_cx_q610_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 401 \
    name prev_cx_q610_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_3 \
    op interface \
    ports { prev_cx_q610_3 { O 16 vector } prev_cx_q610_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 402 \
    name prev_cx_q610_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_cx_q610_2 \
    op interface \
    ports { prev_cx_q610_2 { O 16 vector } prev_cx_q610_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 403 \
    name prev_hx_q610_223 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_223 \
    op interface \
    ports { prev_hx_q610_223 { O 11 vector } prev_hx_q610_223_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 404 \
    name prev_hx_q610_222 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_222 \
    op interface \
    ports { prev_hx_q610_222 { O 11 vector } prev_hx_q610_222_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 405 \
    name prev_hx_q610_221 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_221 \
    op interface \
    ports { prev_hx_q610_221 { O 11 vector } prev_hx_q610_221_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 406 \
    name prev_hx_q610_220 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_220 \
    op interface \
    ports { prev_hx_q610_220 { O 11 vector } prev_hx_q610_220_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 407 \
    name prev_hx_q610_219 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_219 \
    op interface \
    ports { prev_hx_q610_219 { O 11 vector } prev_hx_q610_219_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 408 \
    name prev_hx_q610_218 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_218 \
    op interface \
    ports { prev_hx_q610_218 { O 11 vector } prev_hx_q610_218_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 409 \
    name prev_hx_q610_217 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_217 \
    op interface \
    ports { prev_hx_q610_217 { O 11 vector } prev_hx_q610_217_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 410 \
    name prev_hx_q610_216 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_216 \
    op interface \
    ports { prev_hx_q610_216 { O 11 vector } prev_hx_q610_216_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 411 \
    name prev_hx_q610_215 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_215 \
    op interface \
    ports { prev_hx_q610_215 { O 11 vector } prev_hx_q610_215_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 412 \
    name prev_hx_q610_214 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_214 \
    op interface \
    ports { prev_hx_q610_214 { O 11 vector } prev_hx_q610_214_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 413 \
    name prev_hx_q610_213 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_213 \
    op interface \
    ports { prev_hx_q610_213 { O 11 vector } prev_hx_q610_213_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 414 \
    name prev_hx_q610_212 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_212 \
    op interface \
    ports { prev_hx_q610_212 { O 11 vector } prev_hx_q610_212_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 415 \
    name prev_hx_q610_211 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_211 \
    op interface \
    ports { prev_hx_q610_211 { O 11 vector } prev_hx_q610_211_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 416 \
    name prev_hx_q610_210 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_210 \
    op interface \
    ports { prev_hx_q610_210 { O 11 vector } prev_hx_q610_210_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 417 \
    name prev_hx_q610_209 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_209 \
    op interface \
    ports { prev_hx_q610_209 { O 11 vector } prev_hx_q610_209_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 418 \
    name prev_hx_q610_208 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_208 \
    op interface \
    ports { prev_hx_q610_208 { O 11 vector } prev_hx_q610_208_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 419 \
    name prev_hx_q610_207 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_207 \
    op interface \
    ports { prev_hx_q610_207 { O 11 vector } prev_hx_q610_207_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 420 \
    name prev_hx_q610_206 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_206 \
    op interface \
    ports { prev_hx_q610_206 { O 11 vector } prev_hx_q610_206_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 421 \
    name prev_hx_q610_205 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_205 \
    op interface \
    ports { prev_hx_q610_205 { O 11 vector } prev_hx_q610_205_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 422 \
    name prev_hx_q610_204 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_204 \
    op interface \
    ports { prev_hx_q610_204 { O 11 vector } prev_hx_q610_204_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 423 \
    name prev_hx_q610_203 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_203 \
    op interface \
    ports { prev_hx_q610_203 { O 11 vector } prev_hx_q610_203_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 424 \
    name prev_hx_q610_202 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_202 \
    op interface \
    ports { prev_hx_q610_202 { O 11 vector } prev_hx_q610_202_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 425 \
    name prev_hx_q610_201 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_201 \
    op interface \
    ports { prev_hx_q610_201 { O 11 vector } prev_hx_q610_201_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 426 \
    name prev_hx_q610_200 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_200 \
    op interface \
    ports { prev_hx_q610_200 { O 11 vector } prev_hx_q610_200_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 427 \
    name prev_hx_q610_199 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_199 \
    op interface \
    ports { prev_hx_q610_199 { O 11 vector } prev_hx_q610_199_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 428 \
    name prev_hx_q610_198 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_198 \
    op interface \
    ports { prev_hx_q610_198 { O 11 vector } prev_hx_q610_198_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 429 \
    name prev_hx_q610_197 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_197 \
    op interface \
    ports { prev_hx_q610_197 { O 11 vector } prev_hx_q610_197_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 430 \
    name prev_hx_q610_196 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_196 \
    op interface \
    ports { prev_hx_q610_196 { O 11 vector } prev_hx_q610_196_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 431 \
    name prev_hx_q610_195 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_195 \
    op interface \
    ports { prev_hx_q610_195 { O 11 vector } prev_hx_q610_195_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 432 \
    name prev_hx_q610_194 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_194 \
    op interface \
    ports { prev_hx_q610_194 { O 11 vector } prev_hx_q610_194_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 433 \
    name prev_hx_q610_193 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_193 \
    op interface \
    ports { prev_hx_q610_193 { O 11 vector } prev_hx_q610_193_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 434 \
    name prev_hx_q610_192 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_192 \
    op interface \
    ports { prev_hx_q610_192 { O 11 vector } prev_hx_q610_192_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 435 \
    name prev_hx_q610_191 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_191 \
    op interface \
    ports { prev_hx_q610_191 { O 11 vector } prev_hx_q610_191_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 436 \
    name prev_hx_q610_190 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_190 \
    op interface \
    ports { prev_hx_q610_190 { O 11 vector } prev_hx_q610_190_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 437 \
    name prev_hx_q610_189 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_189 \
    op interface \
    ports { prev_hx_q610_189 { O 11 vector } prev_hx_q610_189_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 438 \
    name prev_hx_q610_188 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_188 \
    op interface \
    ports { prev_hx_q610_188 { O 11 vector } prev_hx_q610_188_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 439 \
    name prev_hx_q610_187 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_187 \
    op interface \
    ports { prev_hx_q610_187 { O 11 vector } prev_hx_q610_187_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 440 \
    name prev_hx_q610_186 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_186 \
    op interface \
    ports { prev_hx_q610_186 { O 11 vector } prev_hx_q610_186_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 441 \
    name prev_hx_q610_185 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_185 \
    op interface \
    ports { prev_hx_q610_185 { O 11 vector } prev_hx_q610_185_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 442 \
    name prev_hx_q610_184 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_184 \
    op interface \
    ports { prev_hx_q610_184 { O 11 vector } prev_hx_q610_184_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 443 \
    name prev_hx_q610_183 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_183 \
    op interface \
    ports { prev_hx_q610_183 { O 11 vector } prev_hx_q610_183_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 444 \
    name prev_hx_q610_182 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_182 \
    op interface \
    ports { prev_hx_q610_182 { O 11 vector } prev_hx_q610_182_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 445 \
    name prev_hx_q610_181 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_181 \
    op interface \
    ports { prev_hx_q610_181 { O 11 vector } prev_hx_q610_181_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 446 \
    name prev_hx_q610_180 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_180 \
    op interface \
    ports { prev_hx_q610_180 { O 11 vector } prev_hx_q610_180_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 447 \
    name prev_hx_q610_179 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_179 \
    op interface \
    ports { prev_hx_q610_179 { O 11 vector } prev_hx_q610_179_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 448 \
    name prev_hx_q610_178 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_178 \
    op interface \
    ports { prev_hx_q610_178 { O 11 vector } prev_hx_q610_178_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 449 \
    name prev_hx_q610_177 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_177 \
    op interface \
    ports { prev_hx_q610_177 { O 11 vector } prev_hx_q610_177_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 450 \
    name prev_hx_q610_176 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_176 \
    op interface \
    ports { prev_hx_q610_176 { O 11 vector } prev_hx_q610_176_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 451 \
    name prev_hx_q610_175 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_175 \
    op interface \
    ports { prev_hx_q610_175 { O 11 vector } prev_hx_q610_175_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 452 \
    name prev_hx_q610_174 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_174 \
    op interface \
    ports { prev_hx_q610_174 { O 11 vector } prev_hx_q610_174_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 453 \
    name prev_hx_q610_173 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_173 \
    op interface \
    ports { prev_hx_q610_173 { O 11 vector } prev_hx_q610_173_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 454 \
    name prev_hx_q610_172 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_172 \
    op interface \
    ports { prev_hx_q610_172 { O 11 vector } prev_hx_q610_172_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 455 \
    name prev_hx_q610_171 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_171 \
    op interface \
    ports { prev_hx_q610_171 { O 11 vector } prev_hx_q610_171_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 456 \
    name prev_hx_q610_170 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_170 \
    op interface \
    ports { prev_hx_q610_170 { O 11 vector } prev_hx_q610_170_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 457 \
    name prev_hx_q610_169 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_169 \
    op interface \
    ports { prev_hx_q610_169 { O 11 vector } prev_hx_q610_169_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 458 \
    name prev_hx_q610_168 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_168 \
    op interface \
    ports { prev_hx_q610_168 { O 11 vector } prev_hx_q610_168_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 459 \
    name prev_hx_q610_167 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_167 \
    op interface \
    ports { prev_hx_q610_167 { O 11 vector } prev_hx_q610_167_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 460 \
    name prev_hx_q610_166 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_166 \
    op interface \
    ports { prev_hx_q610_166 { O 11 vector } prev_hx_q610_166_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 461 \
    name prev_hx_q610_165 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_165 \
    op interface \
    ports { prev_hx_q610_165 { O 11 vector } prev_hx_q610_165_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 462 \
    name prev_hx_q610_164 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_164 \
    op interface \
    ports { prev_hx_q610_164 { O 11 vector } prev_hx_q610_164_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 463 \
    name prev_hx_q610_163 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_163 \
    op interface \
    ports { prev_hx_q610_163 { O 11 vector } prev_hx_q610_163_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 464 \
    name prev_hx_q610_162 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_162 \
    op interface \
    ports { prev_hx_q610_162 { O 11 vector } prev_hx_q610_162_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 465 \
    name prev_hx_q610_161 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_161 \
    op interface \
    ports { prev_hx_q610_161 { O 11 vector } prev_hx_q610_161_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 466 \
    name prev_hx_q610_160 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_160 \
    op interface \
    ports { prev_hx_q610_160 { O 11 vector } prev_hx_q610_160_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 467 \
    name prev_hx_q610_159 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_159 \
    op interface \
    ports { prev_hx_q610_159 { O 11 vector } prev_hx_q610_159_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 468 \
    name prev_hx_q610_158 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_158 \
    op interface \
    ports { prev_hx_q610_158 { O 11 vector } prev_hx_q610_158_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 469 \
    name prev_hx_q610_157 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_157 \
    op interface \
    ports { prev_hx_q610_157 { O 11 vector } prev_hx_q610_157_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 470 \
    name prev_hx_q610_156 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_156 \
    op interface \
    ports { prev_hx_q610_156 { O 11 vector } prev_hx_q610_156_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 471 \
    name prev_hx_q610_155 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_155 \
    op interface \
    ports { prev_hx_q610_155 { O 11 vector } prev_hx_q610_155_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 472 \
    name prev_hx_q610_154 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_154 \
    op interface \
    ports { prev_hx_q610_154 { O 11 vector } prev_hx_q610_154_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 473 \
    name prev_hx_q610_153 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_153 \
    op interface \
    ports { prev_hx_q610_153 { O 11 vector } prev_hx_q610_153_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 474 \
    name prev_hx_q610_152 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_152 \
    op interface \
    ports { prev_hx_q610_152 { O 11 vector } prev_hx_q610_152_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 475 \
    name prev_hx_q610_151 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_151 \
    op interface \
    ports { prev_hx_q610_151 { O 11 vector } prev_hx_q610_151_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 476 \
    name prev_hx_q610_150 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_150 \
    op interface \
    ports { prev_hx_q610_150 { O 11 vector } prev_hx_q610_150_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 477 \
    name prev_hx_q610_149 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_149 \
    op interface \
    ports { prev_hx_q610_149 { O 11 vector } prev_hx_q610_149_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 478 \
    name prev_hx_q610_148 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_148 \
    op interface \
    ports { prev_hx_q610_148 { O 11 vector } prev_hx_q610_148_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 479 \
    name prev_hx_q610_147 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_147 \
    op interface \
    ports { prev_hx_q610_147 { O 11 vector } prev_hx_q610_147_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 480 \
    name prev_hx_q610_146 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_146 \
    op interface \
    ports { prev_hx_q610_146 { O 11 vector } prev_hx_q610_146_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 481 \
    name prev_hx_q610_145 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_145 \
    op interface \
    ports { prev_hx_q610_145 { O 11 vector } prev_hx_q610_145_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 482 \
    name prev_hx_q610_144 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_144 \
    op interface \
    ports { prev_hx_q610_144 { O 11 vector } prev_hx_q610_144_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 483 \
    name prev_hx_q610_143 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_143 \
    op interface \
    ports { prev_hx_q610_143 { O 11 vector } prev_hx_q610_143_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 484 \
    name prev_hx_q610_142 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_142 \
    op interface \
    ports { prev_hx_q610_142 { O 11 vector } prev_hx_q610_142_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 485 \
    name prev_hx_q610_141 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_141 \
    op interface \
    ports { prev_hx_q610_141 { O 11 vector } prev_hx_q610_141_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 486 \
    name prev_hx_q610_140 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_140 \
    op interface \
    ports { prev_hx_q610_140 { O 11 vector } prev_hx_q610_140_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 487 \
    name prev_hx_q610_139 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_139 \
    op interface \
    ports { prev_hx_q610_139 { O 11 vector } prev_hx_q610_139_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 488 \
    name prev_hx_q610_138 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_138 \
    op interface \
    ports { prev_hx_q610_138 { O 11 vector } prev_hx_q610_138_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 489 \
    name prev_hx_q610_137 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_137 \
    op interface \
    ports { prev_hx_q610_137 { O 11 vector } prev_hx_q610_137_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 490 \
    name prev_hx_q610_136 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_136 \
    op interface \
    ports { prev_hx_q610_136 { O 11 vector } prev_hx_q610_136_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 491 \
    name prev_hx_q610_135 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_135 \
    op interface \
    ports { prev_hx_q610_135 { O 11 vector } prev_hx_q610_135_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 492 \
    name prev_hx_q610_134 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_134 \
    op interface \
    ports { prev_hx_q610_134 { O 11 vector } prev_hx_q610_134_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 493 \
    name prev_hx_q610_133 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_133 \
    op interface \
    ports { prev_hx_q610_133 { O 11 vector } prev_hx_q610_133_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 494 \
    name prev_hx_q610_132 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_132 \
    op interface \
    ports { prev_hx_q610_132 { O 11 vector } prev_hx_q610_132_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 495 \
    name prev_hx_q610_131 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_131 \
    op interface \
    ports { prev_hx_q610_131 { O 11 vector } prev_hx_q610_131_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 496 \
    name prev_hx_q610_130 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_130 \
    op interface \
    ports { prev_hx_q610_130 { O 11 vector } prev_hx_q610_130_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 497 \
    name prev_hx_q610_129 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_129 \
    op interface \
    ports { prev_hx_q610_129 { O 11 vector } prev_hx_q610_129_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 498 \
    name prev_hx_q610_128 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_128 \
    op interface \
    ports { prev_hx_q610_128 { O 11 vector } prev_hx_q610_128_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 499 \
    name prev_hx_q610_127 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_127 \
    op interface \
    ports { prev_hx_q610_127 { O 11 vector } prev_hx_q610_127_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 500 \
    name prev_hx_q610_126 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_126 \
    op interface \
    ports { prev_hx_q610_126 { O 11 vector } prev_hx_q610_126_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 501 \
    name prev_hx_q610_125 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_125 \
    op interface \
    ports { prev_hx_q610_125 { O 11 vector } prev_hx_q610_125_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 502 \
    name prev_hx_q610_124 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_124 \
    op interface \
    ports { prev_hx_q610_124 { O 11 vector } prev_hx_q610_124_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 503 \
    name prev_hx_q610_123 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_123 \
    op interface \
    ports { prev_hx_q610_123 { O 11 vector } prev_hx_q610_123_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 504 \
    name prev_hx_q610_122 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_122 \
    op interface \
    ports { prev_hx_q610_122 { O 11 vector } prev_hx_q610_122_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 505 \
    name prev_hx_q610_121 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_121 \
    op interface \
    ports { prev_hx_q610_121 { O 11 vector } prev_hx_q610_121_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 506 \
    name prev_hx_q610_120 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_120 \
    op interface \
    ports { prev_hx_q610_120 { O 11 vector } prev_hx_q610_120_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 507 \
    name prev_hx_q610_119 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_119 \
    op interface \
    ports { prev_hx_q610_119 { O 11 vector } prev_hx_q610_119_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 508 \
    name prev_hx_q610_118 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_118 \
    op interface \
    ports { prev_hx_q610_118 { O 11 vector } prev_hx_q610_118_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 509 \
    name prev_hx_q610_117 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_117 \
    op interface \
    ports { prev_hx_q610_117 { O 11 vector } prev_hx_q610_117_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 510 \
    name prev_hx_q610_116 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_116 \
    op interface \
    ports { prev_hx_q610_116 { O 11 vector } prev_hx_q610_116_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 511 \
    name prev_hx_q610_115 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_115 \
    op interface \
    ports { prev_hx_q610_115 { O 11 vector } prev_hx_q610_115_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 512 \
    name prev_hx_q610_114 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_114 \
    op interface \
    ports { prev_hx_q610_114 { O 11 vector } prev_hx_q610_114_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 513 \
    name prev_hx_q610_113 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_113 \
    op interface \
    ports { prev_hx_q610_113 { O 11 vector } prev_hx_q610_113_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 514 \
    name prev_hx_q610_112 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_112 \
    op interface \
    ports { prev_hx_q610_112 { O 11 vector } prev_hx_q610_112_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 515 \
    name prev_hx_q610_111 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_111 \
    op interface \
    ports { prev_hx_q610_111 { O 11 vector } prev_hx_q610_111_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 516 \
    name prev_hx_q610_110 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_110 \
    op interface \
    ports { prev_hx_q610_110 { O 11 vector } prev_hx_q610_110_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 517 \
    name prev_hx_q610_109 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_109 \
    op interface \
    ports { prev_hx_q610_109 { O 11 vector } prev_hx_q610_109_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 518 \
    name prev_hx_q610_108 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_108 \
    op interface \
    ports { prev_hx_q610_108 { O 11 vector } prev_hx_q610_108_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 519 \
    name prev_hx_q610_107 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_107 \
    op interface \
    ports { prev_hx_q610_107 { O 11 vector } prev_hx_q610_107_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 520 \
    name prev_hx_q610_106 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_106 \
    op interface \
    ports { prev_hx_q610_106 { O 11 vector } prev_hx_q610_106_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 521 \
    name prev_hx_q610_105 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_105 \
    op interface \
    ports { prev_hx_q610_105 { O 11 vector } prev_hx_q610_105_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 522 \
    name prev_hx_q610_104 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_104 \
    op interface \
    ports { prev_hx_q610_104 { O 11 vector } prev_hx_q610_104_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 523 \
    name prev_hx_q610_103 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_103 \
    op interface \
    ports { prev_hx_q610_103 { O 11 vector } prev_hx_q610_103_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 524 \
    name prev_hx_q610_102 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_102 \
    op interface \
    ports { prev_hx_q610_102 { O 11 vector } prev_hx_q610_102_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 525 \
    name prev_hx_q610_101 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_101 \
    op interface \
    ports { prev_hx_q610_101 { O 11 vector } prev_hx_q610_101_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 526 \
    name prev_hx_q610_100 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_100 \
    op interface \
    ports { prev_hx_q610_100 { O 11 vector } prev_hx_q610_100_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 527 \
    name prev_hx_q610_99 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_99 \
    op interface \
    ports { prev_hx_q610_99 { O 11 vector } prev_hx_q610_99_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 528 \
    name prev_hx_q610_98 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_98 \
    op interface \
    ports { prev_hx_q610_98 { O 11 vector } prev_hx_q610_98_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 529 \
    name prev_hx_q610_97 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_97 \
    op interface \
    ports { prev_hx_q610_97 { O 11 vector } prev_hx_q610_97_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 530 \
    name prev_hx_q610_96 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_96 \
    op interface \
    ports { prev_hx_q610_96 { O 11 vector } prev_hx_q610_96_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 531 \
    name prev_hx_q610_95 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_95 \
    op interface \
    ports { prev_hx_q610_95 { O 11 vector } prev_hx_q610_95_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 532 \
    name prev_hx_q610_94 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_94 \
    op interface \
    ports { prev_hx_q610_94 { O 11 vector } prev_hx_q610_94_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 533 \
    name prev_hx_q610_93 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_93 \
    op interface \
    ports { prev_hx_q610_93 { O 11 vector } prev_hx_q610_93_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 534 \
    name prev_hx_q610_92 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_92 \
    op interface \
    ports { prev_hx_q610_92 { O 11 vector } prev_hx_q610_92_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 535 \
    name prev_hx_q610_91 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_91 \
    op interface \
    ports { prev_hx_q610_91 { O 11 vector } prev_hx_q610_91_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 536 \
    name prev_hx_q610_90 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_90 \
    op interface \
    ports { prev_hx_q610_90 { O 11 vector } prev_hx_q610_90_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 537 \
    name prev_hx_q610_89 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_89 \
    op interface \
    ports { prev_hx_q610_89 { O 11 vector } prev_hx_q610_89_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 538 \
    name prev_hx_q610_88 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_88 \
    op interface \
    ports { prev_hx_q610_88 { O 11 vector } prev_hx_q610_88_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 539 \
    name prev_hx_q610_87 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_87 \
    op interface \
    ports { prev_hx_q610_87 { O 11 vector } prev_hx_q610_87_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 540 \
    name prev_hx_q610_86 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_86 \
    op interface \
    ports { prev_hx_q610_86 { O 11 vector } prev_hx_q610_86_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 541 \
    name prev_hx_q610_85 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_85 \
    op interface \
    ports { prev_hx_q610_85 { O 11 vector } prev_hx_q610_85_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 542 \
    name prev_hx_q610_84 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_84 \
    op interface \
    ports { prev_hx_q610_84 { O 11 vector } prev_hx_q610_84_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 543 \
    name prev_hx_q610_83 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_83 \
    op interface \
    ports { prev_hx_q610_83 { O 11 vector } prev_hx_q610_83_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 544 \
    name prev_hx_q610_82 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_82 \
    op interface \
    ports { prev_hx_q610_82 { O 11 vector } prev_hx_q610_82_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 545 \
    name prev_hx_q610_81 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_81 \
    op interface \
    ports { prev_hx_q610_81 { O 11 vector } prev_hx_q610_81_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 546 \
    name prev_hx_q610_80 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_80 \
    op interface \
    ports { prev_hx_q610_80 { O 11 vector } prev_hx_q610_80_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 547 \
    name prev_hx_q610_79 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_79 \
    op interface \
    ports { prev_hx_q610_79 { O 11 vector } prev_hx_q610_79_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 548 \
    name prev_hx_q610_78 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_78 \
    op interface \
    ports { prev_hx_q610_78 { O 11 vector } prev_hx_q610_78_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 549 \
    name prev_hx_q610_77 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_77 \
    op interface \
    ports { prev_hx_q610_77 { O 11 vector } prev_hx_q610_77_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 550 \
    name prev_hx_q610_76 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_76 \
    op interface \
    ports { prev_hx_q610_76 { O 11 vector } prev_hx_q610_76_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 551 \
    name prev_hx_q610_75 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_75 \
    op interface \
    ports { prev_hx_q610_75 { O 11 vector } prev_hx_q610_75_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 552 \
    name prev_hx_q610_74 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_74 \
    op interface \
    ports { prev_hx_q610_74 { O 11 vector } prev_hx_q610_74_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 553 \
    name prev_hx_q610_73 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_73 \
    op interface \
    ports { prev_hx_q610_73 { O 11 vector } prev_hx_q610_73_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 554 \
    name prev_hx_q610_72 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_72 \
    op interface \
    ports { prev_hx_q610_72 { O 11 vector } prev_hx_q610_72_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 555 \
    name prev_hx_q610_71 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_71 \
    op interface \
    ports { prev_hx_q610_71 { O 11 vector } prev_hx_q610_71_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 556 \
    name prev_hx_q610_70 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_70 \
    op interface \
    ports { prev_hx_q610_70 { O 11 vector } prev_hx_q610_70_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 557 \
    name prev_hx_q610_69 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_69 \
    op interface \
    ports { prev_hx_q610_69 { O 11 vector } prev_hx_q610_69_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 558 \
    name prev_hx_q610_68 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_68 \
    op interface \
    ports { prev_hx_q610_68 { O 11 vector } prev_hx_q610_68_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 559 \
    name prev_hx_q610_67 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_67 \
    op interface \
    ports { prev_hx_q610_67 { O 11 vector } prev_hx_q610_67_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 560 \
    name prev_hx_q610_66 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_66 \
    op interface \
    ports { prev_hx_q610_66 { O 11 vector } prev_hx_q610_66_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 561 \
    name prev_hx_q610_65 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_65 \
    op interface \
    ports { prev_hx_q610_65 { O 11 vector } prev_hx_q610_65_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 562 \
    name prev_hx_q610_64 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_64 \
    op interface \
    ports { prev_hx_q610_64 { O 11 vector } prev_hx_q610_64_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 563 \
    name prev_hx_q610_63 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_63 \
    op interface \
    ports { prev_hx_q610_63 { O 11 vector } prev_hx_q610_63_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 564 \
    name prev_hx_q610_62 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_62 \
    op interface \
    ports { prev_hx_q610_62 { O 11 vector } prev_hx_q610_62_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 565 \
    name prev_hx_q610_61 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_61 \
    op interface \
    ports { prev_hx_q610_61 { O 11 vector } prev_hx_q610_61_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 566 \
    name prev_hx_q610_60 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_60 \
    op interface \
    ports { prev_hx_q610_60 { O 11 vector } prev_hx_q610_60_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 567 \
    name prev_hx_q610_59 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_59 \
    op interface \
    ports { prev_hx_q610_59 { O 11 vector } prev_hx_q610_59_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 568 \
    name prev_hx_q610_58 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_58 \
    op interface \
    ports { prev_hx_q610_58 { O 11 vector } prev_hx_q610_58_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 569 \
    name prev_hx_q610_57 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_57 \
    op interface \
    ports { prev_hx_q610_57 { O 11 vector } prev_hx_q610_57_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 570 \
    name prev_hx_q610_56 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_56 \
    op interface \
    ports { prev_hx_q610_56 { O 11 vector } prev_hx_q610_56_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 571 \
    name prev_hx_q610_55 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_55 \
    op interface \
    ports { prev_hx_q610_55 { O 11 vector } prev_hx_q610_55_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 572 \
    name prev_hx_q610_54 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_54 \
    op interface \
    ports { prev_hx_q610_54 { O 11 vector } prev_hx_q610_54_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 573 \
    name prev_hx_q610_53 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_53 \
    op interface \
    ports { prev_hx_q610_53 { O 11 vector } prev_hx_q610_53_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 574 \
    name prev_hx_q610_52 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_52 \
    op interface \
    ports { prev_hx_q610_52 { O 11 vector } prev_hx_q610_52_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 575 \
    name prev_hx_q610_51 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_51 \
    op interface \
    ports { prev_hx_q610_51 { O 11 vector } prev_hx_q610_51_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 576 \
    name prev_hx_q610_50 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_50 \
    op interface \
    ports { prev_hx_q610_50 { O 11 vector } prev_hx_q610_50_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 577 \
    name prev_hx_q610_49 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_49 \
    op interface \
    ports { prev_hx_q610_49 { O 11 vector } prev_hx_q610_49_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 578 \
    name prev_hx_q610_48 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_48 \
    op interface \
    ports { prev_hx_q610_48 { O 11 vector } prev_hx_q610_48_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 579 \
    name prev_hx_q610_47 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_47 \
    op interface \
    ports { prev_hx_q610_47 { O 11 vector } prev_hx_q610_47_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 580 \
    name prev_hx_q610_46 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_46 \
    op interface \
    ports { prev_hx_q610_46 { O 11 vector } prev_hx_q610_46_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 581 \
    name prev_hx_q610_45 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_45 \
    op interface \
    ports { prev_hx_q610_45 { O 11 vector } prev_hx_q610_45_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 582 \
    name prev_hx_q610_44 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_44 \
    op interface \
    ports { prev_hx_q610_44 { O 11 vector } prev_hx_q610_44_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 583 \
    name prev_hx_q610_43 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_43 \
    op interface \
    ports { prev_hx_q610_43 { O 11 vector } prev_hx_q610_43_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 584 \
    name prev_hx_q610_42 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_42 \
    op interface \
    ports { prev_hx_q610_42 { O 11 vector } prev_hx_q610_42_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 585 \
    name prev_hx_q610_41 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_41 \
    op interface \
    ports { prev_hx_q610_41 { O 11 vector } prev_hx_q610_41_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 586 \
    name prev_hx_q610_40 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_40 \
    op interface \
    ports { prev_hx_q610_40 { O 11 vector } prev_hx_q610_40_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 587 \
    name prev_hx_q610_39 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_39 \
    op interface \
    ports { prev_hx_q610_39 { O 11 vector } prev_hx_q610_39_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 588 \
    name prev_hx_q610_38 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_38 \
    op interface \
    ports { prev_hx_q610_38 { O 11 vector } prev_hx_q610_38_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 589 \
    name prev_hx_q610_37 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_37 \
    op interface \
    ports { prev_hx_q610_37 { O 11 vector } prev_hx_q610_37_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 590 \
    name prev_hx_q610_36 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_36 \
    op interface \
    ports { prev_hx_q610_36 { O 11 vector } prev_hx_q610_36_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 591 \
    name prev_hx_q610_35 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_35 \
    op interface \
    ports { prev_hx_q610_35 { O 11 vector } prev_hx_q610_35_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 592 \
    name prev_hx_q610_34 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_34 \
    op interface \
    ports { prev_hx_q610_34 { O 11 vector } prev_hx_q610_34_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 593 \
    name prev_hx_q610_33 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_33 \
    op interface \
    ports { prev_hx_q610_33 { O 11 vector } prev_hx_q610_33_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 594 \
    name prev_hx_q610_32 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_32 \
    op interface \
    ports { prev_hx_q610_32 { O 11 vector } prev_hx_q610_32_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 595 \
    name prev_hx_q610_31 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_31 \
    op interface \
    ports { prev_hx_q610_31 { O 11 vector } prev_hx_q610_31_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 596 \
    name prev_hx_q610_30 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_30 \
    op interface \
    ports { prev_hx_q610_30 { O 11 vector } prev_hx_q610_30_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 597 \
    name prev_hx_q610_29 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_29 \
    op interface \
    ports { prev_hx_q610_29 { O 11 vector } prev_hx_q610_29_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 598 \
    name prev_hx_q610_28 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_28 \
    op interface \
    ports { prev_hx_q610_28 { O 11 vector } prev_hx_q610_28_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 599 \
    name prev_hx_q610_27 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_27 \
    op interface \
    ports { prev_hx_q610_27 { O 11 vector } prev_hx_q610_27_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 600 \
    name prev_hx_q610_26 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_26 \
    op interface \
    ports { prev_hx_q610_26 { O 11 vector } prev_hx_q610_26_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 601 \
    name prev_hx_q610_25 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_25 \
    op interface \
    ports { prev_hx_q610_25 { O 11 vector } prev_hx_q610_25_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 602 \
    name prev_hx_q610_24 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_24 \
    op interface \
    ports { prev_hx_q610_24 { O 11 vector } prev_hx_q610_24_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 603 \
    name prev_hx_q610_23 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_23 \
    op interface \
    ports { prev_hx_q610_23 { O 11 vector } prev_hx_q610_23_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 604 \
    name prev_hx_q610_22 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_22 \
    op interface \
    ports { prev_hx_q610_22 { O 11 vector } prev_hx_q610_22_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 605 \
    name prev_hx_q610_21 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_21 \
    op interface \
    ports { prev_hx_q610_21 { O 11 vector } prev_hx_q610_21_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 606 \
    name prev_hx_q610_20 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_20 \
    op interface \
    ports { prev_hx_q610_20 { O 11 vector } prev_hx_q610_20_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 607 \
    name prev_hx_q610_19 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_19 \
    op interface \
    ports { prev_hx_q610_19 { O 11 vector } prev_hx_q610_19_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 608 \
    name prev_hx_q610_18 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_18 \
    op interface \
    ports { prev_hx_q610_18 { O 11 vector } prev_hx_q610_18_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 609 \
    name prev_hx_q610_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_17 \
    op interface \
    ports { prev_hx_q610_17 { O 11 vector } prev_hx_q610_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 610 \
    name prev_hx_q610_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_16 \
    op interface \
    ports { prev_hx_q610_16 { O 11 vector } prev_hx_q610_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 611 \
    name prev_hx_q610_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_15 \
    op interface \
    ports { prev_hx_q610_15 { O 11 vector } prev_hx_q610_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 612 \
    name prev_hx_q610_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_14 \
    op interface \
    ports { prev_hx_q610_14 { O 11 vector } prev_hx_q610_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 613 \
    name prev_hx_q610_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_13 \
    op interface \
    ports { prev_hx_q610_13 { O 11 vector } prev_hx_q610_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 614 \
    name prev_hx_q610_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_12 \
    op interface \
    ports { prev_hx_q610_12 { O 11 vector } prev_hx_q610_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 615 \
    name prev_hx_q610_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_11 \
    op interface \
    ports { prev_hx_q610_11 { O 11 vector } prev_hx_q610_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 616 \
    name prev_hx_q610_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_10 \
    op interface \
    ports { prev_hx_q610_10 { O 11 vector } prev_hx_q610_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 617 \
    name prev_hx_q610_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_9 \
    op interface \
    ports { prev_hx_q610_9 { O 11 vector } prev_hx_q610_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 618 \
    name prev_hx_q610_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_8 \
    op interface \
    ports { prev_hx_q610_8 { O 11 vector } prev_hx_q610_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 619 \
    name prev_hx_q610_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_7 \
    op interface \
    ports { prev_hx_q610_7 { O 11 vector } prev_hx_q610_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 620 \
    name prev_hx_q610_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_6 \
    op interface \
    ports { prev_hx_q610_6 { O 11 vector } prev_hx_q610_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 621 \
    name prev_hx_q610_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_5 \
    op interface \
    ports { prev_hx_q610_5 { O 11 vector } prev_hx_q610_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 622 \
    name prev_hx_q610_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_4 \
    op interface \
    ports { prev_hx_q610_4 { O 11 vector } prev_hx_q610_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 623 \
    name prev_hx_q610_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_3 \
    op interface \
    ports { prev_hx_q610_3 { O 11 vector } prev_hx_q610_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 624 \
    name prev_hx_q610_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_prev_hx_q610_2 \
    op interface \
    ports { prev_hx_q610_2 { O 11 vector } prev_hx_q610_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 625 \
    name sub_ln1932_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_ln1932_1 \
    op interface \
    ports { sub_ln1932_1 { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 627 \
    name sub_ln1932 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_ln1932 \
    op interface \
    ports { sub_ln1932 { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 629 \
    name sub_ln1933_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_ln1933_1 \
    op interface \
    ports { sub_ln1933_1 { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 631 \
    name sub_ln1933 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_ln1933 \
    op interface \
    ports { sub_ln1933 { I 10 vector } } \
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



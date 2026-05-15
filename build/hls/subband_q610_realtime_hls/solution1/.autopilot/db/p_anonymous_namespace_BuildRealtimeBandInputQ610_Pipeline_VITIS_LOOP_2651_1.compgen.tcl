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
    id 4421 \
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
    id 4422 \
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
    id 4192 \
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
    id 4193 \
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
    id 4194 \
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
    id 4195 \
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
    id 4196 \
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
    id 4197 \
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
    id 4198 \
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
    id 4199 \
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
    id 4200 \
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
    id 4201 \
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
    id 4202 \
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
    id 4203 \
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
    id 4204 \
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
    id 4205 \
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
    id 4206 \
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
    id 4207 \
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
    id 4208 \
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
    id 4209 \
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
    id 4210 \
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
    id 4211 \
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
    id 4212 \
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
    id 4213 \
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
    id 4214 \
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
    id 4215 \
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
    id 4216 \
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
    id 4217 \
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
    id 4218 \
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
    id 4219 \
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
    id 4220 \
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
    id 4221 \
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
    id 4222 \
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
    id 4223 \
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
    id 4224 \
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
    id 4225 \
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
    id 4226 \
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
    id 4227 \
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
    id 4228 \
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
    id 4229 \
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
    id 4230 \
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
    id 4231 \
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
    id 4232 \
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
    id 4233 \
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
    id 4234 \
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
    id 4235 \
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
    id 4236 \
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
    id 4237 \
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
    id 4238 \
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
    id 4239 \
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
    id 4240 \
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
    id 4241 \
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
    id 4242 \
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
    id 4243 \
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
    id 4244 \
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
    id 4245 \
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
    id 4246 \
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
    id 4247 \
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
    id 4248 \
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
    id 4249 \
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
    id 4250 \
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
    id 4251 \
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
    id 4252 \
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
    id 4253 \
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
    id 4254 \
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
    id 4255 \
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
    id 4256 \
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
    id 4257 \
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
    id 4258 \
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
    id 4259 \
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
    id 4260 \
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
    id 4261 \
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
    id 4262 \
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
    id 4263 \
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
    id 4264 \
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
    id 4265 \
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
    id 4266 \
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
    id 4267 \
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
    id 4268 \
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
    id 4269 \
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
    id 4270 \
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
    id 4271 \
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
    id 4272 \
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
    id 4273 \
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
    id 4274 \
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
    id 4275 \
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
    id 4276 \
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
    id 4277 \
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
    id 4278 \
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
    id 4279 \
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
    id 4280 \
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
    id 4281 \
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
    id 4282 \
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
    id 4283 \
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
    id 4284 \
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
    id 4285 \
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
    id 4286 \
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
    id 4287 \
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
    id 4288 \
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
    id 4289 \
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
    id 4290 \
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
    id 4291 \
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
    id 4292 \
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
    id 4293 \
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
    id 4294 \
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
    id 4295 \
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
    id 4296 \
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
    id 4297 \
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
    id 4298 \
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
    id 4299 \
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
    id 4300 \
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
    id 4301 \
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
    id 4302 \
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
    id 4303 \
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
    id 4304 \
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
    id 4305 \
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
    id 4306 \
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
    id 4307 \
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
    id 4308 \
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
    id 4309 \
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
    id 4310 \
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
    id 4311 \
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
    id 4312 \
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
    id 4313 \
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
    id 4314 \
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
    id 4315 \
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
    id 4316 \
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
    id 4317 \
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
    id 4318 \
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
    id 4319 \
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
    id 4320 \
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
    id 4321 \
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
    id 4322 \
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
    id 4323 \
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
    id 4324 \
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
    id 4325 \
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
    id 4326 \
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
    id 4327 \
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
    id 4328 \
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
    id 4329 \
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
    id 4330 \
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
    id 4331 \
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
    id 4332 \
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
    id 4333 \
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
    id 4334 \
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
    id 4335 \
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
    id 4336 \
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
    id 4337 \
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
    id 4338 \
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
    id 4339 \
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
    id 4340 \
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
    id 4341 \
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
    id 4342 \
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
    id 4343 \
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
    id 4344 \
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
    id 4345 \
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
    id 4346 \
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
    id 4347 \
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
    id 4348 \
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
    id 4349 \
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
    id 4350 \
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
    id 4351 \
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
    id 4352 \
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
    id 4353 \
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
    id 4354 \
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
    id 4355 \
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
    id 4356 \
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
    id 4357 \
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
    id 4358 \
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
    id 4359 \
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
    id 4360 \
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
    id 4361 \
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
    id 4362 \
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
    id 4363 \
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
    id 4364 \
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
    id 4365 \
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
    id 4366 \
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
    id 4367 \
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
    id 4368 \
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
    id 4369 \
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
    id 4370 \
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
    id 4371 \
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
    id 4372 \
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
    id 4373 \
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
    id 4374 \
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
    id 4375 \
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
    id 4376 \
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
    id 4377 \
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
    id 4378 \
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
    id 4379 \
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
    id 4380 \
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
    id 4381 \
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
    id 4382 \
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
    id 4383 \
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
    id 4384 \
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
    id 4385 \
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
    id 4386 \
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
    id 4387 \
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
    id 4388 \
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
    id 4389 \
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
    id 4390 \
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
    id 4391 \
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
    id 4392 \
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
    id 4393 \
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
    id 4394 \
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
    id 4395 \
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
    id 4396 \
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
    id 4397 \
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
    id 4398 \
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
    id 4399 \
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
    id 4400 \
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
    id 4401 \
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
    id 4402 \
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
    id 4403 \
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
    id 4404 \
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
    id 4405 \
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
    id 4406 \
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
    id 4407 \
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
    id 4408 \
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
    id 4409 \
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
    id 4410 \
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
    id 4411 \
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
    id 4412 \
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
    id 4413 \
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
    id 4414 \
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
    id 4415 \
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
    id 4416 \
    name p_read3_cast2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read3_cast2 \
    op interface \
    ports { p_read3_cast2 { I 7 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4417 \
    name zext_ln2651 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln2651 \
    op interface \
    ports { zext_ln2651 { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4418 \
    name center_start \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_center_start \
    op interface \
    ports { center_start { I 10 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4419 \
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
    id 4420 \
    name zext_ln2656 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln2656 \
    op interface \
    ports { zext_ln2656 { I 10 vector } } \
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



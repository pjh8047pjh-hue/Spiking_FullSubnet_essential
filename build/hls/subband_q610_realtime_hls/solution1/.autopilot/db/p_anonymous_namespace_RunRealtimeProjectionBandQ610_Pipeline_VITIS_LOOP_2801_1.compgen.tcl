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
    id 5163 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1 \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_address0 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 5164 \
    name RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la \
    op interface \
    ports { RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_address0 { O 12 vector } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_ce0 { O 1 bit } RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la_q0 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'RunSubbandRealtimeTopCoreQ610_stream_stream_ap_uint_const_int_bool_stream_la'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4714 \
    name projection_input_447 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_447 \
    op interface \
    ports { projection_input_447 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4715 \
    name projection_input_446 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_446 \
    op interface \
    ports { projection_input_446 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4716 \
    name projection_input_445 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_445 \
    op interface \
    ports { projection_input_445 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4717 \
    name projection_input_444 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_444 \
    op interface \
    ports { projection_input_444 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4718 \
    name projection_input_443 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_443 \
    op interface \
    ports { projection_input_443 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4719 \
    name projection_input_442 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_442 \
    op interface \
    ports { projection_input_442 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4720 \
    name projection_input_441 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_441 \
    op interface \
    ports { projection_input_441 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4721 \
    name projection_input_440 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_440 \
    op interface \
    ports { projection_input_440 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4722 \
    name projection_input_439 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_439 \
    op interface \
    ports { projection_input_439 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4723 \
    name projection_input_438 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_438 \
    op interface \
    ports { projection_input_438 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4724 \
    name projection_input_437 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_437 \
    op interface \
    ports { projection_input_437 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4725 \
    name projection_input_436 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_436 \
    op interface \
    ports { projection_input_436 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4726 \
    name projection_input_435 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_435 \
    op interface \
    ports { projection_input_435 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4727 \
    name projection_input_434 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_434 \
    op interface \
    ports { projection_input_434 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4728 \
    name projection_input_433 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_433 \
    op interface \
    ports { projection_input_433 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4729 \
    name projection_input_432 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_432 \
    op interface \
    ports { projection_input_432 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4730 \
    name projection_input_431 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_431 \
    op interface \
    ports { projection_input_431 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4731 \
    name projection_input_430 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_430 \
    op interface \
    ports { projection_input_430 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4732 \
    name projection_input_429 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_429 \
    op interface \
    ports { projection_input_429 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4733 \
    name projection_input_428 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_428 \
    op interface \
    ports { projection_input_428 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4734 \
    name projection_input_427 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_427 \
    op interface \
    ports { projection_input_427 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4735 \
    name projection_input_426 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_426 \
    op interface \
    ports { projection_input_426 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4736 \
    name projection_input_425 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_425 \
    op interface \
    ports { projection_input_425 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4737 \
    name projection_input_424 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_424 \
    op interface \
    ports { projection_input_424 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4738 \
    name projection_input_423 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_423 \
    op interface \
    ports { projection_input_423 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4739 \
    name projection_input_422 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_422 \
    op interface \
    ports { projection_input_422 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4740 \
    name projection_input_421 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_421 \
    op interface \
    ports { projection_input_421 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4741 \
    name projection_input_420 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_420 \
    op interface \
    ports { projection_input_420 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4742 \
    name projection_input_419 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_419 \
    op interface \
    ports { projection_input_419 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4743 \
    name projection_input_418 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_418 \
    op interface \
    ports { projection_input_418 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4744 \
    name projection_input_417 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_417 \
    op interface \
    ports { projection_input_417 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4745 \
    name projection_input_416 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_416 \
    op interface \
    ports { projection_input_416 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4746 \
    name projection_input_415 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_415 \
    op interface \
    ports { projection_input_415 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4747 \
    name projection_input_414 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_414 \
    op interface \
    ports { projection_input_414 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4748 \
    name projection_input_413 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_413 \
    op interface \
    ports { projection_input_413 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4749 \
    name projection_input_412 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_412 \
    op interface \
    ports { projection_input_412 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4750 \
    name projection_input_411 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_411 \
    op interface \
    ports { projection_input_411 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4751 \
    name projection_input_410 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_410 \
    op interface \
    ports { projection_input_410 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4752 \
    name projection_input_409 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_409 \
    op interface \
    ports { projection_input_409 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4753 \
    name projection_input_408 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_408 \
    op interface \
    ports { projection_input_408 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4754 \
    name projection_input_407 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_407 \
    op interface \
    ports { projection_input_407 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4755 \
    name projection_input_406 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_406 \
    op interface \
    ports { projection_input_406 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4756 \
    name projection_input_405 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_405 \
    op interface \
    ports { projection_input_405 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4757 \
    name projection_input_404 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_404 \
    op interface \
    ports { projection_input_404 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4758 \
    name projection_input_403 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_403 \
    op interface \
    ports { projection_input_403 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4759 \
    name projection_input_402 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_402 \
    op interface \
    ports { projection_input_402 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4760 \
    name projection_input_401 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_401 \
    op interface \
    ports { projection_input_401 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4761 \
    name projection_input_400 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_400 \
    op interface \
    ports { projection_input_400 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4762 \
    name projection_input_399 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_399 \
    op interface \
    ports { projection_input_399 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4763 \
    name projection_input_398 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_398 \
    op interface \
    ports { projection_input_398 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4764 \
    name projection_input_397 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_397 \
    op interface \
    ports { projection_input_397 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4765 \
    name projection_input_396 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_396 \
    op interface \
    ports { projection_input_396 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4766 \
    name projection_input_395 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_395 \
    op interface \
    ports { projection_input_395 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4767 \
    name projection_input_394 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_394 \
    op interface \
    ports { projection_input_394 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4768 \
    name projection_input_393 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_393 \
    op interface \
    ports { projection_input_393 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4769 \
    name projection_input_392 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_392 \
    op interface \
    ports { projection_input_392 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4770 \
    name projection_input_391 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_391 \
    op interface \
    ports { projection_input_391 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4771 \
    name projection_input_390 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_390 \
    op interface \
    ports { projection_input_390 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4772 \
    name projection_input_389 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_389 \
    op interface \
    ports { projection_input_389 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4773 \
    name projection_input_388 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_388 \
    op interface \
    ports { projection_input_388 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4774 \
    name projection_input_387 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_387 \
    op interface \
    ports { projection_input_387 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4775 \
    name projection_input_386 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_386 \
    op interface \
    ports { projection_input_386 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4776 \
    name projection_input_385 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_385 \
    op interface \
    ports { projection_input_385 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4777 \
    name projection_input_384 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_384 \
    op interface \
    ports { projection_input_384 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4778 \
    name projection_input_383 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_383 \
    op interface \
    ports { projection_input_383 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4779 \
    name projection_input_382 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_382 \
    op interface \
    ports { projection_input_382 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4780 \
    name projection_input_381 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_381 \
    op interface \
    ports { projection_input_381 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4781 \
    name projection_input_380 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_380 \
    op interface \
    ports { projection_input_380 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4782 \
    name projection_input_379 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_379 \
    op interface \
    ports { projection_input_379 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4783 \
    name projection_input_378 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_378 \
    op interface \
    ports { projection_input_378 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4784 \
    name projection_input_377 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_377 \
    op interface \
    ports { projection_input_377 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4785 \
    name projection_input_376 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_376 \
    op interface \
    ports { projection_input_376 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4786 \
    name projection_input_375 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_375 \
    op interface \
    ports { projection_input_375 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4787 \
    name projection_input_374 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_374 \
    op interface \
    ports { projection_input_374 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4788 \
    name projection_input_373 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_373 \
    op interface \
    ports { projection_input_373 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4789 \
    name projection_input_372 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_372 \
    op interface \
    ports { projection_input_372 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4790 \
    name projection_input_371 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_371 \
    op interface \
    ports { projection_input_371 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4791 \
    name projection_input_370 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_370 \
    op interface \
    ports { projection_input_370 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4792 \
    name projection_input_369 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_369 \
    op interface \
    ports { projection_input_369 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4793 \
    name projection_input_368 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_368 \
    op interface \
    ports { projection_input_368 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4794 \
    name projection_input_367 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_367 \
    op interface \
    ports { projection_input_367 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4795 \
    name projection_input_366 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_366 \
    op interface \
    ports { projection_input_366 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4796 \
    name projection_input_365 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_365 \
    op interface \
    ports { projection_input_365 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4797 \
    name projection_input_364 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_364 \
    op interface \
    ports { projection_input_364 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4798 \
    name projection_input_363 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_363 \
    op interface \
    ports { projection_input_363 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4799 \
    name projection_input_362 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_362 \
    op interface \
    ports { projection_input_362 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4800 \
    name projection_input_361 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_361 \
    op interface \
    ports { projection_input_361 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4801 \
    name projection_input_360 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_360 \
    op interface \
    ports { projection_input_360 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4802 \
    name projection_input_359 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_359 \
    op interface \
    ports { projection_input_359 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4803 \
    name projection_input_358 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_358 \
    op interface \
    ports { projection_input_358 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4804 \
    name projection_input_357 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_357 \
    op interface \
    ports { projection_input_357 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4805 \
    name projection_input_356 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_356 \
    op interface \
    ports { projection_input_356 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4806 \
    name projection_input_355 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_355 \
    op interface \
    ports { projection_input_355 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4807 \
    name projection_input_354 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_354 \
    op interface \
    ports { projection_input_354 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4808 \
    name projection_input_353 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_353 \
    op interface \
    ports { projection_input_353 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4809 \
    name projection_input_352 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_352 \
    op interface \
    ports { projection_input_352 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4810 \
    name projection_input_351 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_351 \
    op interface \
    ports { projection_input_351 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4811 \
    name projection_input_350 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_350 \
    op interface \
    ports { projection_input_350 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4812 \
    name projection_input_349 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_349 \
    op interface \
    ports { projection_input_349 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4813 \
    name projection_input_348 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_348 \
    op interface \
    ports { projection_input_348 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4814 \
    name projection_input_347 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_347 \
    op interface \
    ports { projection_input_347 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4815 \
    name projection_input_346 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_346 \
    op interface \
    ports { projection_input_346 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4816 \
    name projection_input_345 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_345 \
    op interface \
    ports { projection_input_345 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4817 \
    name projection_input_344 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_344 \
    op interface \
    ports { projection_input_344 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4818 \
    name projection_input_343 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_343 \
    op interface \
    ports { projection_input_343 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4819 \
    name projection_input_342 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_342 \
    op interface \
    ports { projection_input_342 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4820 \
    name projection_input_341 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_341 \
    op interface \
    ports { projection_input_341 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4821 \
    name projection_input_340 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_340 \
    op interface \
    ports { projection_input_340 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4822 \
    name projection_input_339 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_339 \
    op interface \
    ports { projection_input_339 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4823 \
    name projection_input_338 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_338 \
    op interface \
    ports { projection_input_338 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4824 \
    name projection_input_337 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_337 \
    op interface \
    ports { projection_input_337 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4825 \
    name projection_input_336 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_336 \
    op interface \
    ports { projection_input_336 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4826 \
    name projection_input_335 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_335 \
    op interface \
    ports { projection_input_335 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4827 \
    name projection_input_334 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_334 \
    op interface \
    ports { projection_input_334 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4828 \
    name projection_input_333 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_333 \
    op interface \
    ports { projection_input_333 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4829 \
    name projection_input_332 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_332 \
    op interface \
    ports { projection_input_332 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4830 \
    name projection_input_331 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_331 \
    op interface \
    ports { projection_input_331 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4831 \
    name projection_input_330 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_330 \
    op interface \
    ports { projection_input_330 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4832 \
    name projection_input_329 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_329 \
    op interface \
    ports { projection_input_329 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4833 \
    name projection_input_328 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_328 \
    op interface \
    ports { projection_input_328 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4834 \
    name projection_input_327 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_327 \
    op interface \
    ports { projection_input_327 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4835 \
    name projection_input_326 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_326 \
    op interface \
    ports { projection_input_326 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4836 \
    name projection_input_325 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_325 \
    op interface \
    ports { projection_input_325 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4837 \
    name projection_input_324 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_324 \
    op interface \
    ports { projection_input_324 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4838 \
    name projection_input_323 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_323 \
    op interface \
    ports { projection_input_323 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4839 \
    name projection_input_322 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_322 \
    op interface \
    ports { projection_input_322 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4840 \
    name projection_input_321 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_321 \
    op interface \
    ports { projection_input_321 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4841 \
    name projection_input_320 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_320 \
    op interface \
    ports { projection_input_320 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4842 \
    name projection_input_319 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_319 \
    op interface \
    ports { projection_input_319 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4843 \
    name projection_input_318 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_318 \
    op interface \
    ports { projection_input_318 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4844 \
    name projection_input_317 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_317 \
    op interface \
    ports { projection_input_317 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4845 \
    name projection_input_316 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_316 \
    op interface \
    ports { projection_input_316 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4846 \
    name projection_input_315 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_315 \
    op interface \
    ports { projection_input_315 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4847 \
    name projection_input_314 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_314 \
    op interface \
    ports { projection_input_314 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4848 \
    name projection_input_313 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_313 \
    op interface \
    ports { projection_input_313 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4849 \
    name projection_input_312 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_312 \
    op interface \
    ports { projection_input_312 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4850 \
    name projection_input_311 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_311 \
    op interface \
    ports { projection_input_311 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4851 \
    name projection_input_310 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_310 \
    op interface \
    ports { projection_input_310 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4852 \
    name projection_input_309 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_309 \
    op interface \
    ports { projection_input_309 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4853 \
    name projection_input_308 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_308 \
    op interface \
    ports { projection_input_308 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4854 \
    name projection_input_307 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_307 \
    op interface \
    ports { projection_input_307 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4855 \
    name projection_input_306 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_306 \
    op interface \
    ports { projection_input_306 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4856 \
    name projection_input_305 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_305 \
    op interface \
    ports { projection_input_305 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4857 \
    name projection_input_304 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_304 \
    op interface \
    ports { projection_input_304 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4858 \
    name projection_input_303 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_303 \
    op interface \
    ports { projection_input_303 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4859 \
    name projection_input_302 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_302 \
    op interface \
    ports { projection_input_302 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4860 \
    name projection_input_301 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_301 \
    op interface \
    ports { projection_input_301 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4861 \
    name projection_input_300 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_300 \
    op interface \
    ports { projection_input_300 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4862 \
    name projection_input_299 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_299 \
    op interface \
    ports { projection_input_299 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4863 \
    name projection_input_298 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_298 \
    op interface \
    ports { projection_input_298 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4864 \
    name projection_input_297 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_297 \
    op interface \
    ports { projection_input_297 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4865 \
    name projection_input_296 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_296 \
    op interface \
    ports { projection_input_296 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4866 \
    name projection_input_295 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_295 \
    op interface \
    ports { projection_input_295 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4867 \
    name projection_input_294 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_294 \
    op interface \
    ports { projection_input_294 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4868 \
    name projection_input_293 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_293 \
    op interface \
    ports { projection_input_293 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4869 \
    name projection_input_292 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_292 \
    op interface \
    ports { projection_input_292 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4870 \
    name projection_input_291 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_291 \
    op interface \
    ports { projection_input_291 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4871 \
    name projection_input_290 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_290 \
    op interface \
    ports { projection_input_290 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4872 \
    name projection_input_289 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_289 \
    op interface \
    ports { projection_input_289 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4873 \
    name projection_input_288 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_288 \
    op interface \
    ports { projection_input_288 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4874 \
    name projection_input_287 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_287 \
    op interface \
    ports { projection_input_287 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4875 \
    name projection_input_286 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_286 \
    op interface \
    ports { projection_input_286 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4876 \
    name projection_input_285 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_285 \
    op interface \
    ports { projection_input_285 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4877 \
    name projection_input_284 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_284 \
    op interface \
    ports { projection_input_284 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4878 \
    name projection_input_283 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_283 \
    op interface \
    ports { projection_input_283 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4879 \
    name projection_input_282 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_282 \
    op interface \
    ports { projection_input_282 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4880 \
    name projection_input_281 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_281 \
    op interface \
    ports { projection_input_281 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4881 \
    name projection_input_280 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_280 \
    op interface \
    ports { projection_input_280 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4882 \
    name projection_input_279 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_279 \
    op interface \
    ports { projection_input_279 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4883 \
    name projection_input_278 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_278 \
    op interface \
    ports { projection_input_278 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4884 \
    name projection_input_277 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_277 \
    op interface \
    ports { projection_input_277 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4885 \
    name projection_input_276 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_276 \
    op interface \
    ports { projection_input_276 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4886 \
    name projection_input_275 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_275 \
    op interface \
    ports { projection_input_275 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4887 \
    name projection_input_274 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_274 \
    op interface \
    ports { projection_input_274 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4888 \
    name projection_input_273 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_273 \
    op interface \
    ports { projection_input_273 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4889 \
    name projection_input_272 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_272 \
    op interface \
    ports { projection_input_272 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4890 \
    name projection_input_271 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_271 \
    op interface \
    ports { projection_input_271 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4891 \
    name projection_input_270 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_270 \
    op interface \
    ports { projection_input_270 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4892 \
    name projection_input_269 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_269 \
    op interface \
    ports { projection_input_269 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4893 \
    name projection_input_268 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_268 \
    op interface \
    ports { projection_input_268 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4894 \
    name projection_input_267 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_267 \
    op interface \
    ports { projection_input_267 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4895 \
    name projection_input_266 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_266 \
    op interface \
    ports { projection_input_266 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4896 \
    name projection_input_265 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_265 \
    op interface \
    ports { projection_input_265 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4897 \
    name projection_input_264 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_264 \
    op interface \
    ports { projection_input_264 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4898 \
    name projection_input_263 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_263 \
    op interface \
    ports { projection_input_263 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4899 \
    name projection_input_262 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_262 \
    op interface \
    ports { projection_input_262 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4900 \
    name projection_input_261 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_261 \
    op interface \
    ports { projection_input_261 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4901 \
    name projection_input_260 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_260 \
    op interface \
    ports { projection_input_260 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4902 \
    name projection_input_259 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_259 \
    op interface \
    ports { projection_input_259 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4903 \
    name projection_input_258 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_258 \
    op interface \
    ports { projection_input_258 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4904 \
    name projection_input_257 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_257 \
    op interface \
    ports { projection_input_257 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4905 \
    name projection_input_256 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_256 \
    op interface \
    ports { projection_input_256 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4906 \
    name projection_input_255 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_255 \
    op interface \
    ports { projection_input_255 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4907 \
    name projection_input_254 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_254 \
    op interface \
    ports { projection_input_254 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4908 \
    name projection_input_253 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_253 \
    op interface \
    ports { projection_input_253 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4909 \
    name projection_input_252 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_252 \
    op interface \
    ports { projection_input_252 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4910 \
    name projection_input_251 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_251 \
    op interface \
    ports { projection_input_251 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4911 \
    name projection_input_250 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_250 \
    op interface \
    ports { projection_input_250 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4912 \
    name projection_input_249 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_249 \
    op interface \
    ports { projection_input_249 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4913 \
    name projection_input_248 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_248 \
    op interface \
    ports { projection_input_248 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4914 \
    name projection_input_247 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_247 \
    op interface \
    ports { projection_input_247 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4915 \
    name projection_input_246 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_246 \
    op interface \
    ports { projection_input_246 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4916 \
    name projection_input_245 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_245 \
    op interface \
    ports { projection_input_245 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4917 \
    name projection_input_244 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_244 \
    op interface \
    ports { projection_input_244 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4918 \
    name projection_input_243 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_243 \
    op interface \
    ports { projection_input_243 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4919 \
    name projection_input_242 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_242 \
    op interface \
    ports { projection_input_242 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4920 \
    name projection_input_241 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_241 \
    op interface \
    ports { projection_input_241 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4921 \
    name projection_input_240 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_240 \
    op interface \
    ports { projection_input_240 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4922 \
    name projection_input_239 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_239 \
    op interface \
    ports { projection_input_239 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4923 \
    name projection_input_238 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_238 \
    op interface \
    ports { projection_input_238 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4924 \
    name projection_input_237 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_237 \
    op interface \
    ports { projection_input_237 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4925 \
    name projection_input_236 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_236 \
    op interface \
    ports { projection_input_236 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4926 \
    name projection_input_235 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_235 \
    op interface \
    ports { projection_input_235 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4927 \
    name projection_input_234 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_234 \
    op interface \
    ports { projection_input_234 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4928 \
    name projection_input_233 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_233 \
    op interface \
    ports { projection_input_233 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4929 \
    name projection_input_232 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_232 \
    op interface \
    ports { projection_input_232 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4930 \
    name projection_input_231 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_231 \
    op interface \
    ports { projection_input_231 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4931 \
    name projection_input_230 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_230 \
    op interface \
    ports { projection_input_230 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4932 \
    name projection_input_229 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_229 \
    op interface \
    ports { projection_input_229 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4933 \
    name projection_input_228 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_228 \
    op interface \
    ports { projection_input_228 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4934 \
    name projection_input_227 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_227 \
    op interface \
    ports { projection_input_227 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4935 \
    name projection_input_226 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_226 \
    op interface \
    ports { projection_input_226 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4936 \
    name projection_input_225 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_225 \
    op interface \
    ports { projection_input_225 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4937 \
    name projection_input_224 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_224 \
    op interface \
    ports { projection_input_224 { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4938 \
    name sub_ln2803 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_ln2803 \
    op interface \
    ports { sub_ln2803 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4939 \
    name projection_input_895_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_895_out \
    op interface \
    ports { projection_input_895_out { O 16 vector } projection_input_895_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4940 \
    name projection_input_894_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_894_out \
    op interface \
    ports { projection_input_894_out { O 16 vector } projection_input_894_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4941 \
    name projection_input_893_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_893_out \
    op interface \
    ports { projection_input_893_out { O 16 vector } projection_input_893_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4942 \
    name projection_input_892_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_892_out \
    op interface \
    ports { projection_input_892_out { O 16 vector } projection_input_892_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4943 \
    name projection_input_891_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_891_out \
    op interface \
    ports { projection_input_891_out { O 16 vector } projection_input_891_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4944 \
    name projection_input_890_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_890_out \
    op interface \
    ports { projection_input_890_out { O 16 vector } projection_input_890_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4945 \
    name projection_input_889_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_889_out \
    op interface \
    ports { projection_input_889_out { O 16 vector } projection_input_889_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4946 \
    name projection_input_888_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_888_out \
    op interface \
    ports { projection_input_888_out { O 16 vector } projection_input_888_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4947 \
    name projection_input_887_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_887_out \
    op interface \
    ports { projection_input_887_out { O 16 vector } projection_input_887_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4948 \
    name projection_input_886_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_886_out \
    op interface \
    ports { projection_input_886_out { O 16 vector } projection_input_886_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4949 \
    name projection_input_885_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_885_out \
    op interface \
    ports { projection_input_885_out { O 16 vector } projection_input_885_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4950 \
    name projection_input_884_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_884_out \
    op interface \
    ports { projection_input_884_out { O 16 vector } projection_input_884_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4951 \
    name projection_input_883_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_883_out \
    op interface \
    ports { projection_input_883_out { O 16 vector } projection_input_883_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4952 \
    name projection_input_882_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_882_out \
    op interface \
    ports { projection_input_882_out { O 16 vector } projection_input_882_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4953 \
    name projection_input_881_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_881_out \
    op interface \
    ports { projection_input_881_out { O 16 vector } projection_input_881_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4954 \
    name projection_input_880_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_880_out \
    op interface \
    ports { projection_input_880_out { O 16 vector } projection_input_880_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4955 \
    name projection_input_879_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_879_out \
    op interface \
    ports { projection_input_879_out { O 16 vector } projection_input_879_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4956 \
    name projection_input_878_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_878_out \
    op interface \
    ports { projection_input_878_out { O 16 vector } projection_input_878_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4957 \
    name projection_input_877_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_877_out \
    op interface \
    ports { projection_input_877_out { O 16 vector } projection_input_877_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4958 \
    name projection_input_876_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_876_out \
    op interface \
    ports { projection_input_876_out { O 16 vector } projection_input_876_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4959 \
    name projection_input_875_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_875_out \
    op interface \
    ports { projection_input_875_out { O 16 vector } projection_input_875_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4960 \
    name projection_input_874_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_874_out \
    op interface \
    ports { projection_input_874_out { O 16 vector } projection_input_874_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4961 \
    name projection_input_873_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_873_out \
    op interface \
    ports { projection_input_873_out { O 16 vector } projection_input_873_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4962 \
    name projection_input_872_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_872_out \
    op interface \
    ports { projection_input_872_out { O 16 vector } projection_input_872_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4963 \
    name projection_input_871_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_871_out \
    op interface \
    ports { projection_input_871_out { O 16 vector } projection_input_871_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4964 \
    name projection_input_870_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_870_out \
    op interface \
    ports { projection_input_870_out { O 16 vector } projection_input_870_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4965 \
    name projection_input_869_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_869_out \
    op interface \
    ports { projection_input_869_out { O 16 vector } projection_input_869_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4966 \
    name projection_input_868_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_868_out \
    op interface \
    ports { projection_input_868_out { O 16 vector } projection_input_868_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4967 \
    name projection_input_867_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_867_out \
    op interface \
    ports { projection_input_867_out { O 16 vector } projection_input_867_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4968 \
    name projection_input_866_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_866_out \
    op interface \
    ports { projection_input_866_out { O 16 vector } projection_input_866_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4969 \
    name projection_input_865_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_865_out \
    op interface \
    ports { projection_input_865_out { O 16 vector } projection_input_865_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4970 \
    name projection_input_864_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_864_out \
    op interface \
    ports { projection_input_864_out { O 16 vector } projection_input_864_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4971 \
    name projection_input_863_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_863_out \
    op interface \
    ports { projection_input_863_out { O 16 vector } projection_input_863_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4972 \
    name projection_input_862_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_862_out \
    op interface \
    ports { projection_input_862_out { O 16 vector } projection_input_862_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4973 \
    name projection_input_861_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_861_out \
    op interface \
    ports { projection_input_861_out { O 16 vector } projection_input_861_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4974 \
    name projection_input_860_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_860_out \
    op interface \
    ports { projection_input_860_out { O 16 vector } projection_input_860_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4975 \
    name projection_input_859_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_859_out \
    op interface \
    ports { projection_input_859_out { O 16 vector } projection_input_859_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4976 \
    name projection_input_858_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_858_out \
    op interface \
    ports { projection_input_858_out { O 16 vector } projection_input_858_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4977 \
    name projection_input_857_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_857_out \
    op interface \
    ports { projection_input_857_out { O 16 vector } projection_input_857_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4978 \
    name projection_input_856_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_856_out \
    op interface \
    ports { projection_input_856_out { O 16 vector } projection_input_856_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4979 \
    name projection_input_855_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_855_out \
    op interface \
    ports { projection_input_855_out { O 16 vector } projection_input_855_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4980 \
    name projection_input_854_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_854_out \
    op interface \
    ports { projection_input_854_out { O 16 vector } projection_input_854_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4981 \
    name projection_input_853_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_853_out \
    op interface \
    ports { projection_input_853_out { O 16 vector } projection_input_853_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4982 \
    name projection_input_852_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_852_out \
    op interface \
    ports { projection_input_852_out { O 16 vector } projection_input_852_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4983 \
    name projection_input_851_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_851_out \
    op interface \
    ports { projection_input_851_out { O 16 vector } projection_input_851_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4984 \
    name projection_input_850_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_850_out \
    op interface \
    ports { projection_input_850_out { O 16 vector } projection_input_850_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4985 \
    name projection_input_849_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_849_out \
    op interface \
    ports { projection_input_849_out { O 16 vector } projection_input_849_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4986 \
    name projection_input_848_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_848_out \
    op interface \
    ports { projection_input_848_out { O 16 vector } projection_input_848_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4987 \
    name projection_input_847_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_847_out \
    op interface \
    ports { projection_input_847_out { O 16 vector } projection_input_847_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4988 \
    name projection_input_846_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_846_out \
    op interface \
    ports { projection_input_846_out { O 16 vector } projection_input_846_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4989 \
    name projection_input_845_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_845_out \
    op interface \
    ports { projection_input_845_out { O 16 vector } projection_input_845_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4990 \
    name projection_input_844_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_844_out \
    op interface \
    ports { projection_input_844_out { O 16 vector } projection_input_844_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4991 \
    name projection_input_843_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_843_out \
    op interface \
    ports { projection_input_843_out { O 16 vector } projection_input_843_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4992 \
    name projection_input_842_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_842_out \
    op interface \
    ports { projection_input_842_out { O 16 vector } projection_input_842_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4993 \
    name projection_input_841_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_841_out \
    op interface \
    ports { projection_input_841_out { O 16 vector } projection_input_841_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4994 \
    name projection_input_840_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_840_out \
    op interface \
    ports { projection_input_840_out { O 16 vector } projection_input_840_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4995 \
    name projection_input_839_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_839_out \
    op interface \
    ports { projection_input_839_out { O 16 vector } projection_input_839_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4996 \
    name projection_input_838_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_838_out \
    op interface \
    ports { projection_input_838_out { O 16 vector } projection_input_838_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4997 \
    name projection_input_837_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_837_out \
    op interface \
    ports { projection_input_837_out { O 16 vector } projection_input_837_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4998 \
    name projection_input_836_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_836_out \
    op interface \
    ports { projection_input_836_out { O 16 vector } projection_input_836_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4999 \
    name projection_input_835_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_835_out \
    op interface \
    ports { projection_input_835_out { O 16 vector } projection_input_835_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5000 \
    name projection_input_834_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_834_out \
    op interface \
    ports { projection_input_834_out { O 16 vector } projection_input_834_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5001 \
    name projection_input_833_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_833_out \
    op interface \
    ports { projection_input_833_out { O 16 vector } projection_input_833_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5002 \
    name projection_input_832_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_832_out \
    op interface \
    ports { projection_input_832_out { O 16 vector } projection_input_832_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5003 \
    name projection_input_831_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_831_out \
    op interface \
    ports { projection_input_831_out { O 16 vector } projection_input_831_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5004 \
    name projection_input_830_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_830_out \
    op interface \
    ports { projection_input_830_out { O 16 vector } projection_input_830_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5005 \
    name projection_input_829_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_829_out \
    op interface \
    ports { projection_input_829_out { O 16 vector } projection_input_829_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5006 \
    name projection_input_828_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_828_out \
    op interface \
    ports { projection_input_828_out { O 16 vector } projection_input_828_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5007 \
    name projection_input_827_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_827_out \
    op interface \
    ports { projection_input_827_out { O 16 vector } projection_input_827_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5008 \
    name projection_input_826_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_826_out \
    op interface \
    ports { projection_input_826_out { O 16 vector } projection_input_826_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5009 \
    name projection_input_825_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_825_out \
    op interface \
    ports { projection_input_825_out { O 16 vector } projection_input_825_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5010 \
    name projection_input_824_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_824_out \
    op interface \
    ports { projection_input_824_out { O 16 vector } projection_input_824_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5011 \
    name projection_input_823_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_823_out \
    op interface \
    ports { projection_input_823_out { O 16 vector } projection_input_823_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5012 \
    name projection_input_822_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_822_out \
    op interface \
    ports { projection_input_822_out { O 16 vector } projection_input_822_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5013 \
    name projection_input_821_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_821_out \
    op interface \
    ports { projection_input_821_out { O 16 vector } projection_input_821_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5014 \
    name projection_input_820_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_820_out \
    op interface \
    ports { projection_input_820_out { O 16 vector } projection_input_820_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5015 \
    name projection_input_819_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_819_out \
    op interface \
    ports { projection_input_819_out { O 16 vector } projection_input_819_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5016 \
    name projection_input_818_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_818_out \
    op interface \
    ports { projection_input_818_out { O 16 vector } projection_input_818_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5017 \
    name projection_input_817_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_817_out \
    op interface \
    ports { projection_input_817_out { O 16 vector } projection_input_817_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5018 \
    name projection_input_816_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_816_out \
    op interface \
    ports { projection_input_816_out { O 16 vector } projection_input_816_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5019 \
    name projection_input_815_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_815_out \
    op interface \
    ports { projection_input_815_out { O 16 vector } projection_input_815_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5020 \
    name projection_input_814_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_814_out \
    op interface \
    ports { projection_input_814_out { O 16 vector } projection_input_814_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5021 \
    name projection_input_813_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_813_out \
    op interface \
    ports { projection_input_813_out { O 16 vector } projection_input_813_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5022 \
    name projection_input_812_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_812_out \
    op interface \
    ports { projection_input_812_out { O 16 vector } projection_input_812_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5023 \
    name projection_input_811_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_811_out \
    op interface \
    ports { projection_input_811_out { O 16 vector } projection_input_811_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5024 \
    name projection_input_810_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_810_out \
    op interface \
    ports { projection_input_810_out { O 16 vector } projection_input_810_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5025 \
    name projection_input_809_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_809_out \
    op interface \
    ports { projection_input_809_out { O 16 vector } projection_input_809_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5026 \
    name projection_input_808_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_808_out \
    op interface \
    ports { projection_input_808_out { O 16 vector } projection_input_808_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5027 \
    name projection_input_807_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_807_out \
    op interface \
    ports { projection_input_807_out { O 16 vector } projection_input_807_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5028 \
    name projection_input_806_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_806_out \
    op interface \
    ports { projection_input_806_out { O 16 vector } projection_input_806_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5029 \
    name projection_input_805_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_805_out \
    op interface \
    ports { projection_input_805_out { O 16 vector } projection_input_805_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5030 \
    name projection_input_804_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_804_out \
    op interface \
    ports { projection_input_804_out { O 16 vector } projection_input_804_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5031 \
    name projection_input_803_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_803_out \
    op interface \
    ports { projection_input_803_out { O 16 vector } projection_input_803_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5032 \
    name projection_input_802_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_802_out \
    op interface \
    ports { projection_input_802_out { O 16 vector } projection_input_802_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5033 \
    name projection_input_801_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_801_out \
    op interface \
    ports { projection_input_801_out { O 16 vector } projection_input_801_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5034 \
    name projection_input_800_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_800_out \
    op interface \
    ports { projection_input_800_out { O 16 vector } projection_input_800_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5035 \
    name projection_input_799_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_799_out \
    op interface \
    ports { projection_input_799_out { O 16 vector } projection_input_799_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5036 \
    name projection_input_798_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_798_out \
    op interface \
    ports { projection_input_798_out { O 16 vector } projection_input_798_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5037 \
    name projection_input_797_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_797_out \
    op interface \
    ports { projection_input_797_out { O 16 vector } projection_input_797_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5038 \
    name projection_input_796_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_796_out \
    op interface \
    ports { projection_input_796_out { O 16 vector } projection_input_796_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5039 \
    name projection_input_795_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_795_out \
    op interface \
    ports { projection_input_795_out { O 16 vector } projection_input_795_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5040 \
    name projection_input_794_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_794_out \
    op interface \
    ports { projection_input_794_out { O 16 vector } projection_input_794_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5041 \
    name projection_input_793_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_793_out \
    op interface \
    ports { projection_input_793_out { O 16 vector } projection_input_793_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5042 \
    name projection_input_792_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_792_out \
    op interface \
    ports { projection_input_792_out { O 16 vector } projection_input_792_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5043 \
    name projection_input_791_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_791_out \
    op interface \
    ports { projection_input_791_out { O 16 vector } projection_input_791_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5044 \
    name projection_input_790_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_790_out \
    op interface \
    ports { projection_input_790_out { O 16 vector } projection_input_790_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5045 \
    name projection_input_789_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_789_out \
    op interface \
    ports { projection_input_789_out { O 16 vector } projection_input_789_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5046 \
    name projection_input_788_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_788_out \
    op interface \
    ports { projection_input_788_out { O 16 vector } projection_input_788_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5047 \
    name projection_input_787_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_787_out \
    op interface \
    ports { projection_input_787_out { O 16 vector } projection_input_787_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5048 \
    name projection_input_786_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_786_out \
    op interface \
    ports { projection_input_786_out { O 16 vector } projection_input_786_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5049 \
    name projection_input_785_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_785_out \
    op interface \
    ports { projection_input_785_out { O 16 vector } projection_input_785_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5050 \
    name projection_input_784_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_784_out \
    op interface \
    ports { projection_input_784_out { O 16 vector } projection_input_784_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5051 \
    name projection_input_783_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_783_out \
    op interface \
    ports { projection_input_783_out { O 16 vector } projection_input_783_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5052 \
    name projection_input_782_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_782_out \
    op interface \
    ports { projection_input_782_out { O 16 vector } projection_input_782_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5053 \
    name projection_input_781_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_781_out \
    op interface \
    ports { projection_input_781_out { O 16 vector } projection_input_781_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5054 \
    name projection_input_780_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_780_out \
    op interface \
    ports { projection_input_780_out { O 16 vector } projection_input_780_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5055 \
    name projection_input_779_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_779_out \
    op interface \
    ports { projection_input_779_out { O 16 vector } projection_input_779_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5056 \
    name projection_input_778_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_778_out \
    op interface \
    ports { projection_input_778_out { O 16 vector } projection_input_778_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5057 \
    name projection_input_777_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_777_out \
    op interface \
    ports { projection_input_777_out { O 16 vector } projection_input_777_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5058 \
    name projection_input_776_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_776_out \
    op interface \
    ports { projection_input_776_out { O 16 vector } projection_input_776_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5059 \
    name projection_input_775_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_775_out \
    op interface \
    ports { projection_input_775_out { O 16 vector } projection_input_775_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5060 \
    name projection_input_774_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_774_out \
    op interface \
    ports { projection_input_774_out { O 16 vector } projection_input_774_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5061 \
    name projection_input_773_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_773_out \
    op interface \
    ports { projection_input_773_out { O 16 vector } projection_input_773_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5062 \
    name projection_input_772_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_772_out \
    op interface \
    ports { projection_input_772_out { O 16 vector } projection_input_772_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5063 \
    name projection_input_771_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_771_out \
    op interface \
    ports { projection_input_771_out { O 16 vector } projection_input_771_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5064 \
    name projection_input_770_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_770_out \
    op interface \
    ports { projection_input_770_out { O 16 vector } projection_input_770_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5065 \
    name projection_input_769_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_769_out \
    op interface \
    ports { projection_input_769_out { O 16 vector } projection_input_769_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5066 \
    name projection_input_768_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_768_out \
    op interface \
    ports { projection_input_768_out { O 16 vector } projection_input_768_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5067 \
    name projection_input_767_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_767_out \
    op interface \
    ports { projection_input_767_out { O 16 vector } projection_input_767_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5068 \
    name projection_input_766_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_766_out \
    op interface \
    ports { projection_input_766_out { O 16 vector } projection_input_766_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5069 \
    name projection_input_765_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_765_out \
    op interface \
    ports { projection_input_765_out { O 16 vector } projection_input_765_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5070 \
    name projection_input_764_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_764_out \
    op interface \
    ports { projection_input_764_out { O 16 vector } projection_input_764_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5071 \
    name projection_input_763_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_763_out \
    op interface \
    ports { projection_input_763_out { O 16 vector } projection_input_763_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5072 \
    name projection_input_762_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_762_out \
    op interface \
    ports { projection_input_762_out { O 16 vector } projection_input_762_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5073 \
    name projection_input_761_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_761_out \
    op interface \
    ports { projection_input_761_out { O 16 vector } projection_input_761_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5074 \
    name projection_input_760_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_760_out \
    op interface \
    ports { projection_input_760_out { O 16 vector } projection_input_760_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5075 \
    name projection_input_759_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_759_out \
    op interface \
    ports { projection_input_759_out { O 16 vector } projection_input_759_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5076 \
    name projection_input_758_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_758_out \
    op interface \
    ports { projection_input_758_out { O 16 vector } projection_input_758_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5077 \
    name projection_input_757_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_757_out \
    op interface \
    ports { projection_input_757_out { O 16 vector } projection_input_757_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5078 \
    name projection_input_756_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_756_out \
    op interface \
    ports { projection_input_756_out { O 16 vector } projection_input_756_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5079 \
    name projection_input_755_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_755_out \
    op interface \
    ports { projection_input_755_out { O 16 vector } projection_input_755_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5080 \
    name projection_input_754_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_754_out \
    op interface \
    ports { projection_input_754_out { O 16 vector } projection_input_754_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5081 \
    name projection_input_753_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_753_out \
    op interface \
    ports { projection_input_753_out { O 16 vector } projection_input_753_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5082 \
    name projection_input_752_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_752_out \
    op interface \
    ports { projection_input_752_out { O 16 vector } projection_input_752_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5083 \
    name projection_input_751_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_751_out \
    op interface \
    ports { projection_input_751_out { O 16 vector } projection_input_751_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5084 \
    name projection_input_750_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_750_out \
    op interface \
    ports { projection_input_750_out { O 16 vector } projection_input_750_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5085 \
    name projection_input_749_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_749_out \
    op interface \
    ports { projection_input_749_out { O 16 vector } projection_input_749_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5086 \
    name projection_input_748_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_748_out \
    op interface \
    ports { projection_input_748_out { O 16 vector } projection_input_748_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5087 \
    name projection_input_747_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_747_out \
    op interface \
    ports { projection_input_747_out { O 16 vector } projection_input_747_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5088 \
    name projection_input_746_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_746_out \
    op interface \
    ports { projection_input_746_out { O 16 vector } projection_input_746_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5089 \
    name projection_input_745_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_745_out \
    op interface \
    ports { projection_input_745_out { O 16 vector } projection_input_745_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5090 \
    name projection_input_744_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_744_out \
    op interface \
    ports { projection_input_744_out { O 16 vector } projection_input_744_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5091 \
    name projection_input_743_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_743_out \
    op interface \
    ports { projection_input_743_out { O 16 vector } projection_input_743_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5092 \
    name projection_input_742_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_742_out \
    op interface \
    ports { projection_input_742_out { O 16 vector } projection_input_742_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5093 \
    name projection_input_741_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_741_out \
    op interface \
    ports { projection_input_741_out { O 16 vector } projection_input_741_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5094 \
    name projection_input_740_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_740_out \
    op interface \
    ports { projection_input_740_out { O 16 vector } projection_input_740_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5095 \
    name projection_input_739_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_739_out \
    op interface \
    ports { projection_input_739_out { O 16 vector } projection_input_739_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5096 \
    name projection_input_738_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_738_out \
    op interface \
    ports { projection_input_738_out { O 16 vector } projection_input_738_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5097 \
    name projection_input_737_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_737_out \
    op interface \
    ports { projection_input_737_out { O 16 vector } projection_input_737_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5098 \
    name projection_input_736_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_736_out \
    op interface \
    ports { projection_input_736_out { O 16 vector } projection_input_736_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5099 \
    name projection_input_735_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_735_out \
    op interface \
    ports { projection_input_735_out { O 16 vector } projection_input_735_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5100 \
    name projection_input_734_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_734_out \
    op interface \
    ports { projection_input_734_out { O 16 vector } projection_input_734_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5101 \
    name projection_input_733_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_733_out \
    op interface \
    ports { projection_input_733_out { O 16 vector } projection_input_733_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5102 \
    name projection_input_732_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_732_out \
    op interface \
    ports { projection_input_732_out { O 16 vector } projection_input_732_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5103 \
    name projection_input_731_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_731_out \
    op interface \
    ports { projection_input_731_out { O 16 vector } projection_input_731_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5104 \
    name projection_input_730_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_730_out \
    op interface \
    ports { projection_input_730_out { O 16 vector } projection_input_730_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5105 \
    name projection_input_729_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_729_out \
    op interface \
    ports { projection_input_729_out { O 16 vector } projection_input_729_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5106 \
    name projection_input_728_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_728_out \
    op interface \
    ports { projection_input_728_out { O 16 vector } projection_input_728_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5107 \
    name projection_input_727_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_727_out \
    op interface \
    ports { projection_input_727_out { O 16 vector } projection_input_727_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5108 \
    name projection_input_726_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_726_out \
    op interface \
    ports { projection_input_726_out { O 16 vector } projection_input_726_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5109 \
    name projection_input_725_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_725_out \
    op interface \
    ports { projection_input_725_out { O 16 vector } projection_input_725_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5110 \
    name projection_input_724_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_724_out \
    op interface \
    ports { projection_input_724_out { O 16 vector } projection_input_724_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5111 \
    name projection_input_723_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_723_out \
    op interface \
    ports { projection_input_723_out { O 16 vector } projection_input_723_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5112 \
    name projection_input_722_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_722_out \
    op interface \
    ports { projection_input_722_out { O 16 vector } projection_input_722_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5113 \
    name projection_input_721_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_721_out \
    op interface \
    ports { projection_input_721_out { O 16 vector } projection_input_721_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5114 \
    name projection_input_720_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_720_out \
    op interface \
    ports { projection_input_720_out { O 16 vector } projection_input_720_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5115 \
    name projection_input_719_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_719_out \
    op interface \
    ports { projection_input_719_out { O 16 vector } projection_input_719_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5116 \
    name projection_input_718_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_718_out \
    op interface \
    ports { projection_input_718_out { O 16 vector } projection_input_718_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5117 \
    name projection_input_717_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_717_out \
    op interface \
    ports { projection_input_717_out { O 16 vector } projection_input_717_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5118 \
    name projection_input_716_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_716_out \
    op interface \
    ports { projection_input_716_out { O 16 vector } projection_input_716_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5119 \
    name projection_input_715_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_715_out \
    op interface \
    ports { projection_input_715_out { O 16 vector } projection_input_715_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5120 \
    name projection_input_714_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_714_out \
    op interface \
    ports { projection_input_714_out { O 16 vector } projection_input_714_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5121 \
    name projection_input_713_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_713_out \
    op interface \
    ports { projection_input_713_out { O 16 vector } projection_input_713_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5122 \
    name projection_input_712_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_712_out \
    op interface \
    ports { projection_input_712_out { O 16 vector } projection_input_712_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5123 \
    name projection_input_711_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_711_out \
    op interface \
    ports { projection_input_711_out { O 16 vector } projection_input_711_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5124 \
    name projection_input_710_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_710_out \
    op interface \
    ports { projection_input_710_out { O 16 vector } projection_input_710_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5125 \
    name projection_input_709_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_709_out \
    op interface \
    ports { projection_input_709_out { O 16 vector } projection_input_709_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5126 \
    name projection_input_708_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_708_out \
    op interface \
    ports { projection_input_708_out { O 16 vector } projection_input_708_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5127 \
    name projection_input_707_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_707_out \
    op interface \
    ports { projection_input_707_out { O 16 vector } projection_input_707_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5128 \
    name projection_input_706_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_706_out \
    op interface \
    ports { projection_input_706_out { O 16 vector } projection_input_706_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5129 \
    name projection_input_705_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_705_out \
    op interface \
    ports { projection_input_705_out { O 16 vector } projection_input_705_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5130 \
    name projection_input_704_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_704_out \
    op interface \
    ports { projection_input_704_out { O 16 vector } projection_input_704_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5131 \
    name projection_input_703_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_703_out \
    op interface \
    ports { projection_input_703_out { O 16 vector } projection_input_703_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5132 \
    name projection_input_702_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_702_out \
    op interface \
    ports { projection_input_702_out { O 16 vector } projection_input_702_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5133 \
    name projection_input_701_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_701_out \
    op interface \
    ports { projection_input_701_out { O 16 vector } projection_input_701_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5134 \
    name projection_input_700_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_700_out \
    op interface \
    ports { projection_input_700_out { O 16 vector } projection_input_700_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5135 \
    name projection_input_699_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_699_out \
    op interface \
    ports { projection_input_699_out { O 16 vector } projection_input_699_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5136 \
    name projection_input_698_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_698_out \
    op interface \
    ports { projection_input_698_out { O 16 vector } projection_input_698_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5137 \
    name projection_input_697_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_697_out \
    op interface \
    ports { projection_input_697_out { O 16 vector } projection_input_697_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5138 \
    name projection_input_696_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_696_out \
    op interface \
    ports { projection_input_696_out { O 16 vector } projection_input_696_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5139 \
    name projection_input_695_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_695_out \
    op interface \
    ports { projection_input_695_out { O 16 vector } projection_input_695_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5140 \
    name projection_input_694_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_694_out \
    op interface \
    ports { projection_input_694_out { O 16 vector } projection_input_694_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5141 \
    name projection_input_693_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_693_out \
    op interface \
    ports { projection_input_693_out { O 16 vector } projection_input_693_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5142 \
    name projection_input_692_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_692_out \
    op interface \
    ports { projection_input_692_out { O 16 vector } projection_input_692_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5143 \
    name projection_input_691_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_691_out \
    op interface \
    ports { projection_input_691_out { O 16 vector } projection_input_691_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5144 \
    name projection_input_690_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_690_out \
    op interface \
    ports { projection_input_690_out { O 16 vector } projection_input_690_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5145 \
    name projection_input_689_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_689_out \
    op interface \
    ports { projection_input_689_out { O 16 vector } projection_input_689_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5146 \
    name projection_input_688_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_688_out \
    op interface \
    ports { projection_input_688_out { O 16 vector } projection_input_688_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5147 \
    name projection_input_687_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_687_out \
    op interface \
    ports { projection_input_687_out { O 16 vector } projection_input_687_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5148 \
    name projection_input_686_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_686_out \
    op interface \
    ports { projection_input_686_out { O 16 vector } projection_input_686_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5149 \
    name projection_input_685_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_685_out \
    op interface \
    ports { projection_input_685_out { O 16 vector } projection_input_685_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5150 \
    name projection_input_684_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_684_out \
    op interface \
    ports { projection_input_684_out { O 16 vector } projection_input_684_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5151 \
    name projection_input_683_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_683_out \
    op interface \
    ports { projection_input_683_out { O 16 vector } projection_input_683_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5152 \
    name projection_input_682_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_682_out \
    op interface \
    ports { projection_input_682_out { O 16 vector } projection_input_682_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5153 \
    name projection_input_681_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_681_out \
    op interface \
    ports { projection_input_681_out { O 16 vector } projection_input_681_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5154 \
    name projection_input_680_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_680_out \
    op interface \
    ports { projection_input_680_out { O 16 vector } projection_input_680_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5155 \
    name projection_input_679_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_679_out \
    op interface \
    ports { projection_input_679_out { O 16 vector } projection_input_679_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5156 \
    name projection_input_678_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_678_out \
    op interface \
    ports { projection_input_678_out { O 16 vector } projection_input_678_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5157 \
    name projection_input_677_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_677_out \
    op interface \
    ports { projection_input_677_out { O 16 vector } projection_input_677_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5158 \
    name projection_input_676_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_676_out \
    op interface \
    ports { projection_input_676_out { O 16 vector } projection_input_676_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5159 \
    name projection_input_675_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_675_out \
    op interface \
    ports { projection_input_675_out { O 16 vector } projection_input_675_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5160 \
    name projection_input_674_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_674_out \
    op interface \
    ports { projection_input_674_out { O 16 vector } projection_input_674_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5161 \
    name projection_input_673_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_673_out \
    op interface \
    ports { projection_input_673_out { O 16 vector } projection_input_673_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5162 \
    name projection_input_672_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_projection_input_672_out \
    op interface \
    ports { projection_input_672_out { O 16 vector } projection_input_672_out_ap_vld { O 1 bit } } \
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



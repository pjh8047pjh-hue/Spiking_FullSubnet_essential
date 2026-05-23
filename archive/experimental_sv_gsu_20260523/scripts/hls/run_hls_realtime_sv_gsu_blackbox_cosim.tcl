source [file join [file dirname [file normalize [info script]]] common_hls_paths.tcl]
catch {unset ::env(DEBUG)}
set ::env(HLS_EXTRA_CFLAGS) "-DUSE_SV_GSU_LAYER"

# §3.2 step 1-4: SV hidden-group blackbox 경로의 cosim wrapper
# 사전 요구: scripts/hls/run_hls_realtime_sv_gsu_blackbox_synth_only.tcl 실행해
# build/hls/subband_q610_realtime_sv_gsu_blackbox_hls/solution1 csynth 완료 상태여야 한다.
hls_prepare_project subband_q610_realtime_sv_gsu_blackbox_hls subband_realtime_hls_tb.cpp
open_project $hls_project_dir
open_solution solution1

# cosim 시간 폭주 방지를 위해 trace_level은 port에 한정.
# RTL blackbox와 AXIS adaptor wrapper 충돌이 생기면 -ldflags "-Wl,-rpath" 형태로 재시도 필요.
cosim_design -trace_level port -rtl verilog -tool xsim
exit

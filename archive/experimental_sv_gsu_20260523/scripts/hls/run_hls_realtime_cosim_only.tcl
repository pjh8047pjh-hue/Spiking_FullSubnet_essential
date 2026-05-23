source [file join [file dirname [file normalize [info script]]] common_hls_paths.tcl]

# §3.2 step 1-2: baseline cosim wrapper
# 가장 가벼운 RTL cosim 진입점. csynth가 끝난 프로젝트를 열어 cosim_design만 실행한다.
# 사전 요구: scripts/hls/run_hls_realtime_synth_only.tcl 실행해 csynth 완료 상태여야 한다.
hls_prepare_project subband_q610_realtime_hls subband_realtime_hls_tb.cpp
open_project $hls_project_dir
open_solution solution1

# trace_level을 port_io로 제한해 cosim 시간/디스크 폭주 방지
cosim_design -trace_level port -rtl verilog -tool xsim
exit

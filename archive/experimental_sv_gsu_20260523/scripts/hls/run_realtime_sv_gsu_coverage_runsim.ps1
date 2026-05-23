param(
  [string]$Repo = "c:\Users\User\Documents\Speech Enhancement\Spiking_FullSubnet_opt_hls"
)

subst H: $Repo | Out-Null
New-Item -ItemType Directory -Force -Path H:/logs/hls | Out-Null
Set-Location H:/build/hls/subband_q610_realtime_sv_gsu_coverage_hls/solution1/csim/build
& "C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat" run_sim.tcl *>&1 |
  Tee-Object -FilePath H:/logs/hls/vitis_hls_realtime_sv_gsu_csim_coverage_runsim.log
exit $LASTEXITCODE

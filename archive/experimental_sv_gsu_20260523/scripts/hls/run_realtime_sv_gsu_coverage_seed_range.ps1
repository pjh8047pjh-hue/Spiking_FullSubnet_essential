param(
  [int]$SeedBegin = 0,
  [int]$SeedEnd = 8,
  [string]$Repo = "c:\Users\User\Documents\Speech Enhancement\Spiking_FullSubnet_opt_hls"
)

subst H: $Repo | Out-Null
New-Item -ItemType Directory -Force -Path H:/logs/hls | Out-Null
$env:HLS_REPO_DIR = "H:/"
$env:HLS_BUILD_DIR = "H:/build/hls"
$env:SUBBAND_COVERAGE_SEED_BEGIN = "$SeedBegin"
$env:SUBBAND_COVERAGE_SEED_END = "$SeedEnd"

$log = "H:/logs/hls/vitis_hls_realtime_sv_gsu_csim_coverage_seed_${SeedBegin}_${SeedEnd}.log"
Set-Location H:/
& "C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat" `
  -f H:/scripts/hls/run_hls_realtime_sv_gsu_csim_coverage.tcl `
  -l $log
exit $LASTEXITCODE

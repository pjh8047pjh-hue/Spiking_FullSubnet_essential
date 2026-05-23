param(
  [string]$Repo = "c:\Users\User\Documents\Speech Enhancement\Spiking_FullSubnet_opt_hls",
  [int]$ParallelJobs = 4
)

$ErrorActionPreference = "Stop"

$repoPath = Resolve-Path $Repo
$buildDir = Join-Path $repoPath "build\hls\subband_q610_realtime_sv_gsu_blackbox_coverage_hls\solution1\csim\build"
$exe = Join-Path $buildDir "csim.exe"
$logDir = Join-Path $repoPath "logs\hls\coverage_segments"

if (-not (Test-Path $exe)) {
  throw "Missing csim.exe. Run run_hls_realtime_sv_gsu_blackbox_csim_coverage.tcl once to build C-sim first: $exe"
}

New-Item -ItemType Directory -Force -Path $logDir | Out-Null

$extraPath = @(
  "C:\Xilinx\Vitis_HLS\2023.2\tps\mingw\8.3.0\win64.o\nt\bin",
  "C:\Xilinx\Vitis_HLS\2023.2\tps\win64\msys64\mingw64\bin",
  "C:\Xilinx\Vitis_HLS\2023.2\win64\tools\fpo_v7_1",
  "C:\Xilinx\Vitis_HLS\2023.2\win64\tools\fft_v9_1",
  "C:\Xilinx\Vitis_HLS\2023.2\win64\tools\fir_v7_0",
  "C:\Xilinx\Vitis_HLS\2023.2\win64\tools\dds_v6_0",
  "C:\Xilinx\Vitis_HLS\2023.2\win64\csim"
) -join ";"

$ranges = @(
  @{Begin=0; End=8; Name="seed00_08"},
  @{Begin=8; End=16; Name="seed08_16"},
  @{Begin=16; End=24; Name="seed16_24"},
  @{Begin=24; End=32; Name="seed24_32"}
)

$results = @()
for ($i = 0; $i -lt $ranges.Count; $i += $ParallelJobs) {
  $batch = $ranges[$i..([Math]::Min($i + $ParallelJobs - 1, $ranges.Count - 1))]
  $jobs = @()

  foreach ($range in $batch) {
    $outLog = Join-Path $logDir ("coverage_{0}.log" -f $range.Name)
    $errLog = Join-Path $logDir ("coverage_{0}.err.log" -f $range.Name)
    $jobs += Start-Job -ArgumentList $buildDir,$range.Begin,$range.End,$outLog,$errLog,$extraPath -ScriptBlock {
      param($workDir,$seedBegin,$seedEnd,$outLogPath,$errLogPath,$extraPathValue)
      $env:PATH = "$extraPathValue;$env:PATH"
      $env:SUBBAND_COVERAGE_SEED_BEGIN = [string]$seedBegin
      $env:SUBBAND_COVERAGE_SEED_END = [string]$seedEnd

      Push-Location $workDir
      try {
        cmd /c csim.exe > $outLogPath 2> $errLogPath
        $exitCode = $LASTEXITCODE
      } finally {
        Pop-Location
      }

      [pscustomobject]@{
        Begin = $seedBegin
        End = $seedEnd
        ExitCode = $exitCode
        OutLog = $outLogPath
        ErrLog = $errLogPath
      }
    }
  }

  Wait-Job -Job $jobs | Out-Null
  $results += $jobs | Receive-Job
  $jobs | Remove-Job
}

$results = $results | Sort-Object Begin
$results | Format-Table -AutoSize
if (($results | Where-Object { $_.ExitCode -ne 0 }).Count -gt 0) {
  exit 1
}

$summary = @()
$logs = Get-ChildItem $logDir -Filter "coverage_seed*.log" |
  Where-Object { $_.Name -notlike "*.err.log" } |
  Sort-Object Name

foreach ($log in $logs) {
  $values = @{}
  Get-Content $log.FullName | ForEach-Object {
    if ($_ -match "^([A-Za-z0-9_]+)=(.*)$") {
      $values[$matches[1]] = $matches[2]
    }
  }

  $summary += [pscustomobject]@{
    Log = $log.Name
    SeedBegin = [int]$values["seed_begin"]
    SeedEnd = [int]$values["seed_end"]
    SeedsExecuted = [int]$values["seeds_executed"]
    PrimaryScenarios = [int]$values["primary_scenarios"]
    ResetReplayScenarios = [int]$values["reset_replay_scenarios"]
    TotalScenarios = [int]$values["total_scenarios"]
    DfElements = [int64]$values["df_coef_elements_compared"]
    DfMismatches = [int64]$values["df_coef_mismatches"]
    TlastMismatches = [int64]$values["tlast_mismatches"]
    SizeMismatches = [int64]$values["size_mismatches"]
    ExtraOutputErrors = [int64]$values["extra_output_errors"]
    Result = $values["result"]
  }
}

$summary | Format-Table -AutoSize
$total = [pscustomobject]@{
  SeedsExecuted = ($summary | Measure-Object SeedsExecuted -Sum).Sum
  PrimaryScenarios = ($summary | Measure-Object PrimaryScenarios -Sum).Sum
  ResetReplayScenarios = ($summary | Measure-Object ResetReplayScenarios -Sum).Sum
  TotalScenarios = ($summary | Measure-Object TotalScenarios -Sum).Sum
  DfElements = ($summary | Measure-Object DfElements -Sum).Sum
  DfMismatches = ($summary | Measure-Object DfMismatches -Sum).Sum
  TlastMismatches = ($summary | Measure-Object TlastMismatches -Sum).Sum
  SizeMismatches = ($summary | Measure-Object SizeMismatches -Sum).Sum
  ExtraOutputErrors = ($summary | Measure-Object ExtraOutputErrors -Sum).Sum
  AllPass = (($summary | Where-Object { $_.Result -ne "PASS" }).Count -eq 0)
}

Write-Host "AGGREGATE"
$total | Format-List

if (-not $total.AllPass -or
    $total.DfMismatches -ne 0 -or
    $total.TlastMismatches -ne 0 -or
    $total.SizeMismatches -ne 0 -or
    $total.ExtraOutputErrors -ne 0) {
  exit 1
}

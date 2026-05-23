param(
  [switch]$Build,
  [switch]$Run,
  [switch]$ProbeOnly
)

$ErrorActionPreference = "Stop"

$repo = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
if (-not (Test-Path "H:")) {
  subst H: $repo
}

$logDir = "H:/logs/vitis"
New-Item -ItemType Directory -Force -Path $logDir | Out-Null
$xsct = "C:\Xilinx\Vitis\2023.2\bin\xsct.bat"

function Set-XilinxWorkspaceEnvironment {
  $tempRoot = "H:/build/tmp/xilinx"
  $homeRoot = "H:/build/tmp/xilinx_home"
  $localAppData = "$homeRoot/AppData/Local"
  New-Item -ItemType Directory -Force -Path $tempRoot | Out-Null
  New-Item -ItemType Directory -Force -Path "$homeRoot/Local/Temp" | Out-Null
  New-Item -ItemType Directory -Force -Path "$homeRoot/Application Data" | Out-Null
  New-Item -ItemType Directory -Force -Path "$localAppData/Temp" | Out-Null
  New-Item -ItemType Directory -Force -Path "$homeRoot/.Xilinx" | Out-Null

  $env:TEMP = $tempRoot
  $env:TMP = $tempRoot
  $env:HOME = $homeRoot
  $env:USERPROFILE = $homeRoot
  $env:APPDATA = "$homeRoot/Application Data"
  $env:LOCALAPPDATA = $localAppData
  $env:XILINX_LOCAL_USER_DATA = "$homeRoot/.Xilinx"
}

function Invoke-XsctScript {
  param(
    [string]$Script,
    [string]$Name
  )
  $stamp = Get-Date -Format "yyyyMMdd_HHmmss"
  $log = "$logDir/${Name}_$stamp.log"
  $stdoutLog = "$logDir/${Name}_${stamp}.stdout.log"
  $stderrLog = "$logDir/${Name}_${stamp}.stderr.log"
  Write-Host "Running XSCT $Name"
  Write-Host "  Script: $Script"
  Write-Host "  Log: $log"
  Set-XilinxWorkspaceEnvironment
  $proc = Start-Process -FilePath $xsct `
    -ArgumentList @($Script) `
    -NoNewWindow `
    -Wait `
    -PassThru `
    -RedirectStandardOutput $stdoutLog `
    -RedirectStandardError $stderrLog
  if (Test-Path $stdoutLog) {
    Get-Content $stdoutLog | Tee-Object -FilePath $log
  }
  if ((Test-Path $stderrLog) -and ((Get-Item $stderrLog).Length -gt 0)) {
    "=== STDERR ===" | Tee-Object -FilePath $log -Append
    Get-Content $stderrLog | Tee-Object -FilePath $log -Append
  }
  $exitCode = $proc.ExitCode
  if ($Name -match "probe|run") {
    $logText = Get-Content $log -Raw
    if ($logText -match "No JTAG targets detected|connection refused|invoked from within") {
      throw "XSCT $Name did not detect a usable JTAG target. See $log"
    }
  }
  if ($exitCode -ne 0) {
    throw "XSCT $Name failed with exit code $exitCode"
  }
}

if (-not $Build -and -not $Run -and -not $ProbeOnly) {
  $Build = $true
}

if ($ProbeOnly) {
  Invoke-XsctScript -Script "H:/scripts/vitis/probe_zybo_jtag.tcl" -Name "probe_zybo_jtag"
  exit 0
}

if ($Build) {
  Invoke-XsctScript -Script "H:/scripts/vitis/build_realtime_dma_selftest.tcl" -Name "build_realtime_dma_selftest"
}

if ($Run) {
  Invoke-XsctScript -Script "H:/scripts/vitis/run_realtime_dma_selftest.tcl" -Name "run_realtime_dma_selftest"
}

param(
  [string]$Tcl = "H:/scripts/vivado/run_vivado_realtime_dma_impl.tcl",
  [int]$Threads = 2,
  [int]$MinFreeMemGB = 8,
  [switch]$KillStale
)

$ErrorActionPreference = "Stop"

$repo = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
if (-not (Test-Path "H:")) {
  subst H: $repo
}

$xilinxNames = @("vivado", "vitis_hls", "vitis", "xsim", "xelab", "xvlog", "xsc")
$running = Get-Process | Where-Object { $xilinxNames -contains $_.ProcessName }
if ($running) {
  if (-not $KillStale) {
    Write-Host "Refusing to start Vivado because Xilinx processes are already running:"
    $running | Select-Object ProcessName, Id, CPU, WorkingSet64 | Format-Table -AutoSize
    Write-Host "Re-run with -KillStale only when you are sure those runs can be stopped."
    exit 2
  }

  Write-Host "Stopping stale Xilinx processes before starting Vivado:"
  $running | Select-Object ProcessName, Id, CPU, WorkingSet64 | Format-Table -AutoSize
  $running | Stop-Process -Force
}

$availableMb = (Get-Counter "\Memory\Available MBytes" -SampleInterval 1 -MaxSamples 1).CounterSamples[0].CookedValue
if ($availableMb -lt ($MinFreeMemGB * 1024)) {
  Write-Host ("Refusing to start Vivado: available memory is {0:N0} MB, threshold is {1:N0} MB." -f $availableMb, ($MinFreeMemGB * 1024))
  exit 3
}

$logDir = "H:/logs/vivado"
New-Item -ItemType Directory -Force -Path $logDir | Out-Null
$stamp = Get-Date -Format "yyyyMMdd_HHmmss"
$log = "$logDir/vivado_safe_$stamp.log"
$journal = "$logDir/vivado_safe_$stamp.jou"

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
$env:VIVADO_MAX_THREADS = [string]$Threads
$vivado = "C:\Xilinx\Vivado\2023.2\bin\vivado.bat"
$args = @("-mode", "batch", "-source", $Tcl, "-journal", $journal, "-log", $log)

Write-Host "Starting Vivado safely:"
Write-Host "  Tcl: $Tcl"
Write-Host "  Threads: $Threads"
Write-Host "  Available memory: $([int]$availableMb) MB"
Write-Host "  Log: $log"

$proc = Start-Process -FilePath $vivado -ArgumentList $args -WindowStyle Hidden -WorkingDirectory "H:/" -PassThru
Start-Sleep -Seconds 2
try {
  $proc.PriorityClass = "BelowNormal"
} catch {
  Write-Host "Warning: could not set Vivado priority: $($_.Exception.Message)"
}
$proc.WaitForExit()
exit $proc.ExitCode

param(
  [string]$VivadoBin = "C:\Xilinx\Vivado\2023.2\bin",
  [string]$BuildDir = "build\rtl\learning_labs_xsim",
  [int]$Threads = 8
)

$ErrorActionPreference = "Stop"
$repo = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$build = Join-Path $repo $BuildDir
New-Item -ItemType Directory -Force -Path $build | Out-Null

$rtl = Join-Path $repo "rtl\learning\basic_rtl_labs.sv"
$tb = Join-Path $repo "testbench\learning\tb_learning_labs.sv"
$xvlog = Join-Path $VivadoBin "xvlog.bat"
$xelab = Join-Path $VivadoBin "xelab.bat"
$xsim = Join-Path $VivadoBin "xsim.bat"

Push-Location $build
try {
  & $xvlog -sv $rtl $tb
  if ($LASTEXITCODE -ne 0) { throw "xvlog failed with exit code $LASTEXITCODE" }

  & $xelab tb_learning_labs -snapshot tb_learning_labs -debug typical --mt $Threads
  if ($LASTEXITCODE -ne 0) { throw "xelab failed with exit code $LASTEXITCODE" }

  & $xsim tb_learning_labs -runall
  if ($LASTEXITCODE -ne 0) { throw "xsim failed with exit code $LASTEXITCODE" }
} finally {
  Pop-Location
}


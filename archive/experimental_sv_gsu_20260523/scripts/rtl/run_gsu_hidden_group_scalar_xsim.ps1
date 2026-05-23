param(
  [string]$VivadoBin = "C:\Xilinx\Vivado\2023.2\bin",
  [string]$BuildDir = "build\rtl\gsu_hidden_group_scalar_xsim",
  [int]$Threads = 8
)

$ErrorActionPreference = "Stop"
$repo = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$build = Join-Path $repo $BuildDir
New-Item -ItemType Directory -Force -Path $build | Out-Null

$pkg = Join-Path $repo "rtl\gsu\gsu_q610_pkg.sv"
$rtl = Join-Path $repo "rtl\gsu\gsu_hidden_group_scalar_bb.sv"
$tb = Join-Path $repo "testbench\rtl\tb_gsu_hidden_group_scalar_bb.sv"
$xvlog = Join-Path $VivadoBin "xvlog.bat"
$xelab = Join-Path $VivadoBin "xelab.bat"
$xsim = Join-Path $VivadoBin "xsim.bat"
$xcrg = Join-Path $VivadoBin "xcrg.bat"

Push-Location $build
try {
  & $xvlog -sv $pkg $rtl $tb
  if ($LASTEXITCODE -ne 0) { throw "xvlog failed with exit code $LASTEXITCODE" }

  & $xelab tb_gsu_hidden_group_scalar_bb -snapshot tb_gsu_hidden_group_scalar_bb -debug typical --mt $Threads --cc_type sbct --cc_db gsu_hidden_group_scalar --cc_dir codecov
  if ($LASTEXITCODE -ne 0) { throw "xelab failed with exit code $LASTEXITCODE" }

  & $xsim tb_gsu_hidden_group_scalar_bb -runall
  if ($LASTEXITCODE -ne 0) { throw "xsim failed with exit code $LASTEXITCODE" }

  & $xcrg -cc_db gsu_hidden_group_scalar -cc_dir codecov -cc_report codecov_report -report_format text -log xcrg.log
  if ($LASTEXITCODE -ne 0) { throw "xcrg failed with exit code $LASTEXITCODE" }
} finally {
  Pop-Location
}

# Batch-decompile every class in one or more .u packages to <OutRoot>\<Package>\Classes\<Class>.uc.
# Each class file gets its own decompile followed by every sub-object it owns (WeaponParams
# layouts, FireParams, RecoilParams, AimParams, *EffectParams, ...), which UELib otherwise only
# prints as references. Same environment as decompile.ps1 (Windows PowerShell 5.1).
#   powershell.exe -NoProfile -ExecutionPolicy Bypass -File decompile_all.ps1 <OutRoot> <pkg1.u> [<pkg2.u> ...]
param([Parameter(Mandatory)] $OutRoot, [Parameter(Mandatory, ValueFromRemainingArguments)] [string[]] $Packages)
$ErrorActionPreference = 'Stop'
$ue = "C:\Program Files (x86)\EliotVU\UE Explorer"
$a = [Reflection.Assembly]::LoadFrom("$ue\Eliot.UELib.dll")
$ptype = $a.GetType("UELib.Types.PropertyType")

$f = [UELib.UnrealConfig].GetField("VariableTypes")
$f.SetValue($null, [Activator]::CreateInstance($f.FieldType))
$vt = $f.GetValue($null)
foreach ($line in Get-Content "$PSScriptRoot\vartypes.txt") {
  $g, $t = $line.Split(':'); $v = $g.Substring($g.LastIndexOf('.') + 1)
  if (-not $vt.ContainsKey($v)) { $vt.Add($v, [Tuple]::Create([string]$g, [Enum]::Parse($ptype, $t))) }
}
$utf8 = New-Object System.Text.UTF8Encoding($false)

foreach ($pkgPath in $Packages) {
  $sw = [Diagnostics.Stopwatch]::StartNew()
  $p = [UELib.UnrealLoader]::LoadPackage($pkgPath, [IO.FileAccess]::Read)
  $p.NTLPackage = New-Object UELib.NativesTablePackage
  $p.NTLPackage.LoadPackage("$ue\Native Tables\NativesTableList_UT2004")
  $p.InitializePackage([UELib.UnrealPackage+InitFlags]::All) | Out-Null

  $name = [IO.Path]::GetFileNameWithoutExtension($pkgPath)
  $dir = Join-Path $OutRoot "$name\Classes"
  New-Item -ItemType Directory -Force $dir | Out-Null

  $subs = @{}
  foreach ($o in $p.Objects) {
    if ($o.GetType().Name -eq 'UnknownObject' -and $o.Outer) {
      $k = [Runtime.CompilerServices.RuntimeHelpers]::GetHashCode($o.Outer)
      if (-not $subs.ContainsKey($k)) { $subs[$k] = New-Object Collections.ArrayList }
      [void]$subs[$k].Add($o)
    }
  }

  $n = 0; $errs = 0
  foreach ($c in ($p.Objects | ? { $_.GetType().Name -eq 'UClass' -and ("" + $_.Outer) -like "$name*" })) {
    $sb = New-Object Text.StringBuilder
    try { [void]$sb.AppendLine($c.Decompile()) } catch { [void]$sb.AppendLine("// DECOMPILE ERROR: $_"); $errs++ }
    $k = [Runtime.CompilerServices.RuntimeHelpers]::GetHashCode($c)
    if ($subs.ContainsKey($k)) {
      [void]$sb.AppendLine("`n// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====")
      foreach ($s in $subs[$k]) {
        try { [void]$sb.AppendLine($s.Decompile()) } catch { [void]$sb.AppendLine("// DECOMPILE ERROR ($($s.Name)): $_"); $errs++ }
      }
    }
    [IO.File]::WriteAllText((Join-Path $dir "$($c.Name).uc"), $sb.ToString(), $utf8)
    $n++
  }
  "{0}: {1} classes, {2} errors, {3:N0}s" -f $name, $n, $errs, $sw.Elapsed.TotalSeconds
}

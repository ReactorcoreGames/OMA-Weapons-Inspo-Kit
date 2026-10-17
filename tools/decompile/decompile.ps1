# Decompile objects from a UT2004 .u package with UE Explorer's UELib, using the UT2004
# natives table (readable operators instead of __NFUN_xxx__) and vartypes.txt (so dynamic
# arrays in defaultproperties, e.g. WeaponParams Layouts/FireParams, are actually decoded).
#
# Must run under Windows PowerShell 5.1 (UELib targets .NET Framework 4.8):
#   powershell.exe -NoProfile -ExecutionPolicy Bypass -File decompile.ps1 <package.u> <list|dump> <wildcard>
# Examples:
#   ... decompile.ps1 "C:\01 QBay\ut2004\BallisticProV55.u" list "*M806*"
#   ... decompile.ps1 "C:\01 QBay\ut2004\BallisticProV55.u" dump "*M806WeaponParamsTactical*"
# The wildcard matches an object's name or its outer (so a params class pulls in its sub-objects).
param($Pkg, $Mode, $Pattern)
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

$p = [UELib.UnrealLoader]::LoadPackage($Pkg, [IO.FileAccess]::Read)
$p.NTLPackage = New-Object UELib.NativesTablePackage
$p.NTLPackage.LoadPackage("$ue\Native Tables\NativesTableList_UT2004")
$p.InitializePackage([UELib.UnrealPackage+InitFlags]::All) | Out-Null

$hits = $p.Objects | ? { ("" + $_.Name) -like $Pattern -or ("" + $_.Outer) -like $Pattern }
if ($Mode -eq 'list') {
  $hits | % { "{0} | {1} | outer={2}" -f $_.GetType().Name, $_.Name, $_.Outer }
} else {
  foreach ($o in $hits) {
    if ($o.GetType().Name -eq 'UTextBuffer') { continue }  # ScriptText duplicates the class output
    "// === {0} {1} (outer={2})" -f $o.GetType().Name, $o.Name, $o.Outer
    try { $o.Decompile() } catch { "// ERR: $_" }
  }
}

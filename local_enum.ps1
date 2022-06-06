Write-Host ------------------------ ENUMERATION SCRIPT ----------------------------
Write-Host --------------Local Enumeration for: $env:COMPUTERNAME-----------------------------
Write-Host ------------------------------------------------------------------------

Get-ComputerInfo CsDNSHostName,CsDomain,OsName,OsVersion,OsBuildNumber,OsHardFixes,OsHardwareAbstractionLayer,WindowsVersion,BiosSMBIOSBIOSVersion

Write-Host ------- Installed Software:
Get-WmiObject win32_product | Select-Object Name,Version,PackageName,InstallDate | Format-Table

Write-Host ------- Installed Anti-Virus:
try
{
    Get-WmiObject -Namespace "root\SecurityCenter2" -Class AntiVirusProduct -ErrorAction Stop
}
catch
{
    Write-Warning "[ERROR] invalid namespace [$($computer)] : $_"
    $noantivirus+=$computer
}
$noantivirus

Write-Host ------- Windows Defender Info:
Get-MpComputerStatus

net users
net localgroup

Write-Host ------------ Done !!














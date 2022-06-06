param($ip_network, $ip_range)

$ping = New-Object System.Net.NetworkInformation.Ping

$ip_range | ForEach-Object {$ping.Send("$ip_network$_",1000)} | Select-Object Address,Status
#.\netDisc.ps1 -ip_network 192.168.1. -ip_range (9..13) | Format-List

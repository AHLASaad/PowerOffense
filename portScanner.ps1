param($port_range, $ip_network, $ip_range)

$tcp_client = New-Object System.Net.Sockets.TcpClient
$tcp_client.SendTimeout = 50

#$port_range = 443..444
#$ip_network = "192.168.1."
#$ip_range = 10..12
ForEach ($host_ip in $ip_range){
	$current_ip = "$ip_network$host_ip"
	Write-Host "Scanning Host: $current_ip"
	$port_range | ForEach-Object {echo ($tcp_client.Connect($current_ip,$_)) "Port $_ is open!"} 2>$null
}
#.\port-scanner.ps1 -ip_network 192.168.1. -ip_range (10..12) -port_range(79..81)
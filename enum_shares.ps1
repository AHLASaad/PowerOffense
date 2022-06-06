param($ip_network, $ip_range)


#$ip_network = "192.168.1."
#$ip_range = 12,13

$ping = New-Object System.Net.Networkinformation.ping

$results = $ip_range | ForEach-Object {$ping.Send("$ip_network$_",1000)} | Select-Object Address,Status
$live_hosts = $results | Where-Object {$_.Status -eq "Success"}

ForEach ($target in $live_hosts){
	$dns_name = Resolve-DnsName $target.Address 2>$null
	(net view $dns_name.NameHost) 2>$null
}

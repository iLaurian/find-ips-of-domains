###you'll need to change the path for the get-content and export-csv locations

$result=@()
Get-Content C:\Users\_____\Desktop\domainslist.csv | %{
$start_name = $_

$conn = Test-Connection $_ -count 1 -ErrorAction SilentlyContinue

if($conn)
{
  $dns_ip = ($conn.IPV4Address).IPAddressToString
}
else
{
  $dns_ip = $null
}
$HostObj = New-Object PSObject -Property @{
									Domain    = $start_name
		        					IP      = $dns_ip   
		        		}
$result += $HostObj						
}
$result | Export-Csv C:\Users\______\Desktop\result.csv -NoTypeInformation
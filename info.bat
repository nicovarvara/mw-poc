@echo off
setlocal
wmic useraccount get /ALL /format:csv > info.txt
wmic process get caption,executablepath,commandline /format:csv >> info.txt
wmic qfe get description,hotfixid,installedOn,ServicePackInEffect /format:csv >> info.txt
wmic cup get name >> info.txt
wmic MEMPHYSICAL get MaxCapacity >> info.txt
wmic baseboard get product >> info.txt
wmic baseboard get version >> info.txt
wmic bios get SMBIOSBIOSVersion >> info.txt
wmic OS get Caption,OSArchitecture,Version >> info.txt
wmic DISKDRIVE get Caption >> info.txt
echo "finished"
timeout 5 
endlocal

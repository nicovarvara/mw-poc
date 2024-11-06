@echo off
setlocal

start cmd /k "(
wmic useraccount get /ALL /format:csv > info.txt &&
wmic process get caption,executablepath,commandline /format:csv >> info.txt &&
wmic qfe get description,hotfixid,installedOn,ServicePackInEffect /format:csv >> info.txt &&

echo "finished"
timeout 5 
")
endlocal

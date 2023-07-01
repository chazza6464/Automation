powershell.exe -Command "Invoke-WebRequest -Uri https://github.com/chazza6464/Automation/raw/main/Microsoft%20365/Windows%20Autopilot/Configure-WindowsAutopilot.ps1 -OutFile .\Configure-WindowsAutopilot.ps1" & cls
powershell.exe -ExecutionPolicy Bypass -File .\Configure-WindowsAutopilot.ps1
pause
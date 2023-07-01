powershell.exe -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/chazza6464/Automation/main/Microsoft%20365/WindowsConfigure-WindowsAutopilot.ps1 -OutFile .\Configure-WindowsAutopilot.ps1" & cls
powershell.exe -ExecutionPolicy Bypass -File .\Configure-WindowsAutopilot.ps1
pause
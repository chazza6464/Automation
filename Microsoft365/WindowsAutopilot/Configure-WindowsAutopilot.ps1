#region     Self-Elevation
    # Get the ID and security principal of the current user account
    $MyWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
    $MyWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($MyWindowsID)

    # Get the security principal for the Administrator role
    $AdminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator

    # Check to see if we are currently running "as Administrator"
    if ($MyWindowsPrincipal.IsInRole($AdminRole)) {
        # We are running "as Administrator" - so change the title and background color to indicate this
        $Host.UI.RawUI.WindowTitle = $MyInvocation.MyCommand.Definition + "(Elevated)"
        $Host.UI.RawUI.BackgroundColor = "DarkBlue"
        Clear-Host
    } else {
        # We are not running "as Administrator" - so relaunch as administrator

        # Create a new process object that starts PowerShell
        $NewProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";

        # Specify the current script path and name as a parameter
        $NewProcess.Arguments = $MyInvocation.MyCommand.Definition;

        # Indicate that the process should be elevated
        $NewProcess.Verb = "runas";

        # Start the new process
        [System.Diagnostics.Process]::Start($NewProcess);

        # Exit from the current, unelevated, process
        exit
    }
#endregion  Self-Elevation

# Get Autopilot Group Name
$Group = Read-Host "Enter the name of the Azure AD group to add to. Leave blank if necessary"

# Install Autopilot script
Install-Script Get-WindowsAutoPilotInfo.ps1

# Set Execution Policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# Create Folder
New-Item -Path C:\HWID -ItemType Directory

# Run Script
if ($Group -notlike "") {
    Get-WindowsAutoPilotInfo.ps1 -OutputFile C:\HWID\WindowsAutopilotInfo.csv -AddToGroup $Group -Online
} else {
    Get-WindowsAutoPilotInfo.ps1 -OutputFile C:\HWID\WindowsAutopilotInfo.csv
}
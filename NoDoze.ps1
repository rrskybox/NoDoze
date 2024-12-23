#
# NoDoze.ps1
#
Write Host "Attempting to elevate to Administrative Mode"
# Self-elevate the script if required
    if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
      # Write Host "User is not running as Administrator     
      if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
      $CommandLine = "-NoExit " +"-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
      Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
      Write Host "Failed to elevate to Administrative mode"
      Exit
     }
    }
Write Host "Entering Administrative Mode"
Write Host "List of power managed devices prior to disabling power management"
Get-CimInstance -ClassName MSPower_DeviceEnable -Namespace root/WMI
Write Host "Disabling Power Management"
Get-CimInstance -ClassName MSPower_DeviceEnable -Namespace root/WMI |
Set-CimInstance -Property @{Enable = $false}
Write Host "List of power managed devices after disabling power management"
Get-CimInstance -ClassName MSPower_DeviceEnable -Namespace root/WMI

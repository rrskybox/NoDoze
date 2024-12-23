NoDoze is a PowerShell script that disables Power Management on all computer devices.

The script is intented to support real-time data acquisition systems whose devices may
appear inactive for long periods of time.  If Power Management is enabled on these devices,
primarily USB, then communications may be shut down and the device connection fail.
Astronomical image acquistion systems are one such example.

This script requires that the user have administrative privileges, but does not require
the script to be launched in administrative mode.  The script self-elevates.

To install, copy the NoDoze.ps1 script to a folder, semi-preferably the Desktop.
Right click on the script and select "Open with PowerShell" then allow requested priveledges
as prompted.

The script will list the power management status for all active devices (second column),
then disable power management for all devices and show results.

Type "exit" or close.

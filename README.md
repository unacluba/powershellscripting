# powershellscripting
**Scripts summary:**

_CaptureComputerInfo.ps1_ is used to gather some information from a computer, such as the Windows edition.

_CheckUpdates.ps1_ is used to get information about the installed Windows Updates on the machine. Commented out an option to only display the latest installed update.

_GetLocalDrives.ps1_ can be used to view information of local drives, network drive mappings.

_Get-Whoami.ps1_ gathers some information about the logged on user: username, group membership and privileges.

_Defender for identity setup.ps1_

This script involves several steps you need to perform to get your Defender for Identity setup running.

1) Configuring the KDS root key
2) Testing the root key configuration
3) Creating a Group Service Managed Account (GSMA) for the Defender for Identity service and setting some variables
4) Checks the GSMA settings
5) Enables the AD Recycle Bin if needed. 
6) Sets permissions on the Recycle Bin for the GSMA

You also need to configure some group policy settings to audit some events (such as NTLM). These are not included in this script.

## The rootkey takes several hours to replicate. In a lab environment you can use the -EffectiveTime parameter to have it enabled immediately. Do not use this in production.

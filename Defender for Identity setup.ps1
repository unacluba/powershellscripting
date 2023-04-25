# Set domain variables

# Create KDS root key ---- replication takes 10+ hours, you can't create the ADServiceAccount directly after creating the KDS root key ---
Add-KdsRootKey -EffectiveImmediately
# FOR TESTING PURPOSES 
Add-KdsRootKey –EffectiveTime ((get-date).addhours(-10))    
# Validate KDS rootkey
Get-KDSRootKey
Get-KDSConfiguration
# Create gMSA
New-ADServiceAccount -Name MDIGMSA -DNSHostName MDIGMSA.YOURDOMAIN.local –Description "Microsoft Defender for Identity service account" –KerberosEncryptionType AES256 –ManagedPasswordIntervalInDays 30

# Allow GSMA to retrieve password 
# User a $ sign at the end of each hostname
Set-ADServiceAccount -Identity MDIGSMA -PrincipalsAllowedToRetrieveManagedPassword SERVERNAME01$


# Get gMSA details

Get-ADServiceAccount MDIGMSA -Properties * | fl DNSHostName, SamAccountName, KerberosEncryptionType, ManagedPasswordIntervalInDays, PrincipalsAllowedToRetrieveManagedPassword

# Validate gSMA permissions

Test-ADServiceAccount -Identity 'MDIGMSA'

# Enable recycle bin

Enable-ADOptionalFeature -Identity 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target (Get-ADDomain).DNSRoot -Confirm:$false

# Configure permissions (CHANGE THE USERNAME IN THE SECOND LINE)

dsacls "CN=Deleted Objects,$((Get-ADDomain).DistinguishedName)" /takeownership
dsacls "CN=Deleted Objects,$((Get-ADDomain).DistinguishedName)" /g "$((Get-ADDomain).NetBIOSName)\<gmsaaccountname>`$:LCRP"
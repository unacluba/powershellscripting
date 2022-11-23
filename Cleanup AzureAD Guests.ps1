# Install AzureAD module
# Install-AzureAD
# Update-AzureAD

# Connect to Azure
Connect-AzureAD

# Get all guest users in AzureAD

Get-AzureADUser -Filter "UserType eq 'Guest'" | select DisplayName, Mail

# Get all guest users without an accepted guest invite

Get-AzureADUser -Filter "UserState eq 'PendingAcceptance'" | Format-List -Property DisplayName,UserPrincipalName,UserState,UserStateChangedOn

# Delete all guest users without an accepted guest invite

Get-AzureADUser -Filter "UserState eq 'PendingAcceptance'" | Remove-AzureADUser
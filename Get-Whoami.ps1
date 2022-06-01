function Get-Whoami
{   
    Write-Host 'Showing group membership =============================================================='
    whoami /groups /fo CSV | ConvertFrom-Csv | Select-Object 'Group Name', 'SID'
    Write-Host 'The username is =============================================================='
    whoami /user /fo CSV
    Write-Host 'Showing privileges =============================================================='
    whoami /priv /fo CSV | ConvertFrom-Csv
}
get-whoami | Format-List * 

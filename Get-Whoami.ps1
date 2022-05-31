$Filters = 'Group Name','SID'
function Get-Whoami
{
    whoami /groups | Out-File -path C:\temp\WhoaAmi.csv -Append | ConvertFrom-Csv | Select-Object -ExpandProperty [string]$Filters
    whoami | Out-File -path C:\temp\WhoaAmi.csv -Append
    whoami /priv | Out-File -path C:\temp\WhoaAmi.csv -Append
}

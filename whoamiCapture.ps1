$UserInfo = whoami
$UserGroupInfo = whoami /groups
$UserPrivInfo = whoami /priv

$Userinfo, $UserGroupInfo, $UserPrivinfo | Out-File C:\Temp\WhoaAmi.csv 


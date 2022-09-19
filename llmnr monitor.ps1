$LLMNR = Resolve-DnsName -LlmnrOnly PleaseSubscribe 2> $null
if ($LLMNR) {
    $IP = $LLMNR.IpAddress -Join ", "
    $Message = "Hostname: ${env:computername} `nRogue LLMNR Server: $IP"
    $Body = ConvertTo-Json @{
        Username = "Bot"
        Pretext = "Responder Detected!"
        Text=$Message
        icon_emoji="ghost"
}
Invoke-RestMethod https://<slackurl> -Method Post -Body $Body -ContentType 'application/json'
}
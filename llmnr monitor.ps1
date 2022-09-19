$LLMNR = Resolve-DnsName -LlmnrOnly PleaseSubscribe 2> $null
if ($LLMNR) {
    $IP = $LLMNR.IpAddress -Join ", "
    $Message = "Hostname: ${env:computername} `nRogue LLMNR Server: $IP"
    # Slack message settings
    #$Body = ConvertTo-Json @{
     #   Username = "Bot"
     #   Pretext = "Responder Detected!"
     #   Text=$Message
     #   icon_emoji="ghost"

# Write to Windows EventLog
Write-EventLog -LogName Application -Source ResponderPot -EventId 9001 -Message $Message -EntryType Warning
}

# Write to Slack
#Invoke-RestMethod https://<slackurl> -Method Post -Body $Body -ContentType 'application/json'

# }
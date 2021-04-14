$azSubs = Get-AzSubscription | Where-Object  {$_.Name -LIKE "headquarters-dev-001"}
Set-AzContext $azSubs.id

$time = Get-Date -UFormat "%A %m/%d/%Y %R"
$foregroundColor1 = "Red"
$writeEmptyLine = "`n"
$writeSeperator = " - "

$actionGroupName = "email-ag"
$resourceGroupName = "myResourceGroup"
$actionGroupShortName = $actionGroupName


$email1 = New-AzureRmActionGroupReceiver -Name 'user1' `
                                         -EmailReceiver `
                                         -EmailAddress '9283848@gmail.com' `

$sms1   = New-AzureRmActionGroupReceiver -Name 'user2' `
                                         -SmsReceiver  `
                                         -CountryCode '1'  `
                                         -PhoneNumber '111-111-11575'

Set-AzureRmActionGroup -Name $actionGroupName  `
                       -ResourceGroup $resourceGroupName  `
                       -ShortName $actionGroupShortName  `
                       -Receiver $email1,$sms1

Write-Host ($writeEmptyLine + "# Action Group $actionGroupName created" + $writeSeperator + $time)`
                       -foregroundcolor $foregroundColor1 $writeEmptyLine

## View available action groups
 
Get-AzureRmActionGroup | Select-Object Name
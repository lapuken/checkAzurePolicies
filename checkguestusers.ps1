# Script to find Guest User Accounts in an Office 365 Tenant that are older than 365 days and the groups they belong to
# Find guest accounts
$GuestAccountAge = 1 # Value used for guest age comparison. If you want this to be a different value (like 30 days), change this here.
$GuestUsers = Get-AzureADUser -All $true -Filter "UserType eq 'Guest'" | Sort DisplayName
$Today = (Get-Date); $StaleGuests = 0
$Report = [System.Collections.Generic.List[Object]]::new()
# Check each account and find those over 365 days old
ForEach ($Guest in $GuestUsers) {
   $AADAccountAge = ($Guest.RefreshTokensValidFromDateTime | New-TimeSpan).Days
   If ($AADAccountAge -gt $GuestAccountAge) {
      $StaleGuests++
      Write-Host "Processing" $Guest.DisplayName
      $i = 0; $GroupNames = $Null
      # Find what Microsoft 365 Groups the guest belongs to... if any
      $DN = (Get-Recipient -Identity $Guest.UserPrincipalName).DistinguishedName 
      $GuestGroups = (Get-Recipient -Filter "Members -eq '$Dn'" -RecipientTypeDetails GroupMailbox | Select DisplayName, ExternalDirectoryObjectId)
      If ($GuestGroups -ne $Null) {
         ForEach ($G in $GuestGroups) { 
           If ($i -eq 0) { $GroupNames = $G.DisplayName; $i++ }
         Else 
           {$GroupNames = $GroupNames + "; " + $G.DisplayName }
      }}
      $ReportLine = [PSCustomObject]@{
           UPN     = $Guest.UserPrincipalName
           Name    = $Guest.DisplayName
           Age     = $AADAccountAge
           Created = $Guest.RefreshTokensValidFromDateTime  
           Groups  = $GroupNames
           DN      = $DN}
     $Report.Add($ReportLine) }
}
$Report | Sort Name | Export-CSV -NoTypeInformation .\OldGuestAccounts.csv
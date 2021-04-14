$azSubs = Get-AzSubscription | Where-Object  {$_.Name -LIKE "headquarters-dev-001"}
Set-AzContext $azSubs.id

Get-AzureRmPolicyDefinition | Select -ExpandProperty "Properties" | Where-Object { $_.DisplayName -eq 'Ensure default network access rule for Storage Accounts is set to deny'}
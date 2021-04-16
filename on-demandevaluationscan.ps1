$azSubs = Get-AzSubscription | Where-Object  {$_.Name -LIKE "headquarters-dev-001"}
Set-AzContext $azSubs.id

$job = Start-AzPolicyComplianceScan -AsJob

Get-AzureRmPolicyDefinition | Select -ExpandProperty "Properties" | Where-Object { $_.DisplayName -eq 'An activity log alert should exist for specific Administrative operations'}
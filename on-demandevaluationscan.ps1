$azSubs = Get-AzSubscription | Where-Object  {$_.Name -LIKE "headquarters-dev-001"}
Set-AzContext $azSubs.id

$job = Start-AzPolicyComplianceScan -AsJob
# Login with Connect-AzAccount if not using Cloud Shell
#Connect-AzAccount

# Get all Azure Subscriptions
# $azSubs = Get-AzSubscription
$azSubs = Get-AzSubscription | Where-Object  {$_.Name -LIKE "*Azure*"}

# Set array
$azPolicy = @()

# Loop through all Azure Subscriptions
foreach ($azSub in $azSubs) {
    Set-AzContext $azSub.id | Out-Null

$nonCompliantResources = Get-AzPolicyState | Where-Object {$_.ResourceGroup -ne ""}

# Loop through each non-compliant Azure resource to get the details
foreach ($resource in $nonCompliantResources) {
    $resourceName     = $resource.resourceId.Split('/')[-1]
    $resourceType     = $resource.ResourceType
    $complianceState  = $resource.complianceState
    $resourceGroup    = $resource.resourceGroup
    $resourceLocation = $resource.resourceLocation
    $PolicyDefinitionReferenceId = $resource.PolicyDefinitionReferenceId
    $azPolicy += @($("Resource Name: " + $resourceName), ("Resource Type: " + $resourceType), `
              ("Compliance State: " + $complianceState), ("Resource Group: " + $resourceGroup), `
              ("Policy Initiative: " + $PolicyDefinitionReferenceId), `
              ("Resource Location: " + $resourceLocation), ("Subscription Name: " + $azSub.Name))

    $azPolicy += @(" ")
}

# Save non-compliant report for each Azure Subscription
        $azSubName = $azSub.Name
        $azPolicy > .\$azSubName.csv
}
# Get all Resourcesgroups
# $azSubs = Get-AzSubscription
#$ azSubs = Get-AzSubscription | Where-Object  {$_.Name -LIKE "*Azure*"}
$azRGs = Get-AzResourceGroup
$azCloudStorageGroup = "cloud-shell-storage-eastus"
$azPhwanyani         = "Do not Delete this resource"

# Loop through all Azure Subscriptions
foreach ($azRG  in $azRGs ) {

    Set-AzContext $azRG.ResourceId | Out-Null

    $azRGName =  $azRG.ResourceGroupName

    #skip the storage drive group
    if ($azRGName -ne $azCloudStorageGroup)
        {
            Write-Output –InputObject $azPhwanyani
        }
    else
        {
            Write-Output –InputObject $azRGName
        }
}





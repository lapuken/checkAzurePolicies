# By Khido

# Get all Resourcesgroups
# $azSubs = Get-AzSubscription
#$ azSubs = Get-AzSubscription | Where-Object  {$_.Name -LIKE "*Azure*"}


$azCloudStorageGroup = "cloud-shell-storage-eastus"
$azPhwanyani         = "Do not Delete this resource"

# Delete resources in all subscriptions
#$Subs = (get-AzureRMSubscription).ID

# Delete resources in named subscriptions
$Subs = Get-AzSubscription | Where-Object  {$_.Name -LIKE "*Prod*"}

#Loop through the subscriptions to  and store them in $Subs
ForEach ($sub in $Subs)
    {
        Select-AzureRmSubscription -SubscriptionId $Sub
        $AllRGs = (Get-AzureRmResourceGroup).ResourceGroupName

        forEach ($AllRG in $AllRGs) {
            if ( $AllRG  -eq $azCloudStorageGroup ) {
                Write-Host "Do not Delete this " $AllRG  "Resource Group"
            }
            else {
                Write-Host "Please Delete this " $AllRG  "Resource Group"
                Remove-AzureRmResourceGroup -Name $AllRG -Force -AsJob
            }
        }
    }
# By khido
# Insert subscriptions into array
$azSubs = Get-AzSubscription | Where-Object -Property Name -in -value "rk-dev-sub"

# Loop through Subscription array
foreach ($azSub in $azSubs) {

    Set-AzContext $azSub.id | Out-Null

    $ASBparam = '{ "azureCacheForRedisShouldResideWithinAVirtualNetworkMonitoringEffect"                  : { "value": "Deny" },
                   "azureCosmosDBAccountsShouldHaveFirewallRulesMonitoringEffect"                         : { "value": "Deny" },
                   "azureCacheForRedisShouldResideWithinAVirtualNetworkMonitoringEffect"                  : { "value": "Deny" },
                   "azureSpringCloudShouldUseNetworkInjectionMonitoringEffect"                            : { "value": "Deny" },
                   "publicNetworkAccessShouldBeDisabledForCognitiveServicesAccountsMonitoringEffect"      : { "value": "Deny" },
                   "cognitiveServicesAccountsShouldRestrictNetworkAccessMonitoringEffect"                 : { "value": "Deny" },
                   "publicNetworkAccessOnAzureSQLDatabaseShouldBeDisabledMonitoringEffect"                : { "value": "Deny" },
                   "azureCacheForRedisShouldResideWithinAVirtualNetworkMonitoringEffect"                  : { "value": "Deny" },
                   "storageAccountsShouldRestrictNetworkAccessUsingVirtualNetworkRulesMonitoringEffect"   : { "value": "Deny" },
                   "webApplicationFirewallShouldBeEnabledForApplicationGatewayMonitoringEffect"           : { "value": "Deny" },
                   "webApplicationFirewallShouldBeEnabledForAzureFrontDoorServiceServiceMonitoringEffect" : { "value": "Deny" }

                    }'
    
    #assign parameters above to the initiative id below
    Set-AzPolicyAssignment  -Name "9a8e361804b24212abfd6d92" `
                            -PolicyParameter  $ASBparam

}



# Get a reference to the Management group that is the scope of the assignment

######### POLICIES FOR SUBSCRIPTION SUB-CMS-IT

$mg = Get-AzSubscription | Where-Object  {$_.Name -LIKE "sub-cms-IT"}
$mg = "/subscriptions/$($mg.Id)"
$policyparam = '{ "listOfAllowedLocations": { "value": ["EastUS"] } }'

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Allowed locations' }

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'allowed-locations' `
                       -DisplayName 'Deny resource deployment outside EastUSA' `
                       -Scope $mg `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam

# Get the policy that should be exempted
$Assignment = Get-AzPolicyAssignment -Name 'allowed-locations'

# Create the Exemption
New-AzPolicyExemption -Name 'AllowedLocationsExemption' `
                      -PolicyAssignment $Assignment `
                      -Scope $mg `
                      -ExemptionCategory Waiver

# Kubernetes cluster containers should only use allowed images

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Kubernetes cluster containers should only use allowed images' }
$policyparam = '{ "effect" : { "value": "audit" },"allowedContainerImagesRegex" : { "value": "^khido$" }}'

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'Allowed images' `
                       -DisplayName 'Kubernetes cluster containers should only use allowed images' `
                       -Scope $mg `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam

##### # Kubernetes cluster containers should only listen on allowed ports

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Kubernetes cluster containers should only listen on allowed ports' }
$policyparam = '{"effect" : { "value": "audit" }, "allowedContainerPortsList" : { "value": [10,1001] }}'

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'Allowed container ports' `
                       -DisplayName 'Kubernetes cluster containers should only use Allowed container ports' `
                       -Scope $mg `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam


##### # Kubernetes cluster services should listen only on allowed ports

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Kubernetes cluster services should listen only on allowed ports' }
$policyparam = '{ "effect" : { "value": "audit" }, "allowedServicePortsList" : { "value": [10,1001] }}'

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'Allowed Service ports' `
                       -DisplayName 'Kubernetes cluster services should listen only on allowed ports' `
                       -Scope $mg `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam


######### POLICIES FOR SUBSCRIPTION HEADQUARTERS-DEV-001

$mg = Get-AzSubscription | Where-Object  {$_.Name -LIKE "headquarters-dev-001"}
$mg = "/subscriptions/$($mg.Id)"
$policyparam = '{ "listOfAllowedLocations": { "value": ["EastUS"] } }'

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Allowed locations' }

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'allowed-locations' `
                       -DisplayName 'Deny resource deployment outside EastUSA' `
                       -Scope $mg `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam

# Kubernetes cluster containers should only use allowed images

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Kubernetes cluster containers should only use allowed images' }
$policyparam = '{ "effect" : { "value": "audit" },"allowedContainerImagesRegex" : { "value": "^khido$" }}'

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'Allowed images' `
                       -DisplayName 'Kubernetes cluster containers should only use allowed images' `
                       -Scope $mg `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam

##### # Kubernetes cluster containers should only listen on allowed ports

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Kubernetes cluster containers should only listen on allowed ports' }
$policyparam = '{"effect" : { "value": "audit" }, "allowedContainerPortsList" : { "value": [10,1001] }}'

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'Allowed container ports' `
                       -DisplayName 'Kubernetes cluster containers should only use Allowed container ports' `
                       -Scope $mg `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam


##### # Kubernetes cluster services should listen only on allowed ports

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Kubernetes cluster services should listen only on allowed ports' }
$policyparam = '{ "effect" : { "value": "audit" }, "allowedServicePortsList" : { "value": [10,1001] }}'

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'Allowed Service ports' `
                       -DisplayName 'Kubernetes cluster services should listen only on allowed ports' `
                       -Scope $mg `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam

######### POLICIES FOR SUBSCRIPTION RK-DEV-SUB

$mg = Get-AzSubscription | Where-Object  {$_.Name -LIKE "rk-dev-sub"}
$mg = "/subscriptions/$($mg.Id)"
$policyparam = '{ "listOfAllowedLocations": { "value": ["EastUS"] } }'

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Allowed locations' }

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'allowed-locations' `
                       -DisplayName 'Deny resource deployment outside EastUSA' `
                       -Scope $mg `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam

# Kubernetes cluster containers should only use allowed images

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Kubernetes cluster containers should only use allowed images' }
$policyparam = '{ "effect" : { "value": "audit" },"allowedContainerImagesRegex" : { "value": "^khido$" }}'

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'Allowed images' `
                       -DisplayName 'Kubernetes cluster containers should only use allowed images' `
                       -Scope $mg `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam

##### # Kubernetes cluster containers should only listen on allowed ports

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Kubernetes cluster containers should only listen on allowed ports' }
$policyparam = '{"effect" : { "value": "audit" }, "allowedContainerPortsList" : { "value": [10,1001] }}'

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'Allowed container ports' `
                       -DisplayName 'Kubernetes cluster containers should only use Allowed container ports' `
                       -Scope $mg `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam


##### # Kubernetes cluster services should listen only on allowed ports

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Kubernetes cluster services should listen only on allowed ports' }
$policyparam = '{ "effect" : { "value": "audit" }, "allowedServicePortsList" : { "value": [10,1001] }}'

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'Allowed Service ports' `
                       -DisplayName 'Kubernetes cluster services should listen only on allowed ports' `
                       -Scope $mg `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam

# Get the policy that should be exempted
$Assignment = Get-AzPolicyAssignment -Name 'allowed-locations'

# Create the Exemption
New-AzPolicyExemption -Name 'AllowedLocationsExemption' `
                      -PolicyAssignment $Assignment `
                      -Scope $mg `
                      -ExemptionCategory Waiver


#Get-AzureRmPolicyDefinition | Select -ExpandProperty "Properties" | Where-Object { $_.DisplayName -like '*Kubernetes cluster containers should only use allowed images*' }
#Get-AzureRmPolicyDefinition | Select -ExpandProperty "Properties" | Where-Object { $_.DisplayName -like '*Kubernetes cluster containers should only listen on allowed ports' }                       
#Get-AzureRmPolicyDefinition | Select -ExpandProperty "Properties" | Where-Object { $_.DisplayName -like 'Kubernetes cluster services should listen only on allowed ports' }
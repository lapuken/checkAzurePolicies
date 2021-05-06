# Get a reference to the Management group that is the scope of the assignment

$mg = Get-AzManagementGroup | Where-Object  {$_.Name -eq "Contoso"}

$policyparam = '{ "listOfAllowedLocations": { "value": ["EastUS"] } }'

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Allowed locations' }

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'allowed-locations' `
                       -DisplayName 'Deny resource deployment outside EastUS' `
                       -Scope $mg.Id `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam

# Kubernetes cluster containers should only use allowed images

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Kubernetes cluster containers should only use allowed images' }
$policyparam = '{ "allowedContainerImagesRegex" : { "value": "^khido$" }}'

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'Allowed images' `
                       -DisplayName 'Kubernetes cluster containers should only use allowed images' `
                       -Scope $mg.Id `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam

##### # Kubernetes cluster containers should only listen on allowed ports

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Kubernetes cluster containers should only listen on allowed ports' }
$policyparam = '{ "allowedContainerPortsList" : { "value": [10,1001] }}'

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'Allowed container ports' `
                       -DisplayName 'Kubernetes cluster containers should only use Allowed container ports' `
                       -Scope $mg.Id `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam


##### # Kubernetes cluster services should listen only on allowed ports

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Kubernetes cluster services should listen only on allowed ports' }
$policyparam = '{ "allowedContainerPortsList" : { "value": [10,1001] }}'

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'Allowed Service ports' `
                       -DisplayName 'Kubernetes cluster services should listen only on allowed ports' `
                       -Scope $mg.Id `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam






#Get-AzureRmPolicyDefinition | Select -ExpandProperty "Properties" | Where-Object { $_.DisplayName -like '*Kubernetes cluster containers should only use allowed images*' }
#Get-AzureRmPolicyDefinition | Select -ExpandProperty "Properties" | Where-Object { $_.DisplayName -like '*Kubernetes cluster containers should only listen on allowed ports' }                       
#Get-AzureRmPolicyDefinition | Select -ExpandProperty "Properties" | Where-Object { $_.DisplayName -like 'Kubernetes cluster services should listen only on allowed ports' }

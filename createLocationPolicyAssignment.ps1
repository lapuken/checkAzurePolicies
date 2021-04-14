# Get a reference to the Management group that is the scope of the assignment

$Authorizedlocation = "EastUS"
$mg = Get-AzManagementGroup | Where-Object  {$_.Name -eq "Contoso"}
$policyparam = '{ "listOfAllowedLocations": { "value": ["EastUS"] } }'

# Get a reference to the built-in policy definition to assign
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Allowed locations' }

# Create the policy assignment with the built-in definition against your management group
New-AzPolicyAssignment -Name 'allowed-locations' `
                       -DisplayName 'Deny resource deployment outside WestUS' `
                       -Scope $mg.Id `
                       -PolicyDefinition $definition `
                       -PolicyParameter $policyparam


Get-AzSubscription
Select-AzSubscription -Subscription "headquarters-prod-001"

#Resource Group
$locationName = "eastus"
$ResourceGroupName = "AZ-RG-DEMO"

# Create Resource Groups and Storage Account for diagnostic
New-AzResourceGroup -Name $ResourceGroupName -Location $locationName

#Virtual Network
$networkName = "AZ-VNET"
$nicName = "NIC-"

$vnet = @{
    Name = $networkName
    ResourceGroupName = $ResourceGroupName
    Location = $locationName
    AddressPrefix = '10.0.0.0/16'
}


$virtualNetwork = New-AzVirtualNetwork @vnet



#$vnet = Get-AzVirtualNetwork -Name $NetworkName -ResourceGroupName $ResourceGroupName

#Virtual Machines
$computerName = @("VM-01","VM-02")
$vmSize = "Standard_B2ms"
$publisherName = "MicrosoftWindowsServer"
$offer = "WindowsServer"
$skus = "2016-Datacenter"

# $credential = Get-Credential

# Create Admin Credentials
$adminUsername = Read-Host 'Admin username'
$adminPassword = Read-Host -AsSecureString 'Admin password with least 12 characters'
$credential   = New-Object PSCredential $adminUsername, $adminPassword

for ($i = 0; $i -le $ComputerName.count -1; $i++){
    Write-Host "Please Delete this Resource Group"
    Write-Host "Please Delete this " $NICName+$ComputerName[$i]  "Resource Group"
}

for ($i = 0; $i -le $ComputerName.count -1; $i++)
{

 $NIC = New-AzNetworkInterface -Name ($NICName+$ComputerName[$i]) -ResourceGroupName $ResourceGroupName   -Location $LocationName -SubnetId $Vnet.Subnets[0].Id

 $VirtualMachine = New-AzVMConfig -VMName $ComputerName[$i] -VMSize $VMSize
 $VirtualMachine = Set-AzVMOperatingSystem -VM $VirtualMachine -Windows -ComputerName $ComputerName[$i] -Credential $Credential -ProvisionVMAgent  -EnableAutoUpdate

 $VirtualMachine = Add-AzVMNetworkInterface -VM $VirtualMachine -Id $NIC.Id
 $VirtualMachine = Set-AzVMSourceImage -VM $VirtualMachine -PublisherName $publisherName -Offer $offer -Skus $skus -Version latest

 New-AzVM -ResourceGroupName $ResourceGroupName -Location $LocationName -VM $VirtualMachine -Verbose
}
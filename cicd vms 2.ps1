[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$resourceGroupName,
    [Parameter(Mandatory=$true)][string]$rgLocation,
    [Parameter(Mandatory=$true)][string]$avsetName,
    [Parameter(Mandatory=$true)][string]$vnetName,
    [Parameter(Mandatory=$true)][string]$vmName1,
    [Parameter(Mandatory=$true)][string]$vmName2,
    [Parameter(Mandatory=$true)][string]$vmSize,
    [Parameter(Mandatory=$true)][string]$subnetName,
    [Parameter(Mandatory=$true)][string]$userName,
    [Parameter(Mandatory=$true)][string]$password,
    [Parameter(Mandatory=$true)][string]$nsgName,
    [Parameter(Mandatory=$true)][string]$osImage
)

$ErrorActionPreference = "Stop"
[Console]::ResetColor()
$scriptName = $MyInvocation.MyCommand.Name

Write-Host "================================================="

Write-Host resourcegroup location is $rgLocation
Write-Host resource group name is $resourceGroupName
Write-Host avsetName name is $avsetName
Write-Host vnet name is $vnetName
Write-Host vm1 name is $vmName1
Write-Host vm2 name is $vmName2
Write-Host vm size is $vmSize
Write-Host subnet name is $subnetName
Write-Host username is $userName
Write-Host password is $password
Write-Host nsg name is $nsgName
Write-Host osImage is $osImage


Write-Host "================================================="


#Checking vm exits or not. if not exists create a vm


if 
{
  

  Write-Host Creating vm

  az vm create --resource-group $resourceGroupName --name $vmName1 --image $osImage --vnet-name $vnetName --subnet $subnetName --admin-username $userName --admin-password $password --size $vmSize --nsg $nsgName --availability-set $avsetName
  az vm create --resource-group $resourceGroupName --name $vmName2 --image $osImage --vnet-name $vnetName --subnet $subnetName --admin-username $userName --admin-password $password --size $vmSize --nsg $nsgName --availability-set $avsetName  
}
else {
    
}



# =============================================================================

Write-Host "-----------------------------------------------" 
Write-Host " -- Script finished ($scriptName)"
Write-Host ""
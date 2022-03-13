#param(
#[Parameter(Mandatory=$true)][string]$resourceGroupName,
#[Parameter(Mandatory=$true)][string]$rgLocation
#)

#$ErrorActionPreference = "Stop"
#[Console]::ResetColor()
#$scriptName = $MyInvocation.MyCommand.Name

Write-Host "================================================="

Write-Host resourcegroup location is $rgLocation
Write-Host resource group name is $resourceGroupName

Write-Host "================================================="


#Checking resourceGroup exits or not. if not exists create a resource group


if ($resourceGroupStatus -eq $null)
{
  Write-Host resourceGroup $resourceGroupName not exists 

  Write-Host Creating resource group

  New-AzResourceGroup -Name $resourceGroupName -Location $rgLocation
$subnet1 = New-AzVirtualNetworkSubnetConfig -Name subnet1 -AddressPrefix "10.0.1.0/24"
$subnet2  = New-AzVirtualNetworkSubnetConfig -Name subnet2  -AddressPrefix "10.0.2.0/24"
New-AzVirtualNetwork -Name supernetwork -ResourceGroupName $resourceGroupName -Location $rgLocation -AddressPrefix "10.0.0.0/16" -Subnet $subnet1,$subnet2
  
}
else {
    write-host resourceGroup $resourceGroupName already exists
}

Write-Output $resourceGroupStatus

# =============================================================================

Write-Host "-----------------------------------------------" 
Write-Host " -- Script finished ($scriptName)"
Write-Host ""
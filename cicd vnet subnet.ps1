[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$resourceGroupName,
    [Parameter(Mandatory=$true)][string]$rgLocation,
    [Parameter(Mandatory=$true)][string]$vnetName,
    [Parameter(Mandatory=$true)][string]$vnet_iprange,
    [Parameter(Mandatory=$true)][string]$subnetName,
    [Parameter(Mandatory=$true)][string]$sub_iprange
)

$ErrorActionPreference = "Stop"
[Console]::ResetColor()
$scriptName = $MyInvocation.MyCommand.Name

Write-Host "================================================="

Write-Host resourcegroup location is $rgLocation
Write-Host resource group name is $resourceGroupName
Write-Host vnet name is $vnetName
Write-Host vnet_iprange is $vnet_iprange
Write-Host subnet name is $subnetName
Write-Host subnet-iprange is $sub_iprange

Write-Host "================================================="


#Checking vnet exits or not. if not exists create a vnet

$vnetStatus = Get-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroupName -ErrorAction SilentlyContinue

if ($vnetStatus -eq $null)
{
  Write-Host vnet $vnetName not exists 

  Write-Host Creating vnet and subnet
  $subnet=New-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix $sub_iprange
  New-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroupName -Location $rgLocation -AddressPrefix $vnet_iprange -Subnet $subnet

  
  
}
else {
    write-host vnet $vnetName already exists
    Write-Output $vnetStatus
}



# =============================================================================

Write-Host "-----------------------------------------------" 
Write-Host " -- Script finished ($scriptName)"
Write-Host ""
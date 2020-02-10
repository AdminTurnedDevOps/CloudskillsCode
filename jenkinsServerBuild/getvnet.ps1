$vnetName = "dev2-vnet"
# Retrieve ID of virtual network
$(Get-AzVirtualNetwork -Name $vnetName).id

# Retrieve ID of subnet that is in a virtual network
$(Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $(Get-AzVirtualNetwork -Name $vnetName)).Id
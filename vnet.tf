
resource "azurerm_virtual_network" "vnet_01" {
  name                = format("%s-vnet-01", var.resource_prefix)
  location            = azurerm_resource_group.jc_01.location
  resource_group_name = azurerm_resource_group.jc_01.name
  address_space       = var.addr_vnets[0]
}

resource "azurerm_subnet" "subnet_01_1" {
  name                 = var.name_subnets[0]
  resource_group_name  = azurerm_resource_group.jc_01.name
  virtual_network_name = azurerm_virtual_network.vnet_01.name
  address_prefixes     = var.addr_subnets_01[0]
}

resource "azurerm_subnet" "subnet_02_1" {
  name                 = var.name_subnets[1]
  resource_group_name  = azurerm_resource_group.jc_01.name
  virtual_network_name = azurerm_virtual_network.vnet_01.name
  address_prefixes     = var.addr_subnets_01[1]
}

resource "azurerm_virtual_network" "vnet_02" {
  name                = format("%s-vnet-02", var.resource_prefix)
  location            = azurerm_resource_group.jc_01.location
  resource_group_name = azurerm_resource_group.jc_01.name
  address_space       = var.addr_vnets[1]
}

resource "azurerm_subnet" "subnet_01_2" {
  name                 = var.name_subnets[0]
  resource_group_name  = azurerm_resource_group.jc_01.name
  virtual_network_name = azurerm_virtual_network.vnet_02.name
  address_prefixes     = var.addr_subnets_02[0]
}

resource "azurerm_subnet" "subnet_02_2" {
  name                 = var.name_subnets[1]
  resource_group_name  = azurerm_resource_group.jc_01.name
  virtual_network_name = azurerm_virtual_network.vnet_02.name
  address_prefixes     = var.addr_subnets_02[1]
}

resource "azurerm_virtual_network_peering" "peering-vnet1" {
  name                      = format("%s-peering-vnet1", var.resource_prefix)
  resource_group_name       = azurerm_resource_group.jc_01.name
  virtual_network_name      = azurerm_virtual_network.vnet_01.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_02.id
}
resource "azurerm_virtual_network_peering" "peering-vnet2" {
  name                      = format("%s-peering-vnet2", var.resource_prefix)
  resource_group_name       = azurerm_resource_group.jc_01.name
  virtual_network_name      = azurerm_virtual_network.vnet_02.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_01.id
}

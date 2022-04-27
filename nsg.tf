// NSG 1
resource "azurerm_network_security_group" "nsg_vnet_01_subnet01" {
  name                = format("%s-nsg-vnet1-subnet1", var.resource_prefix)
  location            = azurerm_resource_group.jc_01.location
  resource_group_name = azurerm_resource_group.jc_01.name
}

resource "azurerm_network_security_rule" "nsg_vnet_01_subnet01" {
  name                        = "SSH_Entrante"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.jc_01.name
  network_security_group_name = azurerm_network_security_group.nsg_vnet_01_subnet01.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_vnet_01_subnet01" {
  subnet_id                 = azurerm_subnet.subnet_01_1.id
  network_security_group_id = azurerm_network_security_group.nsg_vnet_01_subnet01.id
}

// NSG 2
resource "azurerm_network_security_group" "nsg_vnet_01_subnet02" {
  name                = format("%s-nsg-vnet1-subnet2", var.resource_prefix)
  location            = azurerm_resource_group.jc_01.location
  resource_group_name = azurerm_resource_group.jc_01.name
}


resource "azurerm_network_security_rule" "nsg_vnet_01_subnet02" {
  name                        = "SSH_Entrante"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.jc_01.name
  network_security_group_name = azurerm_network_security_group.nsg_vnet_01_subnet02.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_vnet_01_subnet02" {
  subnet_id                 = azurerm_subnet.subnet_02_1.id
  network_security_group_id = azurerm_network_security_group.nsg_vnet_01_subnet02.id
}

// NSG 3
resource "azurerm_network_security_group" "nsg_vnet_02_subnet01" {
  name                = format("%s-nsg-vnet2-subnet1", var.resource_prefix)
  location            = azurerm_resource_group.jc_01.location
  resource_group_name = azurerm_resource_group.jc_01.name
}

resource "azurerm_network_security_rule" "nsg_vnet_02_subnet01" {
  name                        = "SSH_Entrante"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.jc_01.name
  network_security_group_name = azurerm_network_security_group.nsg_vnet_02_subnet01.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_vnet_02_subnet01" {
  subnet_id                 = azurerm_subnet.subnet_01_2.id
  network_security_group_id = azurerm_network_security_group.nsg_vnet_02_subnet01.id
}

// NSG 4
resource "azurerm_network_security_group" "nsg_vnet_02_subnet02" {
  name                = format("%s-nsg-vnet2-subnet2", var.resource_prefix)
  location            = azurerm_resource_group.jc_01.location
  resource_group_name = azurerm_resource_group.jc_01.name
}

resource "azurerm_network_security_rule" "nsg_vnet_02_subnet02" {
  name                        = "SSH_Entrante"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.jc_01.name
  network_security_group_name = azurerm_network_security_group.nsg_vnet_02_subnet02.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_vnet_02_subnet02" {
  subnet_id                 = azurerm_subnet.subnet_02_2.id
  network_security_group_id = azurerm_network_security_group.nsg_vnet_02_subnet02.id
}

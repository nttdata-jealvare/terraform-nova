// Public IP
resource "azurerm_public_ip" "jc_pubip_01" {
  name                = format("%s-pubip-vnet01", var.resource_prefix)
  resource_group_name = azurerm_resource_group.jc_01.name
  location            = azurerm_resource_group.jc_01.location
  allocation_method   = "Dynamic"
  domain_name_label   = var.domain_dns_label
}

// Network interface
resource "azurerm_network_interface" "jc_nicvm_01" {
  name                = "${var.resource_prefix}-nic-vm01"
  location            = azurerm_resource_group.jc_01.location
  resource_group_name = azurerm_resource_group.jc_01.name

  ip_configuration {
    name                          = var.interface_name_conf
    subnet_id                     = azurerm_subnet.subnet_01_1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.jc_pubip_01.id
  }
}

resource "azurerm_network_interface" "jc_nicvm_02" {
  name                = "${var.resource_prefix}-nic-vm02"
  location            = azurerm_resource_group.jc_01.location
  resource_group_name = azurerm_resource_group.jc_01.name

  ip_configuration {
    name                          = var.interface_name_conf
    subnet_id                     = azurerm_subnet.subnet_01_2.id
    private_ip_address_allocation = "Dynamic"
  }
}

// VM 1
resource "azurerm_linux_virtual_machine" "jc_vm_01" {
  name                = "${var.resource_prefix}-vm01"
  location            = azurerm_resource_group.jc_01.location
  resource_group_name = azurerm_resource_group.jc_01.name
  size                = var.vm-size
  admin_username      = var.vm-username
  network_interface_ids = [
    azurerm_network_interface.jc_nicvm_01.id,
  ]

  admin_ssh_key {
    username   = var.vm-username
    public_key = file("./lab02.pub")
  }

  os_disk {
    caching              = var.os_disk_conf[0]
    storage_account_type = var.os_disk_conf[1]
  }

  source_image_reference {
    publisher = var.source_image_conf[0]
    offer     = var.source_image_conf[1]
    sku       = var.source_image_conf[2]
    version   = var.source_image_conf[3]
  }
}

// VM 2
resource "azurerm_linux_virtual_machine" "jc_vm_02" {
  name                            = "${var.resource_prefix}-vm02"
  location                        = azurerm_resource_group.jc_01.location
  resource_group_name             = azurerm_resource_group.jc_01.name
  size                            = var.vm-size
  admin_username                  = var.vm-username
/*admin_password                = "DATAtest"
  disable_password_authentication = false*/
  network_interface_ids = [
    azurerm_network_interface.jc_nicvm_02.id,
  ]

  admin_ssh_key {
    username   = var.vm-username
    public_key = file("./lab02.pub")
  }

  os_disk {
    caching              = var.os_disk_conf[0]
    storage_account_type = var.os_disk_conf[1]
  }

  source_image_reference {
    publisher = var.source_image_conf[0]
    offer     = var.source_image_conf[1]
    sku       = var.source_image_conf[2]
    version   = var.source_image_conf[3]
  }
}

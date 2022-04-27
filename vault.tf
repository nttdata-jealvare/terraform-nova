resource "azurerm_key_vault" "jc_key_vault" {
  name                        = "${var.resource_prefix}-keyvault-01"
  location                    = azurerm_resource_group.jc_01.location
  resource_group_name         = azurerm_resource_group.jc_01.name
  enabled_for_disk_encryption = true
  tenant_id                   = var.azure_tenant
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = var.azure_tenant
    object_id = var.azure_object

    certificate_permissions = [
      "Get",
    ]

    key_permissions = [
      "Get",
      "Create"
    ]

    secret_permissions = [
      "Get",
      "Set"
    ]
  }
}

/*resource "azurerm_key_vault_certificate" "jc_imported_cert" {
  name         = "imported-cert"
  key_vault_id = azurerm_key_vault.jc_key_vault.id

  certificate {
    contents = filebase64("./lab02.pub")
  }
}*/

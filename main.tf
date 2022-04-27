terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "jc-nova-storage"
    storage_account_name = "jcstorageaccountnova"
    container_name       = "jcstoragecontainernova"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }

  subscription_id = var.azure_subscription
  tenant_id       = var.azure_tenant
}


resource "azurerm_resource_group" "jc_01" {
  name     = format("%s-%s", var.resource_prefix, var.resource_group_name)
  location = var.azure_location
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {
    organization = "sinn-zhang-playground"

    workspaces {
      name = "Hands-On_Lab_Terraform"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-fcc29f65-hands-on-with-terraform-on-azure"
  location = "West US"
}

module "securestorage" {
  source  = "app.terraform.io/sinn-zhang-playground/securestorage/azurerm"
  version = "1.0.0"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "flzxsqc250"
}
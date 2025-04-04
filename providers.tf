terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.22.0"

    }
  }

    backend "azurerm" {
	resource_group_name="terraform"
	storage_account_name="baluck011987"
	container_name="terraform-prod"
	key="terraform.tfstate"

}
}

provider "azurerm" {

features {}

}


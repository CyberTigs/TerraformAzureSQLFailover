terraform {
  required_version = ">=1.3.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = "true" #due to being a cloud sandbox skip providers registration
  features {}
  subscription_id = "964df7ca-3ba4-48b6-a695-1ed9db5723f8"
}

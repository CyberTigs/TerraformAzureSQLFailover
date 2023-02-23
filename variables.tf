variable "acloud_rg" {
  default = "1-ce060148-playground-sandbox"
  description = "This is used for the cloud sandbox when it is spun up.  When the box is destroyed and recreated the resource group changes so this will need to be updated"
}

variable "location_eastus" {
  default 	= "eastus"
  description	= "Resources located in EastUS, used in cloud sandbox"
}

variable "location_uksouth" {
  default     = "uksouth"
  description = "Resources located in UKSouth"
}

variable "location_ukwest" {
  default     = "ukwest"
  description = "Resources located in UKWest"
}

variable "location_westus" {
  default 	= "westus"
  description	= "Resources located in WestUS, used in cloud sandbox"
}

#name has to be unique in Azure, hence dbasqlservices
variable "name_prod_prefix" {
  default     = "dbasqlservices-prod-"
  description = "Prefix of the prod resource group name"
}

#name has to be unique in Azure, hence dbasqlservices
variable "name_dev_prefix" {
  default     = "dbasqlservices-dev-"
  description = "Prefix of the dev resource group name"
}

variable "tag_prod" {
  default     = "Production"
  description = "Production deployed by terraform"
}

variable "tag_dev" {
  default     = "Development"
  description = "Development deployed by terraform"
}

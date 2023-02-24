#creates resource groups for production, example of using variables.tf
#resource "azurerm_resource_group" "production" {
#  name     = "${var.name_prod_prefix}001"
#  location = var.location_uksouth
#}

#creates resource groups for development, example of using variables.tf
#resource "azurerm_resource_group" "development" {
#  name     = "${var.name_dev_prefix}001"
#  location = var.location_ukwest
#}

#create Primary SQL server
resource "azurerm_mssql_server" "prod_terraform_sql_server_01" {
  name                         = "${var.name_prod_prefix}sql-server-01"
  resource_group_name          = var.acloud_rg
  location                     = var.location_westus
  version                      = "12.0"
  administrator_login          = var.sqllogin #001 - move to KV
  administrator_login_password = var.sqlloginpwd # 002 - move to KV

  tags = {
    name = "${var.tag_prod}"
  }
}

#create Seconday SQL server
resource "azurerm_mssql_server" "prod_terraform_sql_server_02" {
  name                         = "${var.name_prod_prefix}sql-server-02"
  resource_group_name          = var.acloud_rg
  location                     = var.location_eastus
  version                      = "12.0"
  administrator_login          = var.sqllogin #003 - move to KV
  administrator_login_password = var.sqlloginpwd #004 -  move to KV

  tags = {
    name = var.tag_prod
  }
}

#create databases
resource "azurerm_mssql_database" "database_adventureworks2019" {
  name			= "adventureworks2019"
  server_id		= azurerm_mssql_server.prod_terraform_sql_server_01.id
  collation		= "SQL_Latin1_General_CP1_CI_AS"
  tags = {
    name = var.tag_prod
  }
}

#create failover group between servers and add databases to it
resource "azurerm_mssql_failover_group" "prod_sql_failover_group_01" {
  name			= "prod-sql-failover-group-01"
  server_id		= azurerm_mssql_server.prod_terraform_sql_server_01.id		
  databases		= [azurerm_mssql_database.database_adventureworks2019.id]
  partner_server {
    id = azurerm_mssql_server.prod_terraform_sql_server_02.id
  }

  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 60
  }
}

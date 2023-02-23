# TerraformAzureSQLFailover
This is a simple example of using Terraform to provision 2 SQL Servers into Azure, create a database, then place this into a failover group.

There are a couple of outstanding tasks on here

001 - Need to create a KV entry and populate for SQLAdmin for Server 1
002 - Need to create a KV entry and populate for SQLAdmin password for Server 1
003 - Need to create a KV entry and populate for SQLAdmin for Server 2
004 - Need to create a KV entry and populate for SQLAdmin password for Server 2

Created 23/02/2023 by Adam Pearson (adam@dbasqlservices.co.uk)

How to execute...

1. Download code
2. Start new sandbox environment up
3. Connect to sandbox environment and grab the resource group / subscription id
4. Open up the providers.tf file and add the correct subscription id
5. Open the variables.tf file and change the acloud_rg to match the resource group of the spun up sandbox
6. Terraform init
7. Terraform fmt
8. Terraform plan
9. Terraform apply
10.  Check portal, should have 2 new SQL servers and 1 adventureworks2019 database in a failover group

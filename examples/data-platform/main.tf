# Create a resource group
resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-${var.environment}-rg"
  location = var.location

  tags = var.tags
}

# Create general-purpose storage account (queues, tables, files)
module "storage" {
  source = "../../modules/storage"

  name                     = "${var.prefix}${var.environment}storage"
  location                 = azurerm_resource_group.this.location
  resource_group_name      = azurerm_resource_group.this.name
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_replication_type

  tags = var.tags
}

# Create blob storage with raw and processed data containers
module "blob_storage" {
  source = "../../modules/blob-storage"

  storage_account_name     = "${var.prefix}${var.environment}blob"
  location                 = azurerm_resource_group.this.location
  resource_group_name      = azurerm_resource_group.this.name
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_replication_type
  containers               = var.blob_containers

  tags = var.tags
}

# Create PostgreSQL server for structured/processed data
module "postgresql" {
  source = "../../modules/postgresql"

  name                   = "${var.prefix}-${var.environment}-pg"
  location               = azurerm_resource_group.this.location
  resource_group_name    = azurerm_resource_group.this.name
  administrator_login    = var.db_admin_login
  administrator_password = var.db_admin_password
  postgresql_version     = var.postgresql_version
  databases              = var.databases

  tags = var.tags
}

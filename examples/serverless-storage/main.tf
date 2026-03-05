data "azurerm_client_config" "current" {}

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

# Create blob storage with named containers
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

# Assign Storage Blob Data Contributor role to the current principal on the blob storage account
module "rbac_blob" {
  source = "../../modules/rbac"

  scope                = module.blob_storage.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}

# Assign Storage Queue Data Contributor role to the current principal on the general storage account
module "rbac_queue" {
  source = "../../modules/rbac"

  scope                = module.storage.id
  role_definition_name = "Storage Queue Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}

# Create a resource group
resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-${var.environment}-rg"
  location = var.location

  tags = var.tags
}

# Create storage account for the web app
module "storage" {
  source = "../../modules/storage"

  name                      = "${var.prefix}${var.environment}storage"
  location                  = azurerm_resource_group.this.location
  resource_group_name       = azurerm_resource_group.this.name
  account_tier              = var.storage_account_tier
  account_replication_type  = var.storage_replication_type

  tags = var.tags
}

# Create the web app using the app-service module
module "webapp" {
  source = "../../modules/app-service"

  name                = "${var.prefix}-${var.environment}-webapp"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  service_plan_name   = "${var.prefix}-${var.environment}-plan"
  os_type             = var.os_type
  sku_name            = var.sku_name

  tags = var.tags
}

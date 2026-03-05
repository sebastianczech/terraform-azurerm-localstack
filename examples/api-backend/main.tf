# Create a resource group
resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-${var.environment}-rg"
  location = var.location

  tags = var.tags
}

# Create PostgreSQL database server for the backend
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

# Create the backend web app using the app-service module
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

# Create API Management to front the backend
module "api_management" {
  source = "../../modules/api-management"

  name                = "${var.prefix}-${var.environment}-apim"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name            = var.apim_sku

  tags = var.tags
}

data "azurerm_client_config" "current" {}

# Create a resource group
resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-${var.environment}-rg"
  location = var.location

  tags = var.tags
}

# Create Key Vault for storing secrets
module "key_vault" {
  source = "../../modules/key-vault"

  name                            = "${var.prefix}${var.environment}kv"
  location                        = azurerm_resource_group.this.location
  resource_group_name             = azurerm_resource_group.this.name
  sku_name                        = var.key_vault_sku
  enabled_for_template_deployment = true

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

# Assign Key Vault Secrets User role to the current principal on the Key Vault
module "rbac_kv" {
  source = "../../modules/rbac"

  scope                = module.key_vault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = data.azurerm_client_config.current.object_id
}

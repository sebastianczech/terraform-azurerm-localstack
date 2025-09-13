resource "azurerm_postgresql_flexible_server" "this" {
  name                   = var.name
  location               = var.location
  resource_group_name    = var.resource_group_name
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  sku_name               = var.sku_name
  version                = var.postgresql_version
  storage_mb             = var.storage_mb

  tags = var.tags
}

resource "azurerm_postgresql_flexible_server_database" "this" {
  count     = length(var.databases)
  name      = var.databases[count.index]
  server_id = azurerm_postgresql_flexible_server.this.id
  collation = "en_US.utf8"
  charset   = "utf8"
}
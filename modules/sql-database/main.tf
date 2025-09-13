resource "azurerm_mssql_server" "this" {
  name                         = var.server_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  version                      = var.server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  tags = var.tags
}

resource "azurerm_mssql_database" "this" {
  count     = length(var.databases)
  name      = var.databases[count.index].name
  server_id = azurerm_mssql_server.this.id
  sku_name  = var.databases[count.index].sku_name

  tags = var.tags
}
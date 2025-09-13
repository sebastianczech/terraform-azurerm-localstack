output "id" {
  description = "The ID of the PostgreSQL Flexible Server"
  value       = azurerm_postgresql_flexible_server.this.id
}

output "name" {
  description = "The name of the PostgreSQL Flexible Server"
  value       = azurerm_postgresql_flexible_server.this.name
}

output "fqdn" {
  description = "The FQDN of the PostgreSQL Flexible Server"
  value       = azurerm_postgresql_flexible_server.this.fqdn
}

output "administrator_login" {
  description = "The Administrator login for the PostgreSQL Flexible Server"
  value       = azurerm_postgresql_flexible_server.this.administrator_login
}

output "database_names" {
  description = "List of database names"
  value       = azurerm_postgresql_flexible_server_database.this[*].name
}
output "server_id" {
  description = "The Microsoft SQL Server ID"
  value       = azurerm_mssql_server.this.id
}

output "server_name" {
  description = "The Microsoft SQL Server name"
  value       = azurerm_mssql_server.this.name
}

output "server_fqdn" {
  description = "The fully qualified domain name of the Azure SQL Server"
  value       = azurerm_mssql_server.this.fully_qualified_domain_name
}

output "administrator_login" {
  description = "The administrator login name for the new server"
  value       = azurerm_mssql_server.this.administrator_login
}

output "database_ids" {
  description = "List of database IDs"
  value       = azurerm_mssql_database.this[*].id
}

output "database_names" {
  description = "List of database names"
  value       = azurerm_mssql_database.this[*].name
}
# Resource Group outputs
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.this.name
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.this.id
}

# PostgreSQL outputs
output "postgresql_id" {
  description = "The ID of the PostgreSQL server"
  value       = module.postgresql.id
}

output "postgresql_name" {
  description = "The name of the PostgreSQL server"
  value       = module.postgresql.name
}

output "postgresql_fqdn" {
  description = "The FQDN of the PostgreSQL server"
  value       = module.postgresql.fqdn
}

output "postgresql_databases" {
  description = "List of created database names"
  value       = module.postgresql.database_names
}

# Web App outputs
output "webapp_id" {
  description = "The ID of the Web App"
  value       = module.webapp.id
}

output "webapp_name" {
  description = "The name of the Web App"
  value       = module.webapp.name
}

output "webapp_url" {
  description = "The default URL of the Web App"
  value       = "https://${module.webapp.default_site_hostname}"
}

# API Management outputs
output "apim_id" {
  description = "The ID of the API Management service"
  value       = module.api_management.id
}

output "apim_name" {
  description = "The name of the API Management service"
  value       = module.api_management.name
}

output "apim_gateway_url" {
  description = "The gateway URL of the API Management service"
  value       = module.api_management.gateway_url
}

output "apim_portal_url" {
  description = "The developer portal URL of the API Management service"
  value       = module.api_management.portal_url
}

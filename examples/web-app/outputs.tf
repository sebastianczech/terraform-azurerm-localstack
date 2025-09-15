# Resource Group outputs
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.this.name
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.this.id
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

output "webapp_hostname" {
  description = "The default hostname of the Web App"
  value       = module.webapp.default_site_hostname
}

# App Service Plan outputs
output "service_plan_id" {
  description = "The ID of the App Service Plan"
  value       = module.webapp.service_plan_id
}

output "service_plan_name" {
  description = "The name of the App Service Plan"
  value       = module.webapp.service_plan_name
}

# Storage Account outputs
output "storage_account_id" {
  description = "The ID of the Storage Account"
  value       = module.storage.id
}

output "storage_account_name" {
  description = "The name of the Storage Account"
  value       = module.storage.name
}

output "storage_account_primary_endpoint" {
  description = "The primary endpoint of the Storage Account"
  value       = module.storage.primary_blob_endpoint
}

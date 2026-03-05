# Resource Group outputs
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.this.name
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.this.id
}

# Key Vault outputs
output "key_vault_id" {
  description = "The ID of the Key Vault"
  value       = module.key_vault.id
}

output "key_vault_name" {
  description = "The name of the Key Vault"
  value       = module.key_vault.name
}

output "key_vault_uri" {
  description = "The URI of the Key Vault"
  value       = module.key_vault.vault_uri
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

# RBAC outputs
output "rbac_role_assignment_id" {
  description = "The ID of the Key Vault role assignment"
  value       = module.rbac_kv.id
}

output "rbac_role_definition_name" {
  description = "The assigned role name"
  value       = module.rbac_kv.role_definition_name
}

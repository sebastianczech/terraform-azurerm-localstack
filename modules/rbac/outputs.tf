output "id" {
  description = "The Role Assignment ID"
  value       = azurerm_role_assignment.this.id
}

output "principal_id" {
  description = "The Principal ID assigned to the role"
  value       = azurerm_role_assignment.this.principal_id
}

output "role_definition_name" {
  description = "The role definition name"
  value       = azurerm_role_assignment.this.role_definition_name
}

output "scope" {
  description = "The scope of the role assignment"
  value       = azurerm_role_assignment.this.scope
}
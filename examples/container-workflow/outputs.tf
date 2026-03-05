# Resource Group outputs
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.this.name
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.this.id
}

# Container Registry outputs
output "acr_id" {
  description = "The ID of the Container Registry"
  value       = module.container_registry.id
}

output "acr_name" {
  description = "The name of the Container Registry"
  value       = module.container_registry.name
}

output "acr_login_server" {
  description = "The login server URL of the Container Registry"
  value       = module.container_registry.login_server
}

# AKS outputs
output "aks_id" {
  description = "The ID of the AKS cluster"
  value       = module.kubernetes.id
}

output "aks_name" {
  description = "The name of the AKS cluster"
  value       = module.kubernetes.name
}

output "aks_fqdn" {
  description = "The FQDN of the AKS cluster"
  value       = module.kubernetes.fqdn
}

output "aks_host" {
  description = "The Kubernetes cluster server host"
  value       = module.kubernetes.host
  sensitive   = true
}

# RBAC outputs
output "rbac_acr_pull_id" {
  description = "The ID of the AcrPull role assignment"
  value       = module.rbac_acr_pull.id
}

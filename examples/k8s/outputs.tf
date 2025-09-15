# Resource Group outputs
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.this.name
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.this.id
}

# Kubernetes Cluster outputs
output "cluster_id" {
  description = "The Kubernetes Managed Cluster ID"
  value       = module.kubernetes.id
}

output "cluster_name" {
  description = "The Kubernetes Managed Cluster name"
  value       = module.kubernetes.name
}

output "cluster_fqdn" {
  description = "The FQDN of the Azure Kubernetes Managed Cluster"
  value       = module.kubernetes.fqdn
}

output "kube_config" {
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools"
  value       = module.kubernetes.kube_config
  sensitive   = true
}

output "cluster_host" {
  description = "The Kubernetes cluster server host"
  value       = module.kubernetes.host
  sensitive   = true
}

output "cluster_client_certificate" {
  description = "Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster"
  value       = module.kubernetes.client_certificate
  sensitive   = true
}

output "cluster_client_key" {
  description = "Base64 encoded private key used by clients to authenticate to the Kubernetes cluster"
  value       = module.kubernetes.client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster"
  value       = module.kubernetes.cluster_ca_certificate
  sensitive   = true
}

# Container Registry outputs (conditional)
output "container_registry_id" {
  description = "The ID of the Container Registry"
  value       = var.enable_container_registry ? module.container_registry[0].id : null
}

output "container_registry_name" {
  description = "The name of the Container Registry"
  value       = var.enable_container_registry ? module.container_registry[0].name : null
}

output "container_registry_login_server" {
  description = "The URL that can be used to log into the container registry"
  value       = var.enable_container_registry ? module.container_registry[0].login_server : null
}

output "container_registry_admin_username" {
  description = "The Username associated with the Container Registry Admin account"
  value       = var.enable_container_registry && var.container_registry_admin_enabled ? module.container_registry[0].admin_username : null
  sensitive   = true
}

output "container_registry_admin_password" {
  description = "The Password associated with the Container Registry Admin account"
  value       = var.enable_container_registry && var.container_registry_admin_enabled ? module.container_registry[0].admin_password : null
  sensitive   = true
}

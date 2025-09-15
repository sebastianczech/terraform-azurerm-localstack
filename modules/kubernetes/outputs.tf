output "id" {
  description = "The Kubernetes Managed Cluster ID"
  value       = azurerm_kubernetes_cluster.this.id
}

output "name" {
  description = "The Kubernetes Managed Cluster name"
  value       = azurerm_kubernetes_cluster.this.name
}

output "fqdn" {
  description = "The FQDN of the Azure Kubernetes Managed Cluster"
  value       = azurerm_kubernetes_cluster.this.fqdn
}

output "kube_config" {
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools"
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive   = true
}

output "client_certificate" {
  description = "Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster"
  value       = azurerm_kubernetes_cluster.this.kube_config.0.client_certificate
  sensitive   = true
}

output "client_key" {
  description = "Base64 encoded private key used by clients to authenticate to the Kubernetes cluster"
  value       = azurerm_kubernetes_cluster.this.kube_config.0.client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster"
  value       = azurerm_kubernetes_cluster.this.kube_config.0.cluster_ca_certificate
  sensitive   = true
}

output "host" {
  description = "The Kubernetes cluster server host"
  value       = azurerm_kubernetes_cluster.this.kube_config.0.host
  sensitive   = true
}

output "principal_id" {
  description = "The Principal ID of the System Assigned Managed Identity"
  value       = azurerm_kubernetes_cluster.this.identity.0.principal_id
}

output "kubelet_identity" {
  description = "The Kubelet Identity of the AKS cluster"
  value       = azurerm_kubernetes_cluster.this.kubelet_identity
}
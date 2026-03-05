# Resource Group outputs
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.this.name
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.this.id
}

# General Storage outputs
output "storage_account_id" {
  description = "The ID of the general-purpose storage account"
  value       = module.storage.id
}

output "storage_account_name" {
  description = "The name of the general-purpose storage account"
  value       = module.storage.name
}

output "storage_queue_endpoint" {
  description = "The queue endpoint of the storage account"
  value       = module.storage.primary_queue_endpoint
}

output "storage_table_endpoint" {
  description = "The table endpoint of the storage account"
  value       = module.storage.primary_table_endpoint
}

# Blob Storage outputs
output "blob_storage_account_id" {
  description = "The ID of the blob storage account"
  value       = module.blob_storage.storage_account_id
}

output "blob_storage_account_name" {
  description = "The name of the blob storage account"
  value       = module.blob_storage.storage_account_name
}

output "blob_endpoint" {
  description = "The primary blob endpoint"
  value       = module.blob_storage.primary_blob_endpoint
}

output "blob_containers" {
  description = "List of created blob container names"
  value       = module.blob_storage.container_names
}

# RBAC outputs
output "rbac_blob_contributor_id" {
  description = "The ID of the Storage Blob Data Contributor role assignment"
  value       = module.rbac_blob.id
}

output "rbac_queue_contributor_id" {
  description = "The ID of the Storage Queue Data Contributor role assignment"
  value       = module.rbac_queue.id
}

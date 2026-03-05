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

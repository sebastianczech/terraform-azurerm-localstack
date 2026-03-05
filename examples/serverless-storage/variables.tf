variable "prefix" {
  description = "The prefix used for all resources"
  type        = string
  default     = "slstorage"
}

variable "location" {
  description = "The Azure region where all resources should be created"
  type        = string
  default     = "East US"
}

variable "environment" {
  description = "The environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "storage_account_tier" {
  description = "Defines the Tier to use for the storage accounts"
  type        = string
  default     = "Standard"
}

variable "storage_replication_type" {
  description = "Defines the type of replication to use for the storage accounts"
  type        = string
  default     = "LRS"
}

variable "blob_containers" {
  description = "List of blob containers to create"
  type = list(object({
    name        = string
    access_type = string
  }))
  default = [
    { name = "uploads", access_type = "private" },
    { name = "backups", access_type = "private" },
  ]
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "ServerlessStorage"
    ManagedBy   = "Terraform"
  }
}

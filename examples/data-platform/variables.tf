variable "prefix" {
  description = "The prefix used for all resources"
  type        = string
  default     = "dataplatform"
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
    { name = "raw", access_type = "private" },
    { name = "processed", access_type = "private" },
    { name = "exports", access_type = "private" },
  ]
}

variable "db_admin_login" {
  description = "The administrator login for the PostgreSQL server"
  type        = string
  default     = "pgadmin"
}

variable "db_admin_password" {
  description = "The administrator password for the PostgreSQL server"
  type        = string
  sensitive   = true
  default     = "P@ssw0rd1234!"
}

variable "postgresql_version" {
  description = "The version of PostgreSQL to use"
  type        = string
  default     = "13"
}

variable "databases" {
  description = "List of database names to create"
  type        = list(string)
  default     = ["analytics", "warehouse"]
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "DataPlatform"
    ManagedBy   = "Terraform"
  }
}

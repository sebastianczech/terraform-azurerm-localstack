variable "prefix" {
  description = "The prefix used for all resources"
  type        = string
  default     = "webapp"
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

variable "os_type" {
  description = "The operating system type for the App Service Plan"
  type        = string
  default     = "Linux"
  validation {
    condition     = contains(["Linux", "Windows"], var.os_type)
    error_message = "The os_type must be either 'Linux' or 'Windows'."
  }
}

variable "sku_name" {
  description = "The SKU for the App Service Plan"
  type        = string
  default     = "B1"
}

variable "storage_account_tier" {
  description = "Defines the Tier to use for the storage account"
  type        = string
  default     = "Standard"
}

variable "storage_replication_type" {
  description = "Defines the type of replication to use for the storage account"
  type        = string
  default     = "LRS"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "WebApp"
    ManagedBy   = "Terraform"
  }
}

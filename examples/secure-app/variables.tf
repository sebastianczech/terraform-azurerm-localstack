variable "prefix" {
  description = "The prefix used for all resources"
  type        = string
  default     = "secureapp"
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

variable "key_vault_sku" {
  description = "The SKU name of the Key Vault"
  type        = string
  default     = "standard"
  validation {
    condition     = contains(["standard", "premium"], var.key_vault_sku)
    error_message = "The key_vault_sku must be either 'standard' or 'premium'."
  }
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

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "SecureApp"
    ManagedBy   = "Terraform"
  }
}

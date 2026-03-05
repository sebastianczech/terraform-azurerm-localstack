variable "prefix" {
  description = "The prefix used for all resources"
  type        = string
  default     = "apibackend"
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
  default     = ["appdb"]
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

variable "publisher_name" {
  description = "The name of the API Management publisher"
  type        = string
  default     = "My Company"
}

variable "publisher_email" {
  description = "The email of the API Management publisher"
  type        = string
  default     = "admin@example.com"
}

variable "apim_sku" {
  description = "The pricing tier of the API Management service"
  type        = string
  default     = "Developer_1"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "ApiBackend"
    ManagedBy   = "Terraform"
  }
}

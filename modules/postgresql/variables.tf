variable "name" {
  description = "The name of the PostgreSQL Flexible Server"
  type        = string
}

variable "location" {
  description = "The Azure region where the PostgreSQL Flexible Server should be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the PostgreSQL Flexible Server"
  type        = string
}

variable "administrator_login" {
  description = "The Administrator login for the PostgreSQL Flexible Server"
  type        = string
}

variable "administrator_password" {
  description = "The Password associated with the administrator_login for the PostgreSQL Flexible Server"
  type        = string
  sensitive   = true
}

variable "sku_name" {
  description = "The SKU Name for the PostgreSQL Flexible Server"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "postgresql_version" {
  description = "The version of PostgreSQL Flexible Server to use"
  type        = string
  default     = "13"
}

variable "storage_mb" {
  description = "The max storage allowed for the PostgreSQL Flexible Server"
  type        = number
  default     = 32768
}

variable "databases" {
  description = "List of database names to create"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
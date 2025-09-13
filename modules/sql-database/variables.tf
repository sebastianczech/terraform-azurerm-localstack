variable "server_name" {
  description = "The name of the Microsoft SQL Server"
  type        = string
}

variable "location" {
  description = "The Azure region where the Microsoft SQL Server should be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Microsoft SQL Server"
  type        = string
}

variable "server_version" {
  description = "The version for the new server"
  type        = string
  default     = "12.0"
}

variable "administrator_login" {
  description = "The administrator login name for the new server"
  type        = string
}

variable "administrator_login_password" {
  description = "The password associated with the administrator_login user"
  type        = string
  sensitive   = true
}

variable "databases" {
  description = "List of databases to create"
  type = list(object({
    name     = string
    sku_name = string
  }))
  default = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
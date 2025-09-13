variable "name" {
  description = "The name of the App Service"
  type        = string
}

variable "location" {
  description = "The Azure region where the App Service should be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the App Service"
  type        = string
}

variable "service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
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
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
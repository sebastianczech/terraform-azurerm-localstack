variable "name" {
  description = "The name of the API Management service"
  type        = string
}

variable "location" {
  description = "The Azure region where the API Management service should be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the API Management service"
  type        = string
}

variable "publisher_name" {
  description = "The name of the publisher/company"
  type        = string
}

variable "publisher_email" {
  description = "The email of the publisher/company"
  type        = string
}

variable "sku_name" {
  description = "The pricing tier of this API Management service"
  type        = string
  default     = "Developer_1"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
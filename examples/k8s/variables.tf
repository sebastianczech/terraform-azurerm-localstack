variable "prefix" {
  description = "The prefix used for all resources"
  type        = string
  default     = "k8s"
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

variable "kubernetes_version" {
  description = "Version of Kubernetes specified when creating the AKS managed cluster"
  type        = string
  default     = "1.27.3"
}

variable "default_node_pool" {
  description = "The default node pool configuration"
  type = object({
    name       = string
    node_count = number
    vm_size    = string
  })
  default = {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v3"
  }
}

variable "enable_container_registry" {
  description = "Whether to create an Azure Container Registry"
  type        = bool
  default     = true
}

variable "container_registry_sku" {
  description = "The SKU name of the container registry"
  type        = string
  default     = "Standard"
  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.container_registry_sku)
    error_message = "The container_registry_sku must be one of: Basic, Standard, Premium."
  }
}

variable "container_registry_admin_enabled" {
  description = "Specifies whether the admin user is enabled for the container registry"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "Kubernetes"
    ManagedBy   = "Terraform"
  }
}

variable "name" {
  description = "The name of the Managed Kubernetes Cluster"
  type        = string
}

variable "location" {
  description = "The Azure region where the Managed Kubernetes Cluster should be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Managed Kubernetes Cluster"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the managed cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Version of Kubernetes specified when creating the AKS managed cluster"
  type        = string
  default     = null
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
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
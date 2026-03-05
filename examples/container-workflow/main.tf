# Create a resource group
resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-${var.environment}-rg"
  location = var.location

  tags = var.tags
}

# Create Azure Container Registry to store container images
module "container_registry" {
  source = "../../modules/container-registry"

  name                = "${var.prefix}${var.environment}acr"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  sku                 = var.container_registry_sku
  admin_enabled       = var.container_registry_admin_enabled

  tags = var.tags
}

# Create the AKS cluster to run workloads
module "kubernetes" {
  source = "../../modules/kubernetes"

  name                = "${var.prefix}-${var.environment}-aks"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  dns_prefix          = "${var.prefix}-${var.environment}"
  kubernetes_version  = var.kubernetes_version
  default_node_pool   = var.default_node_pool

  tags = var.tags
}

# Give AKS cluster permission to pull images from ACR
module "rbac_acr_pull" {
  source = "../../modules/rbac"

  scope                = module.container_registry.id
  role_definition_name = "AcrPull"
  principal_id         = module.kubernetes.kubelet_identity[0].object_id
}

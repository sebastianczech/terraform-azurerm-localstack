# Create a resource group
resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-${var.environment}-rg"
  location = var.location

  tags = var.tags
}

# Create the AKS cluster using the kubernetes module
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

# Create Azure Container Registry (optional)
module "container_registry" {
  count  = var.enable_container_registry ? 1 : 0
  source = "../../modules/container-registry"

  name                = "${var.prefix}${var.environment}acr"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  sku                 = var.container_registry_sku
  admin_enabled       = var.container_registry_admin_enabled

  tags = var.tags
}

# Give AKS cluster permission to pull images from ACR
resource "azurerm_role_assignment" "aks_acr_pull" {
  count                = var.enable_container_registry ? 1 : 0
  principal_id         = module.kubernetes.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = module.container_registry[0].id
}

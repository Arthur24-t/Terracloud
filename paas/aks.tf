resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.project_name}-aks"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.project_name}-dns"
  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
    msi_auth_for_monitoring_enabled = true
  }
  
}

# Namespace Kubernetes
resource "kubernetes_namespace" "app" {
  metadata {
    name = "voting-app"
  }
}

resource "azurerm_log_analytics_workspace" "example" {
  name                = "example-log-workspace"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
}
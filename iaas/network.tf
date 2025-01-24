

resource "azurerm_virtual_network" "terracloud" {
  name                = "terracloud-vnet"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
}

resource "azurerm_subnet" "terracloud" {
  name                 = "terracloud-subnet"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.terracloud.name
  address_prefixes     = ["10.0.1.0/24"]

}

resource "azurerm_public_ip" "poll" {
  name                = "poll-public-ip"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku                 = "Basic" # Correspond à votre JSON
  idle_timeout_in_minutes = 4

  domain_name_label = "poll-vm-terracloud" 


  ddos_protection_mode = "VirtualNetworkInherited" # Hérité du réseau virtuel}
}
resource "azurerm_public_ip" "result" {
  name                = "result-public-ip"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"

    sku                 = "Basic" # Correspond à votre JSON
  idle_timeout_in_minutes = 4

  domain_name_label = "result-vm-terracloud" 


  ddos_protection_mode = "VirtualNetworkInherited" # Hérité du réseau virtuel}

}

resource "azurerm_public_ip" "worker" {
  name                = "worker-public-ip"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
    sku                 = "Basic" # Correspond à votre JSON
  idle_timeout_in_minutes = 4

  domain_name_label = "worker-vm-terracloud" # Le label DNS doit être unique dans la région


  ddos_protection_mode = "VirtualNetworkInherited" # Hérité du réseau virtuel}
}

resource "azurerm_public_ip" "redis" {
  name                = "redis-public-ip"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
    sku                 = "Basic" # Correspond à votre JSON
  idle_timeout_in_minutes = 4

  domain_name_label = "redis-vm-terracloud" # Le label DNS doit être unique dans la région


  ddos_protection_mode = "VirtualNetworkInherited" # Hérité du réseau virtuel}
}

resource "azurerm_public_ip" "postgres" {
  name                = "postgres-public-ip"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"

    sku                 = "Basic" # Correspond à votre JSON
  idle_timeout_in_minutes = 4

  domain_name_label = "postgres-vm-terracloud" # Le label DNS doit être unique dans la région


  ddos_protection_mode = "VirtualNetworkInherited" # Hérité du réseau virtuel}
}

resource "azurerm_network_interface" "poll" {
  name                = "poll-nic"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  ip_configuration {
    name                          = "poll-ipconfig"
    subnet_id                     = azurerm_subnet.terracloud.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.poll.id
  }
}

resource "azurerm_network_interface" "result" {
  name                = "result-nic"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  ip_configuration {
    name                          = "result-ipconfig"
    subnet_id                     = azurerm_subnet.terracloud.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.result.id
  }
}

resource "azurerm_network_interface" "worker" {
  name                = "worker-nic"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  ip_configuration {
    name                          = "worker-ipconfig"
    subnet_id                     = azurerm_subnet.terracloud.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.worker.id
  }
}

resource "azurerm_network_interface" "redis" {
  name                = "redis-nic"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  ip_configuration {
    name                          = "redis-ipconfig"
    subnet_id                     = azurerm_subnet.terracloud.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.redis.id
  }
}

resource "azurerm_network_interface" "postgres" {
  name                = "postgres-nic"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  ip_configuration {
    name                          = "postgres-ipconfig"
    subnet_id                     = azurerm_subnet.terracloud.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.postgres.id
  }
}
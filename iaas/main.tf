resource "azurerm_linux_virtual_machine" "poll" {
  name                = "poll-vm"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password      = "P@ssword1234"
  network_interface_ids = [azurerm_network_interface.poll.id]
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("${path.module}/ansible/.ssh/azurekey.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "result" {
  name                = "result-vm"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password      = "P@ssword1234"
  network_interface_ids = [azurerm_network_interface.result.id]
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("${path.module}/ansible/.ssh/azurekey.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "worker" {
  name                = "worker-vm"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password      = "P@ssword1234"
  network_interface_ids = [azurerm_network_interface.worker.id]
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("${path.module}/ansible/.ssh/azurekey.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "redis" {
  name                = "redis-vm"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password      = "P@ssword1234"
  network_interface_ids = [azurerm_network_interface.redis.id]
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("${path.module}/ansible/.ssh/azurekey.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "postgres" {
  name                = "postgres-vm"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password      = "P@ssword1234"
  network_interface_ids = [azurerm_network_interface.postgres.id]
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("${path.module}/ansible/.ssh/azurekey.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}

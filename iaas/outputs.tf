output "resource_group_name" {
  value = var.resource_group_name
}

output "lab_name" {
  value = var.resource_group_location
}

# output "vm_name" {
#   value = azurerm_dev_test_linux_virtual_machine.poll.name
# }

# output "password" {
#   sensitive = true
#   value     = local.password
# }
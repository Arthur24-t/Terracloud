
variable "resource_group_location" {
  type        = string
  default     = "westus"
  description = "Location for all resources."
}

variable "resource_group_name" {
  type        = string
  default     = "1-86cbd6e7-playground-sandbox"
  description = "The resource group name."
}

variable "lab_name" {
  type        = string
  description = "The name of the new lab instance to be created"
  default     = "t-clo-901-lil-1"
}

variable "vm_size" {
  type        = string
  description = "The size of the vm to be created."
  default     = "Standard_D4_v3"
}

variable "user_name" {
  type        = string
  description = "The username for the local account that will be created on the new vm."
  default     = "exampleuser"
}

variable "password" {
  type        = string
  description = "The password for the local account that will be created on the new vm."
  sensitive   = true
  default     = null
}

variable "virtual_network_name" {
  type        = string
  description = "The Virtual network name"
  default     = "t-clo-901-lil-1"
}
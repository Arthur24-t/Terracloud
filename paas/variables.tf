variable "resource_group_name" {
  type        = string
  default     = "1-86cbd6e7-playground-sandbox"
  description = "The resource group name."
}

variable "project_name" {
  type        = string
  description = "Project name"
  default     = "terracloud"

  validation {
    condition     = can(regex("^[a-zA-Z0-9]*$", var.project_name))
    error_message = "The project_name must be alphanumeric."
  }
}

variable "resource_group_location" {
  type        = string
  description = "Location for all resources."
  default     = "eastus"
}

variable "resource_group_name_prefix" {
  type        = string
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
  default     = "rg"
}
variable "node_count" {
  description = "Nombre de nœuds pour le cluster AKS"
  default     = 1
}

variable "postgres_host" {
  description = "The hostname of the PostgreSQL server."
  default     = "postgres-service"
}

variable "postgres_port" {
  description = "The port number on which the PostgreSQL server is listening."
  default     = "5432"
}

variable "postgres_user" {
  description = "The username for the PostgreSQL database."
  default     = "YmxldQ=="
}

variable "postgres_password" {
  description = "The password for the PostgreSQL database."
  default     = "YmxldWJsZXU1NzMzMA=="
}

variable "postgres_db" {
  description = "The name of the PostgreSQL database."
  default     = "postgresdb"
}

variable "redis_host" {
  description = "The hostname of the Redis server."
  default     = "redis-service"
}

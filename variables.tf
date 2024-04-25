variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "rg-kubdevce06-001winvm"
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  default     = "vnet-ce06-00"
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet"
  default     = "default"
}

variable "subnet_address_prefixes" {
  description = "Address prefix for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "vm_size" {
  description = "Size of the virtual machine"
  default     = "Standard_DS1_v2"
}

variable "publisher" {
  description = "Publisher of the OS image"
  default     = "MicrosoftWindowsServer"
}

variable "offer" {
  description = "Offer of the OS image"
  default     = "WindowsServer"
}

variable "sku" {
  description = "SKU of the OS image"
  default     = "2019-Datacenter"
}

variable "version_os" {
  description = "Version of the OS image"
  default     = "latest"
}

variable "admin_username" {
  description = "Username for the virtual machine"
  default     = "adminuser"
}

variable "admin_password" {
  description = "Password for the virtual machine"
  default     = "Password123!" # Please use a secure password
}

variable "default_tags" {
  description = "Default tags for resources"
  type        = map(string)
  default     = {}
}

variable "cohort" {
  type = string
}

variable "owner" {
  type = string
}

variable "env" {
  type = string
}

variable "purpose" {
  type = string
}

variable "worker" {
  type = string
}
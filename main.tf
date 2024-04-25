# Define Azure Resource Group
data "azurerm_resource_group" "example" {
  name     = var.resource_group_name
}

# Define Virtual Network
data "azurerm_virtual_network" "example" {
  name                = var.virtual_network_name
  resource_group_name = "rg-kubce06-hub"
}

# Define Subnet
data "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = "rg-kubce06-hub"
  virtual_network_name = data.azurerm_virtual_network.example.name
}

# Define Public IP
resource "azurerm_public_ip" "example" {
  name                = local.pip_name
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  allocation_method   = "Dynamic"
}

# Define Network Interface
resource "azurerm_network_interface" "example" {
  name                = local.ni_name
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}

# Define Virtual Machine
resource "azurerm_virtual_machine" "example" {
  name                  = local.vm_name
  location              = data.azurerm_resource_group.example.location
  resource_group_name   = data.azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = var.vm_size

  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.version_os
  }

  os_profile {
    computer_name  = local.os_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  storage_os_disk {
    name              = local.sd_name
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  tags = local.default_tags
}
output "public_ip_address" {
  description = "Public IP address of the virtual machine"
  value       = azurerm_public_ip.example.ip_address
}

output "private_ip_address" {
  description = "Private IP address of the virtual machine"
  value       = azurerm_network_interface.example.private_ip_address
}
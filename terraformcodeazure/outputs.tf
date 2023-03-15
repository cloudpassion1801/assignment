output "public_key" {
  value = tls_private_key.example_ssh.public_key_openssh

}

output "private_key" {
  value     = tls_private_key.example_ssh.private_key_pem
  sensitive = true

}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.my_terraform_vm.public_ip_address
}
# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}



# Create virtual machine
resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
  name                  = var.azurevm_name
  location              = azurerm_resource_group.resource_group_name.location
  resource_group_name   = azurerm_resource_group.resource_group_name.name
  network_interface_ids = [azurerm_network_interface.my_terraform_nic.id]
  size                  = var.azurevm_size

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "7.6"
    version   = "latest"
  }

  computer_name                   = var.azurevm_name
  admin_username                  = var.azurevm_adminuser
  admin_password                  = var.azurevm_adminpassword
  disable_password_authentication = false
  custom_data = filebase64("customdata.tpl") 

  admin_ssh_key {
    username   = var.azurevm_adminuser
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint
  }

  # provisioner "remote-exec" {
  #   inline = [" sudo yum update -y --disablerepo='*' --enablerepo='*microsoft*' && sudo  yum -y install rh-python36 && sudo yum -y install python3-dnf "]
  #   # inline = [" sudo dnf -y install python36"]
  # }

  # connection {
  #   type        = "ssh"
  #   user        = var.azurevm_adminuser
  #   # private_key = file("${var.ssh_key_path}")
  #   password   = var.azurevm_adminpassword

  #    host = "${self.public_ip_address}"
  #   agent = false
  # }
  # provisioner "local-exec" {
  #   command = "ansible-playbook -i '${self.public_ip},' --private-key ${var.ssh_key_path} thoughtworks_role.yml"
  # }

}
resource "azurerm_virtual_network" "myvnet" {
  name                = var.vnet_name
  address_space       = [var.cidr_of_vpc]
  location            = var.region_of_deployment
  resource_group_name = azurerm_resource_group.resource_group_name.name
}

resource "azurerm_subnet" "frontendsubnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.resource_group_name.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = [var.cidr_of_subnet]
}


resource "azurerm_public_ip" "instancepublicip" {
  name                = "pip1"
  location            = var.region_of_deployment
  resource_group_name = azurerm_resource_group.resource_group_name.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

# Create network interface
resource "azurerm_network_interface" "my_terraform_nic" {
  name                = "myNIC"
  location            = var.region_of_deployment
  resource_group_name = azurerm_resource_group.resource_group_name.name

  ip_configuration {
    name                          = "my_nic_configuration"
    subnet_id                     = azurerm_subnet.frontendsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.instancepublicip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "sg_association" {
  network_interface_id      = azurerm_network_interface.my_terraform_nic.id
  network_security_group_id = azurerm_network_security_group.my_terraform_nsg.id
}
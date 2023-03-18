variable "region_of_deployment" {
  type    = string
  default = "eastus"
}

variable "env" {

  type = string
  default = "dev"
  
}
variable "projecttag" {
  type    = string
  default = "thoughtworks"
}


variable "cidr_of_vpc" {
  type    = string
  default = "10.100.0.0/16"
}

variable "cidr_of_subnet" {
  type    = string
  default = "10.100.0.0/16"
}


variable "cidr_of_public_subnet" {
  type    = string
  default = "10.100.0.0/24"
}

variable "resource_group_name" {
  type    = string
  default = "thoughtworksdemo"
}

variable "vnet_name" {
  type    = string
  default = "thoughtworksdemo"
}
variable "subnet_name" {
  type    = string
  default = "thoughtworksdemo"
}

variable "azurevm_name" {
  type    = string
  default = "thoughtworksdemo"
}
variable "azurevm_size" {
  type    = string
  default = "Standard_DS1_v2"
}

variable "azurevm_adminuser" {
  type    = string
  default = "thoughtworks"
}

variable "azurevm_adminpassword" {
  type    = string
  default = "Thoughtworks@1123"
}


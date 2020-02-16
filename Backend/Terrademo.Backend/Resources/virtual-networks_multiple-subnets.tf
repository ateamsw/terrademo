# Author: GitHub Examples
# Title: Virtual Network with multiple Subnets
# Description: This example provisions a Virtual Network containing a 3 Subnets.

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "example" {
  name                = "${var.prefix}-network"
  resource_group_name = "${azurerm_resource_group.example.name}"
  location            = "${azurerm_resource_group.example.location}"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  virtual_network_name = "${azurerm_virtual_network.example.name}"
  resource_group_name  = "${azurerm_resource_group.example.name}"
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet" "backend" {
  name                 = "backend"
  virtual_network_name = "${azurerm_virtual_network.example.name}"
  resource_group_name  = "${azurerm_resource_group.example.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_subnet" "database" {
  name                 = "database"
  virtual_network_name = "${azurerm_virtual_network.example.name}"
  resource_group_name  = "${azurerm_resource_group.example.name}"
  address_prefix       = "10.0.3m.0/24"
}

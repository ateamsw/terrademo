# Author: GitHub Examples
# Title: Media Services
# Description: This example provisions a Media Service with a single Storage Account.

### Variables

* `prefix` - (Required) The prefix used for all resources in this example.

* `location` - (Required) The Azure Region in which the resources in this example should be created.

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}

resource "azurerm_storage_account" "example" {
  name                     = "${var.prefix}storacc"
  resource_group_name      = "${azurerm_resource_group.example.name}"
  location                 = "${azurerm_resource_group.example.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_media_services" "example" {
  name                = "${var.prefix}mediasvc"
  location            = "${azurerm_resource_group.example.location}"
  resource_group_name = "${azurerm_resource_group.example.name}"

  storage_account {
    id         = "${azurerm_storage_account.example.id}"
    is_primary = true
  }
}

output "rendered" {
  value = "${azurerm_media_services.example.id}"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name_prefix}${var.environment}"
  address_space       = [ "${var.vnet_cidr}" ]
  location            = "${var.region}"
  resource_group_name = "${var.resource_group}"
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.name_prefix}${var.environment}-${count.index}"
  resource_group_name  = "${var.resource_group}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  count                = "${var.subnet_count}"
  address_prefix       = "${cidrsubnet(var.vnet_cidr, var.cidr_split, count.index)}"
}

resource "azurerm_network_security_group" "default" {
  name                = "default"
  location            = "${var.region}"
  resource_group_name = "${var.resource_group}"

  security_rule {
    name                       = "allow-vnet"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "${var.vnet_cidr}"
    destination_address_prefix = "${var.vnet_cidr}"
  }

  tags {
    environment = "${var.environment}"
  }
}

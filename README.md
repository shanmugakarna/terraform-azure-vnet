# terraform-azure-vnet
Terraform Module for Azure VNet and Subnet Creation

## Usage
```
resource "azurerm_resource_group" "network" {
  name     = "RG-VNET"
  location = "${var.region}"
}

module "vnet" {
  source        = "github.com/shanmugakarna/terraform-azure-vnet.git"
  region        = "East US"
  vnet_cidr     = "10.0.0.0/16"
  environment   = "staging"
  resource_group = "${azurerm_resource_group.network.name}"
  subnet_count  = "1"
  cidr_split    = "10"
  name_prefix   = "you_app-"
}
```
## Variables
`cidr_split` is the prefix offset used to split the CIDR. Having `/16` as VNET cidr prefix, then `cidr_split` of `10` will create subnets with `/26` prefix

subnet's cidr prefix = vnet's cidr prefix + cidr_split

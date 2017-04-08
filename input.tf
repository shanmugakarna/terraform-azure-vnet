variable "region" {}
variable "vnet_cidr" {}
variable "environment" {}
variable "subnet_count" {
  default = 3
}

variable "cidr_split" {
  default = 4
}

variable "name_prefix" {
  default = "demo-"
}

variable "resource_group" {
  default = "RG-VNET"
}

output "name" {
  value =  "${azurerm_virtual_network.vnet.name}"
}

output "subnets" {
  value =  [ "${azurerm_subnet.subnet.*.id}" ]
}

output "default_nsg" {
  value =  "${azurerm_network_security_group.default.id}"
}

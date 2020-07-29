provider "azurerm" {
    features {}
}

module "resource-group-1" {
    source = "./resource-group"
    resource_group_name = "modulesDemo"
    resource_group_location = "uksouth"
}

module "virtual-machine" {
    source = "./virtual-machine"
    resource_group_name = module.resource-group-1.resource_group_name
    resource_group_location = module.resource-group-1.resource_group_location
    admin_user = "Jade"
    size = "Standard_B1s"
}
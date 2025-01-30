locals {
  # The following variables are used to create the standardized naming convention for the resources.
  location = lookup(local.location_table, replace(lower(var.name_attributes.location), " ", ""))
  instance = format("%02s", var.name_attributes.instance)

  common_convention_base = "${var.name_attributes.project}-${var.name_attributes.environment}-${local.location}-${local.instance}"
}

locals {
  location_table = {
    "canadacentral" = "cc"
    "canadaeast"    = "ce"
  }

  resource_type_abbreviations = {
    "application security group"     = "asg"
    "disk encryption set"            = "des"
    "firewall"                       = "fw"
    "kubernetes service"             = "aks"
    "load balancer"                  = "lb"
    "network interface card"         = "nic"
    "network security group"         = "nsg"
    "private endpoint"               = "pe"
    "public ip address"              = "pip"
    "resource group"                 = "rg"
    "route server"                   = "rs"
    "route table"                    = "rt"
    "service endpoint policy"        = "sep"
    "service principal"              = "sp"
    "user-assigned managed identity" = "msi"
    "virtual machine"                = "vm"
    "virtual machine scale set"      = "vmss"
    "virtual network"                = "vnet"
  }

  common_conv_prefixes = { for resource_type, abbrev in local.resource_type_abbreviations : resource_type => "${local.common_convention_base}-${abbrev}" }
}

locals {
  # The following variables are used to create the standardized naming convention for the resources.
  location = lookup(local.location_table, replace(lower(var.name_attributes.location), " ", ""))
  instance = format("%02s", var.name_attributes.instance)

  common_convention_base_statcan = "${var.name_attributes.project}-${var.name_attributes.environment}-${local.location}-${local.instance}"
  common_convention_base_ssc     = "${var.name_attributes_ssc.department_code}${var.name_attributes_ssc.environment}${var.name_attributes_ssc.csp_region}"

  locals {
    location_table = {
      "canadacentral" = "cc"
      "canadaeast"    = "ce"
    }

    resource_type_abbreviations_statcan = {
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

    resource_type_abbreviations_ssc = {
      "application security group" = "asg"
      "disk encryption set"        = "des"
      "firewall"                   = "fw"
      "kubernetes service"         = "aks"
      # "load balancer"                  = "lb"
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
      # "azure data factory"             = "adf"
      # "databricks service"             = "dbw"
      # "web application"                = "wapp"
      # "application insights"           = "appi"
      # "azure bastion end-point"        = "bstn"
      # "network watcher"                = "nw"
      # "vnet peering"                   = "gwp"
      # "local network gateway"          = "lgn"
      # "virtual network gateway"        = "vng"
      # "load balancer backend pool"     = "lbbp"
      # "load balancer health probe"     = "lbhp"
      # "load balancer rule"             = "lbr"
      # "azure load balancer"            = "alb"
      # "traffic manager"                = "tm"
      # "storage account"                = "stg"
      # "subnet"                         = "snet"
    }

    common_conv_prefixes_statcan = {
      for resource_type, abbrev in local.resource_abbreviations_statcan :
      resource_type => "${local.convention_base_statcan}-${abbrev}"
    }

    common_conv_prefixes_ssc = {
      for resource_type, abbrev in local.resource_abbreviations_ssc :
      resource_type => "${local.common_convention_base_ssc}-${var.user_defined}-${abbrev}"
    }

    common_conv_prefixes = var.government ? common_conv_prefixes_ssc : common_conv_prefixes_statcan

  }
}

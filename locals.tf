locals {
  # The following variables are used to create the standardized naming convention for the resources.
  location = var.government ? "" : lookup(local.location_table, replace(lower(var.name_attributes.location), " ", ""))
  instance = format("%02s", var.name_attributes.instance)

  common_convention_base_statcan = "${var.name_attributes.project}-${var.name_attributes.environment}-${local.location}-${local.instance}"
  common_convention_base_ssc     = "${var.name_attributes_ssc.department_code}${var.name_attributes_ssc.environment}${var.name_attributes_ssc.csp_region}"

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
    "application security group"        = "asg"
    "disk encryption set"               = "des"
    "firewall"                          = "afw"
    "kubernetes service"                = "aks"
    "load balancer"                     = "lb"
    "network interface card"            = "nic"
    "network security group"            = "nsg"
    "private endpoint"                  = "pe"
    "public ip address"                 = "pip"
    "resource group"                    = "rg"
    "route server"                      = "rs"
    "route table"                       = "rt"
    "service endpoint policy"           = "sep"
    "service principal"                 = "spn"
    "user-assigned managed identity"    = ""
    "system-assigned managed identity"  = ""
    "virtual machine"                   = ""
    "virtual machine scale set"         = "vmss"
    "virtual network"                   = "vnet"
    "databricks service"                = "dbw"
    "management group"                  = ""
    "subscription"                      = ""
    "virtual machine os disk"           = ""
    "virtual machine data disk"         = ""
    "availability set"                  = "as"
    "application insights"              = "appi"
    "bastion end-point"                 = "bstn"
    "network watcher"                   = "nw"
    "local network gateway"             = "lgn"
    "virtual network gateway"           = "vng"
    "load balancer backend pool"        = "lbhp"
    "load balancer health probe"        = "lbhp"
    "load balancer rule"                = "lbr"
    "azure load balancer"               = "alb"
    "traffic manager"                   = "tm"
    "subnet"                            = "snet"
    "route"                             = "route"
    "connection"                        = "con"
    "network security group rule"       = ""
    "load balancer front end interface" = "lbr"
    "load balancer rules"               = "lbbp"
    "azure application gateway"         = "agw"
    "traffic manager profile"           = "tm"
  }

  resource_names_exception = {
    # For any resources that does not follow the convention <dept code><environment><CSP Region>-<userDefined-string>-suffix
    "network interface card"            = "${var.name_attributes_ssc.parent_object_name}-${var.user_defined}-nic${var.name_attributes_ssc.instance}"
    "network security group"            = "${var.name_attributes_ssc.parent_object_name}-${var.user_defined}-nsg"
    "public ip address"                 = "${var.name_attributes_ssc.parent_object_name}-${var.user_defined}-pip${var.name_attributes_ssc.instance}"
    "resource group"                    = "${local.common_convention_base_ssc}-${var.name_attributes_ssc.owner}-${var.user_defined}-rg"
    "route table"                       = "${var.name_attributes_ssc.parent_object_name}-rt"
    "user-assigned managed identity"    = "${local.common_convention_base_ssc}_${var.user_defined}"
    "management group"                  = "${local.common_convention_base_ssc}-${var.name_attributes_ssc.owner}-${var.user_defined}"
    "subscription"                      = "${local.common_convention_base_ssc}-${var.name_attributes_ssc.owner}-${var.user_defined}"
    "virtual machine os disk"           = "${var.name_attributes_ssc.parent_object_name}-osdisk${var.name_attributes_ssc.instance}"
    "virtual machine data disk"         = "${var.name_attributes_ssc.parent_object_name}-datadisk${var.name_attributes_ssc.instance}"
    "availability set"                  = "${var.name_attributes_ssc.parent_object_name}-${var.user_defined}-as"
    "subnet"                            = "${var.name_attributes_ssc.parent_object_name}-${var.user_defined}-snet"
    "route"                             = "${var.user_defined}-route"
    "virtual network gateway"           = "${var.name_attributes_ssc.parent_object_name}-${var.user_defined}-vng"
    "local network gateway"             = "${var.name_attributes_ssc.parent_object_name}-${var.user_defined}-lng"
    "connection"                        = "${var.name_attributes_ssc.parent_object_name}-${var.user_defined}-con"
    "network security group rule"       = "${var.user_defined}"
    "load balancer front end interface" = "${var.name_attributes_ssc.parent_object_name}-lbr${var.name_attributes_ssc.instance}"
    "load balancer rules"               = "${var.name_attributes_ssc.parent_object_name}-lbbp"
    "load balancer backend pool"        = "${var.name_attributes_ssc.parent_object_name}-lbhp"
    "load balancer health probe"        = "${var.name_attributes_ssc.parent_object_name}-${var.user_defined}-lbhp"
  }

  common_conv_prefixes_ssc = {
    for resource_type, abbrev in local.resource_type_abbreviations_ssc :
    resource_type => (
      contains(keys(local.resource_names_exception), resource_type)
      ? local.resource_names_exception[resource_type]
      : "${local.common_convention_base_ssc}-${var.user_defined}-${abbrev}"
    )
  }

  common_conv_prefixes_statcan = merge(
    {
      for resource_type in keys(local.common_conv_prefixes_ssc) :
      resource_type => ""
    },
    { for resource_type, abbrev in local.resource_type_abbreviations_statcan :
      resource_type => "${local.common_convention_base_statcan}-${abbrev}"
    }
  )

  common_conv_prefixes = var.government ? local.common_conv_prefixes_ssc : local.common_conv_prefixes_statcan

}

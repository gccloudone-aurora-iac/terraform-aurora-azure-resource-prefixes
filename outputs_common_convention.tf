#############
## General ##
#############

output "prefix" {
  description = "The common prefix for an Azure resource name. Under typical circumstances, the resource type acronym would just be appended to the prefix to complete the resource name."
  value       = var.government ? local.common_convention_base_ssc : local.common_convention_base_statcan
}

// Scope: subscription
// Length: 1-90
// Valid Characters: Underscores, hyphens, periods, parentheses, and letters or digits. Can't end with a period.
output "resource_group_prefix" {
  description = "The prefix of an Azure Resource Group."
  value       = local.common_conv_prefixes["resource group"]
}

###############
### Network ###
###############

// Scope: resource group
// Length: 1-80
// Valid Characters: Alphanumerics, underscores, periods, and hyphens. Start with alphanumeric. End alphanumeric or underscore.
output "application_security_group_prefix" {
  description = "The prefix of an Azure Application Security Group."
  value       = local.common_conv_prefixes["application security group"]
}

// Scope: resource group
// Length: 1-80
// Valid Characters: Alphanumerics, underscores, periods, and hyphens. Start with alphanumeric. End alphanumeric or underscore.
output "firewall_prefix" {
  description = "The prefix of an Azure Firewall."
  value       = local.common_conv_prefixes["firewall"]
}

// Scope: resource group
// Length: 1-80
// Valid Characters: Alphanumerics, underscores, periods, and hyphens. Start with alphanumeric. End alphanumeric or underscore.
output "load_balancer_prefix" {
  description = "The prefix of an Azure Load Balancer."
  value       = local.common_conv_prefixes["load balancer"]
}

// Scope: resource group
// Length: 1-80
// Valid Characters: Alphanumerics, underscores, periods, and hyphens. Start with alphanumeric. End alphanumeric or underscore.
output "network_security_group_prefix" {
  description = "The prefix of an Azure Network Security Group."
  value       = local.common_conv_prefixes["network security group"]
}

// Scope: resource group
// Length: 1-80
// Valid Characters: Alphanumerics, underscores, periods, and hyphens. Start with alphanumeric. End alphanumeric or underscore.
output "private_endpoint_prefix" {
  description = "The prefix of an Azure Private Endpoint."
  value       = local.common_conv_prefixes["private endpoint"]
}

// Scope: resource group
// Length: 1-80
// Valid Characters: Alphanumerics, underscores, periods, and hyphens. Start with alphanumeric. End alphanumeric or underscore.
output "public_ip_address_prefix" {
  description = "The prefix of a Public IP Address in Azure."
  value       = local.common_conv_prefixes["public ip address"]
}

// Scope: resource group
// Length: 1-80
// Valid Characters: Alphanumerics, underscores, periods, and hyphens. Start with alphanumeric. End alphanumeric or underscore.
output "route_server_prefix" {
  description = "The prefix of an Azure Route Server."
  value       = local.common_conv_prefixes["route server"]
}

// Scope: resource group
// Length: 1-80
// Valid Characters: Alphanumerics, underscores, periods, and hyphens. Start with alphanumeric. End alphanumeric or underscore.
output "route_table_prefix" {
  description = "The prefix of an Azure Route Table."
  value       = local.common_conv_prefixes["route table"]
}

// Scope: resource group
// Length: 1-80
// Valid Characters: Alphanumerics, underscores, periods, and hyphens. Start with alphanumeric. End alphanumeric or underscore.
output "service_endpoint_policy_prefix" {
  description = "The prefix of an Azure Service Endpoint Policy."
  value       = local.common_conv_prefixes["service endpoint policy"]
}

// Scope: resource group
// Length: 2-64
// Valid Characters: Alphanumerics, underscores, periods, and hyphens. Start with alphanumeric. End alphanumeric or underscore.
output "virtual_network_prefix" {
  description = "The prefix of an Azure Virtual Network."
  value       = local.common_conv_prefixes["virtual network"]
}

###############
### Compute ###
###############

// Scope: resource group
// Length: 2-63
// Valid Characters: The name can contain only letters, numbers, underscores, and hyphens. The name must start and end with a letter or number.
output "disk_encryption_set_prefix" {
  description = "The prefix of an Azure Disk Encryption Set."
  value       = local.common_conv_prefixes["disk encryption set"]
}

// Scope: resource group
// Length: 2-63
// Valid Characters: The name can contain only letters, numbers, underscores, and hyphens. The name must start and end with a letter or number.
output "kubernetes_service_prefix" {
  description = "The prefix of an Azure Kubernetes Service."
  value       = local.common_conv_prefixes["kubernetes service"]
}

// Scope: resource group
// Length: 2-63
// Valid Characters: The name can contain only letters, numbers, underscores, and hyphens. The name must start and end with a letter or number.
output "network_interface_card_prefix" {
  description = "The prefix of a Network Interface Card."
  value       = local.common_conv_prefixes["network interface card"]
}

// Scope: resource group
// Length: 2-63
// Valid Characters: The name can contain only letters, numbers, underscores, and hyphens. The name must start and end with a letter or number.
output "virtual_machine_prefix" {
  description = "The prefix of an Azure Virtual Machine"
  value       = local.common_conv_prefixes["virtual machine"]
}

// Scope: resource group
// Length: 2-63
// Valid Characters: The name can contain only letters, numbers, underscores, and hyphens. The name must start and end with a letter or number.
output "virtual_machine_scale_set_prefix" {
  description = "The prefix of a Virtual Machine Scale Set (VMSS)"
  value       = local.common_conv_prefixes["virtual machine scale set"]
}

################
### Identity ###
################

// Scope: resource group
// Length: 3-128
// Valid Characters: Alphanumerics, hyphens, and underscores. Start with letter or number.
output "managed_identity_prefix" {
  description = "The prefix of an Azure User-Assigned Managed Identity."
  value       = local.common_conv_prefixes["user-assigned managed identity"]
}

// Scope: tenant
// Length: 1-255
// Valid Characters: Alphanumerics, hyphens, and underscores. Start with letter or number.
output "service_principal_prefix" {
  description = "The prefix of an Azure Service Principal."
  value       = local.common_conv_prefixes["service principal"]
}

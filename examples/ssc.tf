module "azure_resource_prefixes" {
  source = "../"

  government = true

  name_attributes_ssc = {
    department_code = "Sc"
    csp_region      = "c"
    environment     = "P"
  }
}

output "azure_resource_prefixes" {
  value = module.azure_resource_prefixes
}

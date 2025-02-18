module "azure_resource_prefixes_stc" {
  source = "../"

  name_attributes = {
    project     = "aur"
    environment = "dev"
    location    = "Canada Central"
    instance    = "00"
  }
}

output "azure_resource_prefixes_values_stc" {
  value = module.azure_resource_prefixes_stc
}

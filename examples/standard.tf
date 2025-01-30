module "azure_resource_prefixes" {
  source = "../"

  name_attributes = {
    project     = "aur"
    environment = "dev"
    location    = "Canada Central"
    instance    = "00"
  }
}

output "azure_resource_prefixes" {
  value = module.azure_resource_prefixes
}

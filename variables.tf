variable "name_attributes" {
  type = object({
    project     = string
    environment = string
    location    = string
    instance    = string
  })

  validation {
    condition     = length(var.name_attributes.environment) > 0 && length(var.name_attributes.environment) <= 10
    error_message = "Environment must be between 1-10 characters long"
  }

  validation {
    condition     = length(var.name_attributes.project) > 0 && length(var.name_attributes.project) <= 10
    error_message = "Project name must be between 1-10 characters long"
  }

  validation {
    condition     = contains(["canadacentral", "canadaeast"], replace(lower(var.name_attributes.location), " ", ""))
    error_message = "Location provided is not valid. Valid locations are 'Canada Central', 'Canada East'."
  }

  validation {
    condition     = var.name_attributes.instance >= 0 && var.name_attributes.instance < 100
    error_message = "The variable var.name_attributes.instance must be between 0-100."
  }
}

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

variable "name_attributes_ssc" {
  type = object({
    department_code = string
    csp_region      = string
    environment     = string
  })

  validation {
    condition     = length(var.name_attributes_ssc.environment) == 1
    error_message = "Environment must be 1 character long"
  }

  validation {
    condition     = length(var.name_attributes_ssc.department_code) == 2
    error_message = "Department code must be 2 characters long"
  }

  validation {
    condition     = length(var.name_attributes_ssc.region) == 1
    error_message = "Region must be 1 character long"
  }

  validation {
    condition     = var.government
    error_message = "The government variable is required to be true when setting the name_attributes_ssc variable."
  }
}

variable "user_defined" {
  description = "A user-defined field that describes the Azure resource."
  type        = string
  nullable    = false

  validation {
    condition     = length(var.user_defined) >= 2 && length(var.user_defined) <= 15
    error_message = "The user-defined field must be between 2-15 characters long."
  }

  validation {
    condition     = var.government
    error_message = "The government variable is required to be true when setting the user_defined variable."
  }
}

variable "government" {
  type        = bool
  default     = false
  description = "Sets which naming convention to use. If true, use SSC's otherwise use StatCan's."
}

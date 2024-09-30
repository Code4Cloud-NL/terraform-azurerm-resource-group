variable "general" {
  description = "General configuration used for naming resources, location etc."
  type = object({
    prefix      = string
    application = string
    environment = string
    location    = string
  })
  validation {
    condition     = contains(["lab", "stg", "dev", "tst", "acc", "prd"], var.general.environment)
    error_message = "Invalid environment specified!"
  }
  validation {
    condition     = contains(["northeurope", "westeurope"], var.general.location)
    error_message = "Invalid location specified!"
  }
}

variable "resource_groups" {
  description = "The list of resource groups that need to be created by this module."
  type = list(object({
    name     = string
    instance = optional(string, "001")
  }))
}

variable "tags" {
  description = "The tags that will be applied once during the creation of the resources."
  type        = map(string)
  default     = {}
}

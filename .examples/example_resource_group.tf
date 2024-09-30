# resource groups for pl-identity
module "resource_groups" {
  source = "../modules/terraform-azurerm-resource-group"

  general = {                    # (required) general information used in the naming of resources etc.
    prefix      = "c4c"          # (required) the prefix of the customer (e.g. c4c)
    application = "connectivity" # (required) the unique name of the resource groups (must be unique within the subscription)
    environment = "prd"          # (required) the environment (e.g. lab, stg, dev, tst, acc, prd)
    location    = "westeurope"   # (required) the location for the resources (e.g. westeurope, northeurope)
  }

  tags = { # (optional) a map of tags applied to the resources
    environment = "prd"
    location    = "westeurope"
    managed_by  = "terraform"
  }

  resource_groups = [{ name = "net" }, { name = "vms", instance = "002" }] # (required) the name and (optional) instance number for the resource group(s).
}

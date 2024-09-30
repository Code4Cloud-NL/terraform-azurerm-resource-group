locals {
  location_table = {
    westeurope  = "westeu"
    northeurope = "northeu"
  }
}

# resource groups
resource "azurerm_resource_group" "this" {
  for_each = { for rg in var.resource_groups : "${rg.name}-${rg.instance}" => rg }

  name     = "${var.general.prefix}-${var.general.application}-${each.value.name}-${var.general.environment}-${each.value.instance}"
  location = var.general.location
  tags     = var.tags

  lifecycle {
    ignore_changes = [tags]
  }
}

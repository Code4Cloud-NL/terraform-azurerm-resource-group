<!-- BEGIN_TF_DOCS -->
# Azure Resource Group (RG) module

This module simplifies the creation of one or more resource groups (rg) in Azure. It is designed to be flexible, modular, and easy to use, ensuring a seamless and secure rg deployment experience.

# Features

Creates one or more maintenance configurations in Azure with the following (optional) features:

- Resource groups are created with a standard naming convention: prefix-application-name-environment-001
- If necessary this can be changed by using the instance object (e.g. instance = "002").

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_general"></a> [general](#input\_general) | General configuration used for naming resources, location etc. | <pre>object({<br>    prefix      = string<br>    application = string<br>    environment = string<br>    location    = string<br>  })</pre> | n/a | yes |
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups) | The list of resource groups that need to be created by this module. | <pre>list(object({<br>    name     = string<br>    instance = optional(string, "001")<br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags that will be applied once during the creation of the resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_resource_group"></a> [azurerm\_resource\_group](#output\_azurerm\_resource\_group) | n/a |

## Example(s)

### 2 resource groups with a different instance number (e.g c4c-connectivity-net-prd-001, c4c-prd-connectivity-vms-prd-002)

```hcl
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
```

# Known issues and limitations

No known issues or limitations.

# Author

Stefan Vonk (vonk.stefan@live.nl) Technical Specialist
<!-- END_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.65 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.network](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.security](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aurora_passwords"></a> [aurora\_passwords](#input\_aurora\_passwords) | n/a | `map` | <pre>{<br>  "default": "c3ksiKyr6v4uNVWT",<br>  "develop": "gNGrBvgCjd5jNQhN",<br>  "staging": "NKGHfSgxLBihCUkP"<br>}</pre> | no |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | The bucket Terraform deploy your instance | `string` | `"terraform-threepoints"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | The Name of your organization | `string` | `"terraform-threepoints"` | no |
| <a name="input_project"></a> [project](#input\_project) | The project Name | `string` | `"Core Databases"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region Terraform deploy your instance | `string` | `"us-east-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tag Environment | `map` | <pre>{<br>  "Environment": "dev",<br>  "Terraform": "true"<br>}</pre> | no |
| <a name="input_type"></a> [type](#input\_type) | Type of infrastructure | `string` | `"core"` | no |

## Outputs

No outputs.

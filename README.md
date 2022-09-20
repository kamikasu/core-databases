## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.65 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.58.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_db_prototypes"></a> [db\_prototypes](#module\_db\_prototypes) | terraform-aws-modules/rds-aurora/aws | 5.2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_db_parameter_group.aurora_parameter_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_rds_cluster_parameter_group.aurora_cluster_parameter_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_parameter_group) | resource |
| [terraform_remote_state.network](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.security](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aurora_passwords"></a> [aurora\_passwords](#input\_aurora\_passwords) | n/a | `map` | <pre>{<br>  "default": "c3ksiKyr6v4uNVWT",<br>  "develop": "gNGrBvgCjd5jNQhN",<br>  "staging": "NKGHfSgxLBihCUkP"<br>}</pre> | no |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | The bucket Terraform deploy your instance | `string` | `"terraform-wiedii"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | The Name of your organization | `string` | `"wiedii"` | no |
| <a name="input_project"></a> [project](#input\_project) | The project Name | `string` | `"Core Databases"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region Terraform deploy your instance | `string` | `"us-east-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tag Environment | `map` | <pre>{<br>  "Environment": "dev",<br>  "Terraform": "true"<br>}</pre> | no |
| <a name="input_type"></a> [type](#input\_type) | Type of infrastructure | `string` | `"core"` | no |
| <a name="input_workspace_iam_roles"></a> [workspace\_iam\_roles](#input\_workspace\_iam\_roles) | n/a | `map` | <pre>{<br>  "default": "arn:aws:iam::347039610421:role/OrganizationAccountAccessRole",<br>  "develop": "arn:aws:iam::059152934397:role/OrganizationAccountAccessRole",<br>  "staging": "arn:aws:iam::022060465973:role/OrganizationAccountAccessRole"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_prototypes_rds_cluster_endpoint"></a> [db\_prototypes\_rds\_cluster\_endpoint](#output\_db\_prototypes\_rds\_cluster\_endpoint) | The cluster endpoint |
| <a name="output_db_prototypes_rds_cluster_id"></a> [db\_prototypes\_rds\_cluster\_id](#output\_db\_prototypes\_rds\_cluster\_id) | The ID of the cluster |
| <a name="output_db_prototypes_rds_cluster_instance_endpoints"></a> [db\_prototypes\_rds\_cluster\_instance\_endpoints](#output\_db\_prototypes\_rds\_cluster\_instance\_endpoints) | A list of all cluster instance endpoints |
| <a name="output_db_prototypes_rds_cluster_instance_ids"></a> [db\_prototypes\_rds\_cluster\_instance\_ids](#output\_db\_prototypes\_rds\_cluster\_instance\_ids) | A list of all cluster instance ids |
| <a name="output_db_prototypes_rds_cluster_master_password"></a> [db\_prototypes\_rds\_cluster\_master\_password](#output\_db\_prototypes\_rds\_cluster\_master\_password) | The master password |
| <a name="output_db_prototypes_rds_cluster_master_username"></a> [db\_prototypes\_rds\_cluster\_master\_username](#output\_db\_prototypes\_rds\_cluster\_master\_username) | The master username |
| <a name="output_db_prototypes_rds_cluster_port"></a> [db\_prototypes\_rds\_cluster\_port](#output\_db\_prototypes\_rds\_cluster\_port) | The port |
| <a name="output_db_prototypes_rds_cluster_reader_endpoint"></a> [db\_prototypes\_rds\_cluster\_reader\_endpoint](#output\_db\_prototypes\_rds\_cluster\_reader\_endpoint) | The cluster reader endpoint |
| <a name="output_db_prototypes_rds_cluster_resource_id"></a> [db\_prototypes\_rds\_cluster\_resource\_id](#output\_db\_prototypes\_rds\_cluster\_resource\_id) | The Resource ID of the cluster |

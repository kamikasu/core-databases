terraform {
  backend "s3" {
    bucket         = "terraform-threepoints"
    key            = "core/databases.tfstate"
    region         = "us-east-1"
    encrypt        = false
    dynamodb_table = "terraform-states-lock"
  }
}

provider "aws" {
  region     = var.region
  # assume_role {
  #   role_arn = var.workspace_iam_roles[terraform.workspace]
  # }
}

locals {
  name        = "${var.organization}-${terraform.workspace}"
  network     = data.terraform_remote_state.network.outputs
  security    = data.terraform_remote_state.security.outputs
  common_tags = {
    Terraform   = true
    Project     = var.project
    Environment = terraform.workspace
    Type        = var.type
  }
}

data "terraform_remote_state" "network" {
  backend     = "s3"
  workspace = terraform.workspace
  config      = {
    bucket    = var.bucket
    key       = "core/network.tfstate"
    region    = var.region
  }
}
 
data "terraform_remote_state" "security" {
  backend     = "s3"
  workspace   = terraform.workspace
  config      = {
    bucket    = var.bucket
    key       = "core/security.tfstate"
    region    = var.region
  }
}

# module "db_prototypes" {
#   source                          = "terraform-aws-modules/rds-aurora/aws"
#   version                         = "5.2.0"

#   name                            = "${local.name}-aurora-prototypes"
#   engine                          = "aurora-mysql"
#   engine_version                  = (terraform.workspace == "develop" || terraform.workspace == "staging") ? "5.7.mysql_aurora.2.07.1" : "5.7.mysql_aurora.2.10.0"
#   engine_mode                     = (terraform.workspace == "develop" || terraform.workspace == "staging") ? "serverless" : "provisioned"
#   storage_encrypted               = true
#   instance_type         = (terraform.workspace == "develop" || terraform.workspace == "staging") ? "" : "db.t3.medium"
#   instance_type_replica = (terraform.workspace == "develop" || terraform.workspace == "staging") ? "" : "db.t3.medium"

#   vpc_id                          = local.network.vpc_id
#   subnets                         = local.network.vpc_database_subnets
#   db_subnet_group_name            = local.network.db_subnet_group
#   create_security_group           = false
#   vpc_security_group_ids          = [local.network.sg_aurora_id]
#   allowed_cidr_blocks             = local.network.vpc_private_subnets

#   publicly_accessible             = false
#   username                        = "admin_aurora_nprojects_usr"
#   create_random_password          = true

#   replica_scale_enabled           = (terraform.workspace == "develop" || terraform.workspace == "staging") ? false : true
#   replica_count                   = 0
#   replica_scale_cpu               = 80
#   replica_scale_in_cooldown       = 300
#   replica_scale_out_cooldown      = 300
#   replica_scale_min               = (terraform.workspace == "develop" || terraform.workspace == "staging") ? 0 : 2
#   replica_scale_max               = 13

#   scaling_configuration = (terraform.workspace != "develop" && terraform.workspace != "staging") ? {} : {
#     auto_pause                    = true
#     min_capacity                  = 1
#     max_capacity                  = (terraform.workspace == "develop" || terraform.workspace == "staging") ? 1 : 2
#     seconds_until_auto_pause      = 300
#     timeout_action                = (terraform.workspace == "develop" || terraform.workspace == "staging") ? "RollbackCapacityChange" : "ForceApplyCapacityChange"
#   }
  
#   iam_role_name = "rds_aurora_iam"
#   iam_role_use_name_prefix        = true
#   iam_role_description            = "${local.name} RDS enhanced monitoring IAM role"
#   iam_role_max_session_duration   = 7200

#   monitoring_interval             = 5
  
#   skip_final_snapshot             = true
#   apply_immediately               = true

#   db_parameter_group_name         = aws_db_parameter_group.aurora_parameter_group.id
#   db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aurora_cluster_parameter_group.id
#   backup_retention_period         = 1
#   enabled_cloudwatch_logs_exports = (terraform.workspace == "develop" || terraform.workspace == "staging") ? [] : ["audit", "error", "general", "slowquery"]
#   tags                            = var.tags
# }

# resource "aws_db_parameter_group" "aurora_parameter_group" {
#   name        = "${var.organization}-aurora-db-57-parameter-group"
#   family      = "aurora-mysql5.7"
#   description = "${var.organization}-aurora-db-57-parameter-group"
#   tags        = var.tags
# }
# resource "aws_rds_cluster_parameter_group" "aurora_cluster_parameter_group" {
#   name        = "${var.organization}-aurora-57-cluster-parameter-group"
#   family      = "aurora-mysql5.7"
#   description = "${var.organization}-aurora-57-cluster-parameter-group"
#   tags        = var.tags
# }

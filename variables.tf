variable "organization" {
  description = "The Name of your organization"
  type        = string
  default     = "terraform-threepoints"
}

variable "region" {
  description = "The region Terraform deploy your instance"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "The project Name"
  type        = string
  default     = "Core Databases"
}

variable "bucket" {
  description = "The bucket Terraform deploy your instance"
  type        = string
  default     = "terraform-threepoints"
}

# variable "workspace_iam_roles" {
#   type    = map
#   default = {
#     develop = ""
#     staging = ""
#     default = ""
#   }
# }

variable "aurora_passwords" {
  type    = map
  default = {
    develop = "gNGrBvgCjd5jNQhN"
    staging = "NKGHfSgxLBihCUkP"
    default = "c3ksiKyr6v4uNVWT"
  }
}

variable "type" {
  description = "Type of infrastructure"
  type        = string
  default     = "core"
}

variable "tags" {
  description = "Default tag Environment"
  type        = map
  default     = {
    Terraform   = "true"
    Environment = "dev"
  }
}
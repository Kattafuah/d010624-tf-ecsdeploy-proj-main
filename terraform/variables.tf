################################################################
# General
################################################################
variable "tags" {
  description = "A map of default tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Account name to use in naming resources"
  type        = string
  default     = "jmdevopsproject"
}

variable "short_region" {
  description = "Short form of the AWS region"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "account_id" {
  type    = string
  default = "data.aws_ssm_parameter.account_id_param.value"
}

variable "account_name" {
  type    = string
  default = "data.aws_ssm_parameter.account_name_param.value"
}

# variable "account_name" {
# }

# variable "account_id" {
# }

#################################################################
# VPC
#################################################################
variable "vpc_ip_cidr" {
  type = string
}

variable "vpc_subnets_map" {
  type        = map(any)
  description = "Map of CIDR-to-subnet associations"
}

#################################################################
# Route53
#################################################################
variable "zone_id" {
  type    = string
  default = "data.aws_ssm_parameter.zone_id_param.value"
}

variable "zone_name" {
  type    = string
  default = "ingkwasiattafua.com"
}

variable "domain_name" {
  type    = string
  default = "ingkwasiattafua.com"
}


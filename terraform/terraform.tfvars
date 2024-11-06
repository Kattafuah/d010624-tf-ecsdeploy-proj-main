region          = "us-east-1"
short_region    = "use1"
account_name    = data.aws_ssm_parameter.account_name_param.value
account_id      = data.aws_ssm_parameter.account_id_param.value
zone_id         = data.aws_ssm_parameter.zone_id_param.value


tags = {
  AccountName = data.aws_ssm_parameter.account_name_param.value
  Owner       = "kattafuah@gmail.com"
  Terraform   = true
  Department  = "Training"
  Project     = "DevOps"
}

vpc_ip_cidr = "10.18.0.0/16"
vpc_subnets_map = {
  "public" = {
    "general" = {
      "10.18.0.0/24" = "public-a"
      "10.18.1.0/24" = "public-b"
    }
  }
  "private" = {
    "general" = {
      "10.18.2.0/24" = "private-a"
      "10.18.3.0/24" = "private-b"
      "10.18.4.0/24" = "private-c"
    }
  }
}

region          = "us-east-1"
short_region    = "use1"
account_name    = var.account_name
account_id      = var.account_id
zone_id         = var.zone_id


tags = {
  AccountName = var.account_name
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

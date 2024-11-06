module "ecs" {
  source              = "../modules/tf-ecs"
  name                = "jmtfproject"
  account_id          = data.aws_ssm_parameter.account_id_param.value
  account_name        = data.aws_ssm_parameter.account_name_param.value
  aws_region          = var.region
  vpc_id              = data.aws_ssm_parameter.vpc_id.value
  vpc_ip_cidr         = data.aws_ssm_parameter.vpc_cidr.value
  private_subnet_ids  = local.private_subnet_ids
  public_subnets_ids  = local.public_subnet_ids
  ssl_certificate_arn = data.aws_ssm_parameter.certificate_arn.value
  container_name      = "jmtfproject"
  image               = "kattafuah/brokencrystals:nodejs-88bd29899dba6db1295d88e11b709568f1d42d15" #"chriscloudaz/netflix:latest" #"213939666921.dkr.ecr.us-west-2.amazonaws.com/jomacsit"
  app_port            = 3000
  app_count           = 2
  container_memory    = 2048
  container_cpu       = 1024
  zone_id             = data.aws_ssm_parameter.zone_id_param.value
  dns_record_name     = "ecs"
  health_check_path   = "/"
}

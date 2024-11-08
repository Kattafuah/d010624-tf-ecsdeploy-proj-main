terraform {
  backend "s3" {
    bucket = "jmtfproject-bucket"
    key = "jmtfproject/tf-deployment/d010624-oidc.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=5.39.0"
    }
  }
}

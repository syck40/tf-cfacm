terraform {
  required_version = ">=0.14"

  required_providers {
      aws = {
        source = "hashicorp/aws"
        version = ">=3.0"
        }
  }
  backend "s3" {
    bucket = "drake-tf-statefiles-1"
    key = "cloudfront-acm/terraform.tfstate"
    region = "us-west-1"
  }
}

provider "aws" {
  region = var.aws_reg
}

provider "aws" {
  alias = "acm_provider"
  region = "us-west-1"
}
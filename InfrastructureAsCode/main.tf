terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region = "us-west-2" 
}

module "s3" {
  source = "./modules/s3"
}

module "iot" {
  source = "./modules/iot"
}

module "lambda" {
  source = "./modules/lambda"
  s3_bucket = module.s3.bucket_name
}


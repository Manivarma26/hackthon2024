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

module "s3_bucket" {
  source       = "./modules/s3_bucket"
  bucket_name  = "my-hackthon-bucket-${var.environment}"  # Ensure the bucket name is globally unique
  environment  = var.environment
}
/*
module "iot" {
  source = "./modules/iot"
}

module "lambda" {
  source = "./modules/lambda"
  s3_bucket = module.s3.bucket_name
}
*/

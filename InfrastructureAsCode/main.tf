terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    datadog = {
      source = "DataDog/datadog"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region = "us-west-2"
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

provider "datadog" {
  api_key = var.datadog_api_key
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "hackthon-bucket-2024" 
  aws_region  = "us-east-1"
  acl         = "private"
  versioning  = true
  tags        = {
    Environment = "hackthon"
    Name        = "hackthon"
  }
}

module "iot" {
  source                       = "./modules/iot"
  thing_name                   = "MyIoTThing"
  policy_name                  = "MyIoTPolicy"
  policy_document              = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "iot:Connect",
          "iot:Publish",
          "iot:Subscribe",
          "iot:Receive"
        ]
        Resource = "*"
      }
    ]
  })
  existing_certificate_arn     = "arn:aws:iot:us-east-1:742945646871:cert/a10c8764f8c557963d27497e685f67c1b8d753f45eabaf8edacf57a97fcbeed0"  # Replace with your existing certificate ARN
  attach_existing_certificate  = true  # Set to true to use the existing certificate
  s3_bucket_name               = module.s3.bucket_name
  topic_name                   = "hackthon"
  datadog_api_key              = var.datadog_api_key  # Pass API key to IoT module
  datadog_app_key              = var.datadog_app_key
  s3_bucket_arn                = module.s3.hackthon_arn
  certificate_pem              = file("modules/certificate/a10c8764f8c557963d27497e685f67c1b8d753f45eabaf8edacf57a97fcbeed0-certificate.pem.crt")
  private_key                  = file("modules/certificate/a10c8764f8c557963d27497e685f67c1b8d753f45eabaf8edacf57a97fcbeed0-private.pem.key")
  root_ca                      = file("modules/certificate/AmazonRootCA1.pem") 
}

module "datadog" {
  source      = "./modules/datadog"
  datadog_api_key = var.datadog_api_key
  datadog_app_key = var.datadog_app_key
}

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
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
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
  source          = "./modules/iot"
  thing_name      = "MyIoTThing"
  policy_name     = "MyIoTPolicy"
  policy_document = jsonencode({
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
  create_certificate = true
  certificate_csr    = "YOUR_CERTIFICATE_CSR"
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

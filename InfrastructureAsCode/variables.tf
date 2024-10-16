variable "aws_access_key_id" {
  description = "AWS access key ID"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "datadog_api_key" {
  description = "Datadog API key for logging"
  type        = string
  sensitive   = true
}
variable "datadog_app_key" {
  description = "Datadog APP key for logging"
  type        = string
  sensitive   = true
}


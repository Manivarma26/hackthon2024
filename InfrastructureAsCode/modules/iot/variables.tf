variable "existing_certificate_arn" {
  description = "The ARN of an existing IoT Certificate"
  type        = string
  default     = ""
}

variable "attach_existing_certificate" {
  description = "Whether to use an existing certificate"
  type        = bool
  default     = false
}

variable "s3_bucket_name" {
  description = "The name of the existing S3 bucket where IoT data will be sent"
  type        = string
}

variable "topic_name" {
  description = "The IoT topic to listen to"
  type        = string
}
variable "datadog_api_key" {
  description = "API key for Datadog"
  type        = string
}

variable "datadog_app_key" {
  description = "APP key for Datadog"
  type        = string
}

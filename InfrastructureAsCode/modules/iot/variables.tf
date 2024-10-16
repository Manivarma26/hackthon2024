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
variable "thing_name" {
  description = "The name of the IoT thing"
  type        = string
}

variable "policy_name" {
  description = "The name of the IoT policy"
  type        = string
}

variable "policy_document" {
  description = "The JSON document that defines the policy"
  type        = string
}
variable "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  type        = string
}
variable "certificate_arn" {
  description = "The ARN of the manually created IoT certificate"
  type        = string
}

variable "certificate_pem" {
  description = "The PEM file of the certificate"
  type        = string
}

variable "private_key" {
  description = "The private key file of the certificate"
  type        = string
}

variable "root_ca" {
  description = "The root CA certificate"
  type        = string
}

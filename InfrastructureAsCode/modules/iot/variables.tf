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

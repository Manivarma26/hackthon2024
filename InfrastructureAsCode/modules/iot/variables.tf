variable "thing_name" {
  description = "The name of the IoT Thing"
  type        = string
}

variable "policy_name" {
  description = "The name of the IoT Policy"
  type        = string
}

variable "policy_document" {
  description = "The JSON policy document"
  type        = string
}

variable "create_certificate" {
  description = "Whether to create a certificate"
  type        = bool
  default     = true
}

variable "certificate_csr" {
  description = "The certificate signing request (CSR)"
  type        = string
}

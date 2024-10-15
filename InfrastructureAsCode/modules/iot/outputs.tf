output "thing_arn" {
  description = "The ARN of the IoT Thing"
  value       = aws_iot_thing.this.arn
}

output "policy_arn" {
  description = "The ARN of the IoT Policy"
  value       = aws_iot_policy.this.arn
}

output "certificate_arn" {
  description = "The ARN of the IoT Certificate"
  value       = aws_iot_certificate.this[0].arn
}

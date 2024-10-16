output "thing_arn" {
  description = "The ARN of the IoT Thing"
  value       = aws_iot_thing.iot.arn
}

output "policy_arn" {
  description = "The ARN of the IoT Policy"
  value       = aws_iot_policy.iot.arn
}

output "certificate_arn" {
  description = "The ARN of the IoT Certificate"
  value       = aws_iot_certificate.iot[0].arn
}
output "certificate_arn" {
  value = var.certificate_arn
}

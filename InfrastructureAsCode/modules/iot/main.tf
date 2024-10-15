resource "aws_iot_thing" "iot" {
  name = var.thing_name
}

resource "aws_iot_policy" "iot" {
  name   = var.policy_name
  policy = var.policy_document
}

# Use existing certificate ARN if available
resource "aws_iot_thing_principal_attachment" "iot" {
  count = var.attach_existing_certificate ? 1 : 0

  thing_name = aws_iot_thing.iot.name
  principal  = var.existing_certificate_arn
}

# Attach policy to the existing certificate
resource "aws_iot_policy_attachment" "iot" {
  count = var.attach_existing_certificate ? 1 : 0

  policy_name = aws_iot_policy.iot.name
  target      = var.existing_certificate_arn
}

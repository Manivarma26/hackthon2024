resource "aws_iot_thing" "iot" {
  name = var.thing_name
}

resource "aws_iot_policy" "iot" {
  name   = var.policy_name
  policy = var.policy_document
}

resource "aws_iot_certificate" "iot" {
  count = var.create_certificate ? 1 : 0

  csr = var.certificate_csr
  status = "ACTIVE"
}

resource "aws_iot_thing_principal_attachment" "iot" {
  count = var.create_certificate ? 1 : 0

  thing_name      = aws_iot_thing.iot.name
  principal       = aws_iot_certificate.iot[0].arn
}

resource "aws_iot_policy_attachment" "iot" {
  count = var.create_certificate ? 1 : 0

  policy_name = aws_iot_policy.iot.name
  target      = aws_iot_certificate.iot[0].arn
}


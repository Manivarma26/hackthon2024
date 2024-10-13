resource "aws_iot_thing" "this" {
  name = "MyESP32"
}

resource "aws_iot_policy" "this" {
  name   = "MyIoTPolicy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = ["iot:Connect", "iot:Publish", "iot:Subscribe", "iot:Receive"],
      Resource = "*"
    }]
  })
}

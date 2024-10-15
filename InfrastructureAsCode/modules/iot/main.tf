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

resource "aws_cloudwatch_log_group" "iot_log_group" {
  name              = "iot-log-group"  # Change to your desired log group name
  retention_in_days = 7  # Optional: Set retention period
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Effect = "Allow",
        Sid = ""
      }
    ]
  })
}

resource "aws_lambda_function" "datadog_logger" {
  function_name = "datadog_logger"

  handler = "lambda_function.lambda_handler"
  runtime = "python3.8"  # or your preferred runtime

  role = aws_iam_role.lambda_execution_role.arn

  source_code_hash = filebase64sha256("lambda/lambda_function.zip")  # Adjust path to your zipped function

  environment = {
    DD_API_KEY = var.datadog_api_key
  }
}

resource "aws_iot_topic_rule" "iot" {
  name        = "${var.thing_name}-to-s3"
  description = "Send IoT data to S3 bucket and CloudWatch"

  sql = "SELECT * FROM '${var.topic_name}'"

  rule_disabled = false

  aws_s3 {
    bucket_name = var.s3_bucket_name
    key         = "${var.thing_name}/${timestamp()}.json"
    role_arn    = aws_iam_role.iot_s3_role.arn
  }

  cloudwatch_logs {
    log_group_name = aws_cloudwatch_log_group.iot_log_group.name  # Reference the log group created above
    role_arn       = aws_iam_role.iot_cloudwatch_role.arn
  }

  lambda {
    function_arn = aws_lambda_function.datadog_logger.arn
  }
}

resource "aws_iam_policy" "iot_cloudwatch_policy" {
  name        = "iot_cloudwatch_policy"
  description = "Policy to allow IoT to write to CloudWatch Logs"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_iot_cloudwatch_policy" {
  role       = aws_iam_role.iot_cloudwatch_role.name
  policy_arn = aws_iam_policy.iot_cloudwatch_policy.arn
}

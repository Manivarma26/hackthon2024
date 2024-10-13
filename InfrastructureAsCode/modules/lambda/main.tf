resource "aws_lambda_function" "this" {
  function_name = "DataProcessor"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"

  s3_bucket = var.s3_bucket
  s3_key    = "lambda.zip"  # Change as necessary

  environment {
    BUCKET_NAME = var.s3_bucket
  }
}


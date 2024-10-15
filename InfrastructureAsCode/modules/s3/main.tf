resource "aws_s3_bucket" "s3-bucket" {
  bucket = "${var.environment}-${var.name}"
}


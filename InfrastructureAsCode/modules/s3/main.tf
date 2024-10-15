resource "aws_s3_bucket" "hackthon" {
  bucket = var.bucket_name
  acl    = var.acl
}

resource "aws_s3_bucket_public_access_block" "hackthon" {
  bucket = aws_s3_bucket.hackthon.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}


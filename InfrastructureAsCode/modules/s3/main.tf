resource "aws_s3_bucket" "this" {
  bucket = "your-unique-bucket-name"
}

output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}

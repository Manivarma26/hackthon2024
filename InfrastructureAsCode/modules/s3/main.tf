resource "aws_s3_bucket" "this" {
  bucket = "hackathon2024IOT"
}

output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}

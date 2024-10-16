output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.hackthon.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.hackthon.arn
}
output "bucket_name" {
  value = aws_s3_bucket.hackthon.id
}

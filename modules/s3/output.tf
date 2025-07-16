output "bucket_name" {
  description = "Artifact S3 bucket name"
  value       = aws_s3_bucket.artifact_bucket.id
}

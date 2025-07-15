resource "aws_s3_bucket" "artifact" {
  bucket = var.bucket_name
  force_destroy = true
  tags = {
    Name = "artifact-bucket"
  }
}
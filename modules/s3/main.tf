resource "aws_s3_bucket" "artifact_bucket" {
  bucket        = "vite-test-ci-cd-sit-bucket25" # 🔁 Change if needed
  force_destroy = true
}

resource "aws_codebuild_project" "awscodebuild" {
  name          = var.project_name
  buildspec     = var.buildspec_file
  service_role  = var.service_role_arn
  artifacts {
    type     = "S3"
    location = var.artifact_bucket
  }
  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:5.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true
  }
  source {
    type     = "GITHUB"
    location = "https://github.com/${var.github_owner}/${var.github_repo}"
  }
}
resource "aws_codebuild_project" "build" {
  name          = "vite-react-build"
  description   = "Builds the Vite + React app"
  build_timeout = 5
  service_role  = "arn:aws:iam::068760013706:role/codebuild-role"  # ✅ Hardcoded

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type     = "BUILD_GENERAL1_SMALL"
    image            = "aws/codebuild/standard:6.0"
    type             = "LINUX_CONTAINER"
    privileged_mode  = false
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = "buildspec.yaml"
  }

  tags = {
    Environment = "dev"
    Name        = "vite-react-codebuild"
  }
}

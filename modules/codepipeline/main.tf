resource "aws_codepipeline" "vite_pipeline" {
  name     = "vite-react-pipeline"
  role_arn = "arn:aws:iam::068760013706:role/codepipeline-role"  # ✅ Hardcoded

  artifact_store {
    location = "vite-test-ci-cd-sit-bucket25"  # ✅ Replace with your actual S3 bucket name
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "SourceAction"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = "arn:aws:codestar-connections:ap-south-1:068760013706:connection/ee543607-fa74-4104-b63b-c3b9e8979bd8"  # ✅ Replace with your connection ARN
        FullRepositoryId = "asish915/devops-project"
        BranchName       = "main"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "BuildAction"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = "vite-react-build"  # ✅ Replace with your CodeBuild project name
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "DeployAction"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeploy"
      input_artifacts = ["build_output"]
      version         = "1"

      configuration = {
        ApplicationName     = "vite-react-app"      # ✅ Replace with your CodeDeploy App name
        DeploymentGroupName = "vite-react-group"    # ✅ Replace with your CodeDeploy group name
      }
    }
  }
}


module "s3" {
  source      = "./modules/s3"
  bucket_name = "devops-artifact-bucket"         # change it
}

module "iam" {
  source = "./modules/iam"
}

module "codebuild" {
  source           = "./modules/codebuild"
  project_name     = "demo-build"                # change it
  buildspec_file   = "buildspec.yaml"
  service_role_arn = module.iam.codebuild_role_arn
  artifact_bucket  = module.s3.bucket_name
  github_owner     = "asish915"                 # change it
  github_repo      = "devops-demo"              # change it
}

module "codedeploy" {
  source   = "./modules/codedeploy"
  app_name = "demo-codedeploy-app"              # change it
}

module "codestar" {
  source        = "./modules/codestar"
  codestar_name = "codestar-connection"          # change it
}

module "codepipeline" {
  source            = "./modules/codepipeline"
  pipeline_name     = "demo-pipeline"                    # change it
  role_arn          = module.iam.pipeline_role_arn
  artifact_bucket   = module.s3.bucket_name
  github_connection = module.codestar.codestar_connection_arn
  codebuild_project = module.codebuild.project_name
  github_owner      = "asish915"                         # change it
  github_repo       = "devops-demo"                      # change it
  github_branch     = "main"
}

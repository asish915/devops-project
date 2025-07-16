output "codebuild_project_name" {
  value = module.codebuild.build_project_name
}

output "codedeploy_app_name" {
  value = module.codedeploy.codedeploy_app_name
}

output "codedeploy_group_name" {
  value = module.codedeploy.group_name
}

output "codepipeline_role_arn" {
  value = module.iam.codepipeline_role_arn
}

output "codebuild_role_arn" {
  value = module.iam.codebuild_role_arn
}

output "codedeploy_service_role_arn" {
  value = module.iam.codedeploy_service_role_arn
}

output "ec2_instance_profile_name" {
  value = module.iam.ec2_profile_name
}

output "artifact_bucket" {
  value = module.s3.bucket_name
}

output "github_codestar_connection_arn" {
  value = module.iam.github_codestar_connection_arn
}


output "codebuild_role_arn" {
  value = aws_iam_role.codebuild_role.arn
}

output "codepipeline_role_arn" {
  value = aws_iam_role.codepipeline_role.arn
}

output "codedeploy_service_role_arn" {
  value = aws_iam_role.codedeploy_service_role.arn
}

output "ec2_profile_name" {
  value = aws_iam_instance_profile.ec2_profile.name
}

output "github_codestar_connection_arn" {
  value = aws_codestarconnections_connection.github_connection.arn
}

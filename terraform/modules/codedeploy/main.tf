resource "aws_codedeploy_app" "app" {
  name             = var.app_name
  compute_platform = var.compute_platform
}

resource "aws_codedeploy_deployment_group" "group" {
  app_name              = aws_codedeploy_app.app.name
  deployment_group_name = var.deployment_group_name
  service_role_arn      = var.service_role_arn
  deployment_config_name = var.deployment_config_name

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }
}

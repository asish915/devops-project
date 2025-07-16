resource "aws_codedeploy_app" "app" {
  name             = "vite-react-app"
  compute_platform = "Server"
}

resource "aws_codedeploy_deployment_group" "group" {
  app_name              = aws_codedeploy_app.app.name
  deployment_group_name = "vite-react-group"
  service_role_arn      = "arn:aws:iam::068760013706:role/codedeploy-service-role"  # ✅ Hardcoded

  deployment_style {
  deployment_type   = "IN_PLACE"
  deployment_option = "WITHOUT_TRAFFIC_CONTROL"  # ✅ No ELB needed
}

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "dummy-target"
    }
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }
}

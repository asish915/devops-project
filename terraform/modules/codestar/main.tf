resource "aws_codestarconnections_connection" "connection" {
  name           = var.codestar_name
  provider_type = "GitHub"
}
resource "aws_codestarconnections_connection" "github" {
  name          = "asish-git-connection"
  provider_type = "GitHub"
}

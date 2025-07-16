output "codestar_connection_arn" {
  description = "CodeStar GitHub connection ARN"
  value       = aws_codestarconnections_connection.github.arn
}

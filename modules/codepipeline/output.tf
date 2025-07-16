output "pipeline_name" {
  description = "Name of the CodePipeline"
  value       = aws_codepipeline.vite_pipeline.name
}

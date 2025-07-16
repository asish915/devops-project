output "dummy_instance_id" {
  description = "ID of EC2 instance used for deployment"
  value       = aws_instance.test-ec2.id
}

resource "aws_instance" "test-ec2" {
  ami                         = "ami-0f7016196fac4fd5d" # ✅ Amazon Linux 2
  instance_type               = "t2.micro"
  key_name                    = "DevOps_mumbai1"         # 🔁 Change this
  subnet_id                   = "subnet-0e7598753b990a358"       # 🔁 Change this
  vpc_security_group_ids      = ["sg-0b6daf7dd174071b8"]         # 🔁 Change this
  iam_instance_profile        = "ec2_codedeploy_profile"   # ✅ Must exist
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y ruby wget nginx
              cd /home/ec2-user
              wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
              chmod +x ./install
              ./install auto
              systemctl start codedeploy-agent
              systemctl enable codedeploy-agent
              systemctl start nginx
              mkdir -p /home/ec2-user/app
              chown ec2-user:ec2-user /home/ec2-user/app
              EOF

  tags = {
    Name = "dummy-target"
  }
}



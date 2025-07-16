terraform {
  backend "s3" {
    bucket         = "test-ci-cd-sit-bucket" # 🔁 Change this
    key            = "state/terraform.tfstate"
    region         = "ap-south-1"
    
  }
}
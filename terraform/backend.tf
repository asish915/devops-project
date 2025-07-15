terraform {
  backend "s3" {
    bucket = "your-tfstate-bucket"                 # change it
    key    = "devops/terraform.tfstate"
    region = "ap-south-1"
  }
}
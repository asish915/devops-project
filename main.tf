provider "aws" {
  region = "ap-south-1"  # ✅ Hardcoded region
}

# --------------------------------------------
# IAM Module (Creates IAM roles and instance profile)
# --------------------------------------------
module "iam" {
  source = "./modules/iam"
}

# --------------------------------------------
# S3 Module (Creates artifact storage bucket)
# --------------------------------------------
module "s3" {
  source = "./modules/s3"
}

# --------------------------------------------
# CodeBuild Module (Uses hardcoded IAM role ARN inside)
# --------------------------------------------
module "codebuild" {
  source = "./modules/codebuild"
  # ❌ No variable passed — hardcoded inside module
}

# --------------------------------------------
# CodeDeploy Module (Uses hardcoded IAM role ARN inside)
# --------------------------------------------
module "codedeploy" {
  source = "./modules/codedeploy"
  # ❌ No variable passed — hardcoded inside module
}

# --------------------------------------------
# CodePipeline Module (Uses hardcoded ARNs and names inside)
# --------------------------------------------
module "codepipeline" {
  source = "./modules/codepipeline"
  # ❌ No variables passed — all hardcoded
}

# --------------------------------------------
# EC2 Instance Module (Uses hardcoded instance profile and values)
# --------------------------------------------
module "ec2" {
  source = "./modules/ec2"
  # ❌ No variable passed — profile name hardcoded in module
}


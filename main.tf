terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.3"
    }
  }
}


provider "aws" {
  region = ap-south-1  #Provided here
}

module "s3" {
  source = "./modules/s3"
}

module "iam" {
  source = "./modules/iam"
}

module "codebuild" {
  source = "./modules/codebuild"
}

module "codedeploy" {
  source = "./modules/codedeploy"
}

module "codepipeline" {
  source = "./modules/codepipeline"
}

module "ec2" {
  source = "./modules/ec2"
}

module "codestar" {
  source = "./modules/codestar"
}


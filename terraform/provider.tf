terraform {
  required_providers {
    aws = "~> 2.59"
  }
}

provider "aws" {
  profile = "aws-dev-account"
  region  = var.aws_region
}

terraform {
  backend "s3" {
    profile = "aws-dev-account"
    bucket  = "terraform-statefile-ap-southeast-1"
    key     = "practice-1/terraform.tfstate"
    region  = "ap-southeast-1"
  }
}

terraform {
  backend "s3" {
    bucket  = "terraform-gitactions"
    region  = "us-east-2"
    key     = "terraform/terraform.tfstate"
    encrypt = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.17.47"
      source  = "hashicorp/aws"
    }
  }
}
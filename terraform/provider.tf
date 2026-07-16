terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "price-tracker-tfstate-083141433364"
    key            = "price-tracker/terraform.tfstate"
    region         = "ap-south-2"
    dynamodb_table = "price-tracker-tf-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-south-2"
}
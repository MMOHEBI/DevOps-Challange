terraform {
  backend "s3" {
    bucket         = "terraform-state-file-2021"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "devOps-tf-state-lock"
  }
}

provider "aws" {
  region     = "us-east-1"
  version    = "4.5.0"
  }

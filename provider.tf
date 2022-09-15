terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.30.0"
    }
  }

  backend "s3" {
    bucket = "project-code-786"
    key    = "project/terraform.tfstate"
    region = "us-east-1"
  }

}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

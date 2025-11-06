terraform {
  backend "s3" {
    bucket         = "vermah-roche-terraform-bucket"
    key            = "dev/vermah/terraform.tfstate"
    region         = "ap-southeast-2"
    encrypt        = true
    dynamodb_table = "vermah-roche-table1" # Optional, for state locking    
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-southeast-2"
}


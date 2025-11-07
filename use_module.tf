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

module "vermah-module-ec2" {
    source = "./modules/ec2"
    vm-name = "vermah-vmby-module-dayfinal"
    vm-size = "t2.nano"
    ec2-key-name = "vermah-module-dayfinal"
    vermah-ami-id = "ami-0a25a306450a2cba3"
    private-key-algo = "RSA"
    key-size = 4096
    my-vpc-id = "vpc-02d56e9aa1ce2f114"
    my-sec-group-name = "vermah-day3-sec-group-name"  
    novm = 2
}
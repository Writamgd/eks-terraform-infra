terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket         = "writam-eks-terraform-state"
    key            = "eksdemo/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "eks-terraform-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
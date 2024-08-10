terraform {
  cloud {
    organization = "metnversi-org"
    workspaces {
      name = "terraform-aws-instance"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.62.0"
    }
    tls = {
      source = "hashicorp/tls"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-southeast-2"
}







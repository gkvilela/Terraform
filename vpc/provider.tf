terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.73.0"
    }
  }

  required_version = ">= 0.13.0"

  backend "s3" {
    bucket = "s3-pessoal-ec2-cka"
    key    = "terraform/k8s/dev/vpc/project.tfstate"
    region = "us-east-1"
  }

}


provider "aws" {
    region = var.region
}

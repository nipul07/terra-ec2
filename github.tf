terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "eu-west-2"
  
}

# Configure the GitHub Provider
provider "github" {
  token = ""
}

resource "github_repository" "terra-ec2" {
  name        = "terra-ec2"
  description = "My awesome codebase"

  visibility = "public"
}

resource "aws_instance" "ec2_instance" {
    ami = "ami-0b1b00f4f0d09d131"
    count = "1"
    instance_type = "t2.micro"
    key_name = "oscar"
    subnet_id   = "subnet-03eb8c3e7ebe830aa"
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"

backend "s3" {
    bucket = "hudneb-bucket"
    key    = "hudneb-state"
    region = "eu-west-2"
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0b25f6ba2f4419235"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
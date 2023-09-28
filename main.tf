terraform {
  required_providers {
    aws = {
      source  = "registry.terraform.io/hashicorp/aws"
      version = "~> 4.67.0"
    }
  }
  required_version = ">= 1.2.0"
  backend "s3" {
    bucket         = "a-terra-bucket"
    key            = "terraform-state"
    region         = "eu-west-2"
    dynamodb_table = "terra-table"
  }
}
provider "aws" {
  region  = "eu-west-2"
  profile = "terraform2"
}
resource "aws_instance" "our_instance" {
  ami           = "ami-0b25f6ba2f4419235"
  instance_type = "t3.micro"
  tags = {
    Name = "a-instance"
  }
  vpc_security_group_ids = [aws_security_group.a_secgroup.id]
}
data "aws_vpc" "default_vpc" {
  id = "vpc-080dbb0b7dc86503a"
}
resource "aws_security_group" "a_secgroup" {
  name        = "a_secgroup"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.default_vpc.id
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

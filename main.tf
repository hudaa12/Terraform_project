terraform {
  backend "s3" {
    bucket = "hudneb-bucket"
    key    = "~/.aws/credentials"
    region = "eu-west-2"
  }
}

provider "aws" {
  region = "eu-west-2"
  profile = "terraform"
  aws_access_key = "aws_access_key_2"
  aws_secret_key = "aws_secret_key_2"
}


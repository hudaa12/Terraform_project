terraform {
  backend "s3" {
    bucket = "hudneb-bucket"
    key    = "terraform/terraform.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  region = "eu-west-2"
  shared_credentials_files = "~/.aws/credentials"
  profile = "hudneb-profile"
}


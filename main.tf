terraform {
  backend "s3" {
    bucket = "hudneb-bucket"
    key    = "terraform/dev/state.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  region = "eu-west-2"
  profile = "my-profile"
}


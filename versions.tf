
terraform {
  backend "s3" {
    bucket = "terramybucket"
    key    = "test-final/tfstate/terraform.tfstate"
    region = "us-east-2"
  }

  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key =  var.ACCESS_KEY_ID_1
  secret_key =  var.SECRET_ACCESS_KEY_1
}


provider "aws" {
  region     = var.region
  alias      = "Account-2"
  access_key =  var.ACCESS_KEY_ID_2
  secret_key =  var.SECRET_ACCESS_KEY_2
}



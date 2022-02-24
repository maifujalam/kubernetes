terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.57.0"
    }
  }
  required_version = ">= 0.14"
#  backend "s3" {
#    # Note:- Dynamic variable is not allowed hare.Must be static variable used inside backend.
#    bucket                  = "bucket-1-20211029094001439600000001"
#    key                     = "terraform.tfstate.d/cluster-3"
#    region                  = "us-east-2"
#    shared_credentials_file = "~/.aws/credentials"
#  }
}

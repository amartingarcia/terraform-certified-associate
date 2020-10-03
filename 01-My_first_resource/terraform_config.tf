# Terraform config

## AWS Provider
provider "aws" {
  region = "eu-west-1"
  #access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  #secret_key = "PUT-YOUR-SECRET-KEY-HERE"
  version = "~> 2.55.0"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 0.13"
}

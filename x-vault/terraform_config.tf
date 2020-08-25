# Terraform config

## AWS Provider
provider "aws" {
  region = "eu-west-1"
  #access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  #secret_key = "PUT-YOUR-SECRET-KEY-HERE"
  version = "~> 3.0"
}

provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables described above, so that each user can have
  # separate credentials set in the environment.
  #
  # This will default to using $VAULT_ADDR
  # But can be set explicitly
  #
   address = "http://127.0.0.1:8200"
}

## Config
terraform {
  required_version = ">= 0.12"
}

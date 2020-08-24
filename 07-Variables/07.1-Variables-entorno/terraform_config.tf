# Terraform config

## AWS Provider
provider "aws" {
  region     = "eu-west-1"
  #access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  #secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

## Config
terraform {
  required_version = ">= 0.12"
}


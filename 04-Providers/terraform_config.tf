# Terraform config

## AWS Provider
provider "aws" {
  region     = "eu-west-1"
  #access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  #secret_key = "PUT-YOUR-SECRET-KEY-HERE"
  #version = "3.0"
}

## Config
terraform {
  required_version = ">= 0.12"
}


terraform {
  backend "remote" {
    organization = "pcs-nym"

    workspaces {
      name = "iac-demo"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
provider "aws" {
  region = "us-east-1"
}

# Create a random string
resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}
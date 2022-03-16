terraform {
  backend "remote" {
    organization = "balmeida"

    workspaces {
      name = "iac-demo"
    }
  }
}

provider "google" {
  project     = "pcs-demo-322918 "
  credentials = var.GOOGLE_CREDENTIALS
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_storage_bucket" "my-bucket" {
  name                        = "my-bucket"
  location                    = "us-central1"
  force_destroy               = true
  uniform_bucket_level_access = true
}

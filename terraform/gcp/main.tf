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
  labels = {
    git_commit           = "8d6166848c257e5261ed4f86ea19115a721b8314"
    git_file             = "terraform__gcp__main_tf"
    git_last_modified_at = "2022-03-07-16-35-55"
    git_last_modified_by = "65456094bmppa"
    git_modifiers        = "65456094bmppa"
    git_org              = "bmppa"
    git_repo             = "iac-demo"
    yor_trace            = "508a085e-51db-4b56-9177-c62fec5b31cd"
    Privacy              = ""
  }
}

terraform {
  backend "remote" {
    organization = "balmeida"

    workspaces {
      name = "iac-demo"
    }
  }
}

resource "google_storage_bucket" "my-bucket" {
  name = "my-bucket"
  location = us-central1
  force_destroy = true
  uniform_bucket_level_access = true
}

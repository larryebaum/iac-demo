terraform {
  backend "remote" {
    organization = "balmeida"

    workspaces {
      name = "iac-demo"
    }
  }
}

resource "google_storage_bucket" "my-bucket" {
  name                        = "my-bucket"
  location                    = us-central1
  force_destroy               = true
  uniform_bucket_level_access = true
  labels = {
    git_commit           = "b753af65c4e0200f994a980a2f9d87dce8c56331"
    git_file             = "terraform__gcp__main_tf"
    git_last_modified_at = "2022-03-07-16-04-41"
    git_last_modified_by = "65456094bmppa"
    git_modifiers        = "65456094bmppa"
    git_org              = "bmppa"
    git_repo             = "iac-demo"
    yor_trace            = "5fc8d4d5-224b-4974-b4e9-a6445a26b566"
  }
}

terraform {
  backend "remote" {
    organization = "pcs-nym"

    workspaces {
      name = "iac-demo"
    }
  }
}

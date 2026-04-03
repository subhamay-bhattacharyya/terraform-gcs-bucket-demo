# -- tf/backend.tf

terraform {
  cloud {

    organization = "subhamay-bhattacharyya-projects"

    workspaces {
      name = "terraform-gcs-bucket-demo"
    }
  }
}

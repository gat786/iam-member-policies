terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 6.0.0"
    }
  }
}

provider "google" {
  region  = "asia-south1"
  project = var.project
}

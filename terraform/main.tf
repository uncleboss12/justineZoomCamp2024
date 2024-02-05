# Create new storage bucket in the US multi-region
# with standard storage
terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "5.6.0"
    }
  }
}

provider "google" {
    project = "academic-notch-411819"
    region = "us-west1"
    zone = "us-west1-c"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "justine-own-bucket"
  location      = "US"
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
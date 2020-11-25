provider "aws" {
  version = "3.16.0"
  region = var.aws_config.region
}

provider "google" {
  version = "3.48.0"
  
  project = "tymoshenko"
  region  = "us-central1"
  zone    = "us-central1-c"
}

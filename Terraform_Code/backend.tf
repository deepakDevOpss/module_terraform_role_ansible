terraform {
  backend "s3" {
    bucket  = "place-state-file"
    key     = "terraform.tfstate"
    encrypt = true
    region  = "us-east-1"
  }
}

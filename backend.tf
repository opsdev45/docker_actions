terraform {
  backend "s3" {
    bucket = "terraform-state-ofir-9"
    key = "terraform.tfstate"
    region = "us-west-2"
  }
}

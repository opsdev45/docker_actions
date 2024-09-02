terraform {
  backend "s3" {
    bucket = "terraform-state-ofir-9"
    region = "us-west-2"
  }
}

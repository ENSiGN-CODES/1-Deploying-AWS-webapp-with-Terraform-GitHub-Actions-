terraform {
  backend "s3" {
    bucket         = "tfstate-for-locking"
    key            = "terraform.tfstate"
    region         = "eu-south-1"
    dynamodb_table = "state_table"
  }
}

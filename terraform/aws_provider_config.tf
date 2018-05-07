provider "aws" {
  region                  = "us-east-1"                           # provider credentials
  shared_credentials_file = "${pathexpand("~/.aws/credentials")}"
}

resource "aws_vpc" "rest-vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags {
    Name = "aws-rest-vpc"
  }
}

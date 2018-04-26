provider "aws" {
  region                  = "us-east-2"                           # provider credentials
  shared_credentials_file = "${pathexpand("~/.aws/credentials")}"
}

resource "aws_vpc" "rest-vpc" {
  cidr_block           = "${var.vpc_cidr}"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags {
    Name = "aws-rest-vpc"
  }
}

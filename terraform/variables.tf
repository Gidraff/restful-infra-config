# variable

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}
variable "my_ip" {}

variable "aws_region" {
  description = "AMIs region"
  default     = "us-east-2"
}

variable "amis" {
  description = "AMIs by region"

  default = {
    us-east-2 = "ami-0df37a0d82fc78654"
  }
}

variable "vpc_cidr" {
  description = "A cidr block for the vpc"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "cidr for the public subnet"
  default     = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "private subnet cidr"
  default     = "10.0.1.0/24"
}

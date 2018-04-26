# configurations for subnets
resource "aws_subnet" "public-subnet" {
  vpc_id            = "${aws_vpc.rest-vpc.id}"    # public subnet
  cidr_block        = "${var.public_subnet_cidr}"
  availability_zone = "us-east-2a"

  tags {
    Name = "public-sub"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id            = "${aws_vpc.rest-vpc.id}"     # private subnet
  cidr_block        = "${var.private_subnet_cidr}"
  availability_zone = "us-east-2a"

  tags {
    Name = "private-sub"
  }
}

# configurations for subnets
resource "aws_subnet" "public-subnet" {
  vpc_id            = "${aws_vpc.rest-vpc.id}"    # public subnet
  cidr_block        = "${var.public_subnet_cidr}"
  availability_zone = "us-east-1a"

  tags {
    Name = "public-sub"
  }

  depends_on = ["aws_internet_gateway.igw"]
}

resource "aws_subnet" "private-subnet" {
  vpc_id            = "${aws_vpc.rest-vpc.id}"     # private subnet
  cidr_block        = "${var.private_subnet_cidr}"
  availability_zone = "us-east-1b"

  tags {
    Name = "private-sub"
  }
}

resource "aws_network_acl" "rest-nacl" {
  vpc_id = "${aws_vpc.rest-vpc.id}"

  ingress {
    protocol   = "-1"
    rule_no    = 1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 2
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags {
    Name = "rest-nacl"
  }
}

# Create route table
resource "aws_route_table" "public-rt1" {
  vpc_id = "${aws_vpc.rest-vpc.id}" # public subnet route table

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name = "public-rt"
  }
}

resource "aws_route_table" "private-rt2" {
  vpc_id = "${aws_vpc.rest-vpc.id}"

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = "${aws_instance.nat-instance.id}"
  }

  tags {
    Name = "private-rt"
  }
}

# Associate route table to rest-vpc
resource "aws_main_route_table_association" "main-rt-association" {
  vpc_id         = "${aws_vpc.rest-vpc.id}"
  route_table_id = "${aws_route_table.public-rt1.id}"
}

# Associate route table to public subnet
resource "aws_route_table_association" "public-sub-association" {
  subnet_id      = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.public-rt1.id}"
}

# Associate route table to private subnet
resource "aws_route_table_association" "private-sub-association" {
  subnet_id      = "${aws_subnet.private-subnet.id}"
  route_table_id = "${aws_route_table.private-rt2.id}"
}

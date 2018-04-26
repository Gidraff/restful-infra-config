# Associates the vpc with internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.rest-vpc.id}"

  tags {
    Name = "rest-igw"
  }
}

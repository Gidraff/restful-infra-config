# Nat Instance configurations
resource "aws_instance" "nat-instance" {
  ami                    = "ami-0919cbaf44821c743"             # # bastion host server
  availability_zone      = "us-east-1a"
  instance_type          = "t2.micro"
  key_name               = "${var.aws_key_name}"
  vpc_security_group_ids = ["${aws_security_group.nat-sg.id}"]
  subnet_id              = "${aws_subnet.public-subnet.id}"

  tags {
    Name = "vpc-nat"
  }

  depends_on = ["aws_subnet.public-subnet"]
}

resource "aws_instance" "jenkins-instance" {
  ami                    = "ami-0ba8f10a3df3ac8bb"                          # jenkins server
  availability_zone      = "us-east-1a"
  instance_type          = "t2.micro"
  key_name               = "${var.aws_key_name}"
  vpc_security_group_ids = ["${aws_security_group.jenkins-instance-sg.id}"]
  subnet_id              = "${aws_subnet.public-subnet.id}"

  tags {
    Name = "jenkins-instance"
  }

  depends_on = ["aws_subnet.public-subnet"]
}

resource "aws_instance" "postgres-instance" {
  ami                    = "ami-0a9d49e12beb24c5f"                           # postgresql server
  availability_zone      = "us-east-1b"
  instance_type          = "t2.micro"
  key_name               = "${var.aws_key_name}"
  vpc_security_group_ids = ["${aws_security_group.postgres-instance-sg.id}"]
  subnet_id              = "${aws_subnet.private-subnet.id}"
  private_ip             = "10.0.1.22"

  tags {
    Name = "db-instance"
  }

  depends_on = ["aws_subnet.private-subnet"]
}

resource "aws_instance" "api-instance" {
  ami                    = "ami-074ac88449455ba97"                      # api server
  availability_zone      = "us-east-1a"
  instance_type          = "t2.micro"
  key_name               = "${var.aws_key_name}"
  vpc_security_group_ids = ["${aws_security_group.api-instance-sg.id}"]
  subnet_id              = "${aws_subnet.public-subnet.id}"

  tags {
    Name = "api-instance"
  }

  depends_on = ["aws_subnet.public-subnet"]
}

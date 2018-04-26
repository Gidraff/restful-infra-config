resource "aws_security_group" "nat-sg" {
  name        = "nat-sg"
  description = "Allow access to the private subnet instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.private_subnet_cidr}"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.rest-vpc.id}"

  tags {
    Name = "natsg"
  }
}

resource "aws_security_group" "jenkins-instance-sg" {
  name        = "jenkins-sg"
  description = "jenkins instance security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.rest-vpc.id}"

  tags {
    Name = "jenkins-sg"
  }
}

# Nat Instance configurations
resource "aws_instance" "nat-instance" {
  ami                         = "ami-021e3167"                      # # bastion host server
  availability_zone           = "us-east-2a"
  instance_type               = "t2.micro"
  key_name                    = "${var.aws_key_name}"
  vpc_security_group_ids      = ["${aws_security_group.nat-sg.id}"]
  subnet_id                   = "${aws_subnet.public-subnet.id}"
  associate_public_ip_address = true
  source_dest_check           = false

  tags {
    Name = "vpc-nat"
  }
}

resource "aws_instance" "jenkins-instance" {
  ami                         = "${lookup(var.amis, var.aws_region)}"            # jenkins server
  availability_zone           = "us-east-2a"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.mykey.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.jenkins-instance-sg.id}"]
  subnet_id                   = "${aws_subnet.public-subnet.id}"
  associate_public_ip_address = true
  source_dest_check           = false

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "jenkins-instance"
  }
}

resource "aws_instance" "postgres-instance" {
  ami                         = "${lookup(var.amis, var.aws_region)}"             # postgresql server
  availability_zone           = "us-east-2a"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.mykey.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.postgres-instance-sg.id}"]
  subnet_id                   = "${aws_subnet.private-subnet.id}"
  associate_public_ip_address = false
  source_dest_check           = false

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "jenkins-instance"
  }
}

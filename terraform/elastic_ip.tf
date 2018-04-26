resource "aws_eip" "jenkins-eip" {
  instance = "${aws_instance.jenkins-instance.id}" # aws elastic ip address for jenkins instance
  vpc      = true
}

resource "aws_eip" "nat-eip" {
  instance = "${aws_instance.nat-instance.id}" # aws elastic ip for nat instance
  vpc      = true
}

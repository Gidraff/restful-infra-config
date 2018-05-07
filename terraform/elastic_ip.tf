resource "aws_eip" "jenkins-eip" {
  instance   = "${aws_instance.jenkins-instance.id}" # aws elastic ip address for jenkins instance
  vpc        = true
  depends_on = ["aws_internet_gateway.igw"]
}

resource "aws_eip" "nat-eip" {
  instance   = "${aws_instance.nat-instance.id}" # aws elastic ip for nat instance
  vpc        = true
  depends_on = ["aws_internet_gateway.igw"]
}

resource "aws_eip" "api-eip" {
  instance   = "${aws_instance.api-instance.id}" # aws elastic ip for api instance
  vpc        = true
  depends_on = ["aws_internet_gateway.igw"]
}

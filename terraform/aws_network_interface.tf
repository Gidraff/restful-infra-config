# resource "aws_network_interface" "ms-eni" {
#   name            = "ms-network-interface"
#   description     = "Network interface"
#   subnet_id       = "${aws_subnet.public-subnet.id}"
#   private_ips     = ["10.1.254.10"]
#   security_groups = "${aws_security_groups.ms-sg.id}"
#   attachment {
#     instance     = "${aws_instance.ms-jenkins-instance.id}"
#     device_index = 1
#   }
# }


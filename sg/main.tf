#resource "aws_security_group" "allow_tl" {
#  name = "allow_tl"
#  description = "Allow TLS inbound traffic"
#
#  ingress {
#    description = "TLS from VPC"
#    from_port = 0
#    to_port = 0
#    protocol = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#    from_port = 0
#    to_port = 0
#    protocol = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#    ipv6_cidr_blocks = ["::/0"]
#  }
#
#  tags = {
#    Name = "allow_tl"
#  }
#}
#
#output "sg_id" {
#  value = aws_security_group.allow_tl.id
#}
#data "aws_ami" "ami" {
#  most_recent = true
#  name_regex  = "Centos-8-DevOps-Practice"
#  owners      = ["973714476881"]
#}
#
#
#resource "aws_spot_instance_request" "ec2" {
#  ami                    = data.aws_ami.ami.id
#  instance_type          = var.instance_type
#  vpc_security_group_ids = [var.sg_id]
#  wait_for_fulfillment   = true
#
#  tags = {
#    Name = var.component
#  }
#}
#
#variable "component" {}
#variable "instance_type" {}
#variable "sg_id" {}
#
#
#output "private_ip" {
#  value = aws_spot_instance_request.ec2.private_ip
#}
#
#output "public_ip" {
#  value = aws_spot_instance_request.ec2.public_ip


data "aws_instance" "ips" {
  instance_tags = {
    Name = "workstation"
  }
}
data "aws_instance" "ipss" {
  instance_tags = {
    Name = "jenkins"
  }
}

output "pu1w" {
  value = data.aws_instance.ips.public_ip
}
output "pr1w" {
  value = data.aws_instance.ips.private_ip
}

output "pu2j" {
  value = data.aws_instance.ipss.public_ip
}
output "pr2j" {
  value = data.aws_instance.ipss.private_ip
}

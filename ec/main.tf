data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}


resource "aws_spot_instance_request" "ec2" {
  ami                    = data.aws_ami.ami.id
  instance_type          = "t3.micro"

  tags = {
    Name = "ec2"
  }
}

#data "aws_ami" "ami" {
#  most_recent = true
#  name_regex  = "Centos-8-DevOps-Practice"
#  owners      = ["973714476881"]
#}
#
#
#resource "aws_spot_instance_request" "ec2" {
#  ami                    = data.aws_ami.ami.id
#  instance_type          = t2.micro
#  vpc_security_group_ids = [var.sg_id]
#  wait_for_fulfillment   = true
#
#  tags = {
#    Name = var.component
#  }
#}
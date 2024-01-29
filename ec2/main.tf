data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}


resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = var.component
  }
}

variable "component" {}
variable "instance_type" {}
variable "sg_id" {}


output "privateip" {
  value = aws_instance.ec2.private_ip
}

output "publicip" {
  value = aws_instance.ec2.public_ip
}






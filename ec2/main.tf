data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "centos-8-ansible-image"
  owners      = ["667211563329"]
}


resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = var.component
  }
}

resource "null_resource" "provisioner" {
  provisioner "remote-exec" {

    connection {
      host = aws_instance.ec2.public_ip
      user = "root"
      password = "DevOps321"
    }

    inline = [
      "ansible-pull -i localhost -U https://github.com/purnavr/roboshop-ansible.git roboshop.yml -e role_name=${var.component}"
    ]

  }
}

resource "aws_security_group" "sg" {
  name = "${var.component}-${var.env}-sg"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.component}-${var.env}-sg"
  }
}

resource "aws_route53_record" "records" {
  zone_id = "Z01280802SKTCPOFIGWX3"
  name    = "${var.component}.roboz.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.ec2.private_ip]
}

variable "component" {}
variable "instance_type" {}
#variable "sg_id" {}
variable "env" {
  default = "dev"
}
#variable "private_ip" {}


#output "privateip" {
#  value = aws_instance.ec2.private_ip
#}
#
#output "publicip" {
#  value = aws_instance.ec2.public_ip
#}










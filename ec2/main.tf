data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "centos-8-ansible-image"
  owners      = ["667211563329"]
}


resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = var.component
  }

  provisioner "remote-exec" {

    connection {
      host = self.public_ip
      user = "centos"
      password = "DevOps321"
    }

    inline = [
      "ansible-pull -i localhost -U https://github.com/purnavr/roboshop-ansible.git roboshop.yml -e role_name=${var.component}"
    ]

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








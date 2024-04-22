data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "centos-8-ansible-image"
  owners      = ["self"]
}

data "aws_ssm_parameter" "ssh_pass" {
  name = "${var.env}.ssh.pass"
}
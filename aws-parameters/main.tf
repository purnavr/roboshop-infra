resource "aws_ssm_parameter" "par" {
  count = length(var.parameters)
  name = var.parameters[count.index].name
  type = var.parameters[count.index].type
  value = var.parameters[count.index].value
}

variable "parameters" {}

resource "aws_ssm_parameter" "secrets" {
  count = length(var.secrets)
  name = var.secrets[count.index].name
  type = var.secrets[count.index].type
  value = var.secrets[count.index].value
}

variable "secrets" {}

resource "aws_ssm_parameter" "jenkins_user" {
  name = "jenkins.user"
  type = "String"
  value = "admin"
}

resource "aws_ssm_parameter" "jenkins_pass" {
  name = "jenkins.pass"
  type = "SecureString"
  value = "admin123"
}


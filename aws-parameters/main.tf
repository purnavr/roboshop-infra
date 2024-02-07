resource "aws_ssm_parameter" "parameters" {
  for_each = var.parameters
  name = each.value[name]
  type = each.value[type]
  value = each.value[value]
}

variable "parameters" {}
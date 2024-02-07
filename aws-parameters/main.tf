resource "aws_ssm_parameter" "par" {
  for_each = var.parameters
  name = each.value["name"]
  type = each.value["type"]
  value = each.value["value"]
}

variable "parameters" {}
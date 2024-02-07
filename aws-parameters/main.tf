resource "aws_ssm_parameter" "par" {
  count = length(var.parameters)
  name = count.index["name"]
  type = count.index["type"]
  value = count.index["value"]
}

variable "parameters" {}
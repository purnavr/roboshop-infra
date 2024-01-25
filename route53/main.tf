resource "aws_route53_record" "record" {
  name    = "${var.component}-roboz.online"
  type    = "A"
  ttl     = 30
  records = [var.private_ip]
  zone_id = "Z01280802SKTCPOFIGWX3"
}

variable "component" {}
variable "private_ip" {}
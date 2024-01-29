resource "aws_route53_record" "records" {
  zone_id = "Z01280802SKTCPOFIGWX3"
  name    = "${var.component}-roboz.online"
  type    = "A"
  ttl     = 30
  records = [var.private_ip]
}

variable "component" {}
variable "private_ip" {}


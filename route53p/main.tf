resource "aws_route53_record" "public_rc" {
  zone_id = "Z01280802SKTCPOFIGWX3"
  name    = "roboz.online"
  type    = "A"
  ttl     = 30
  records = [var.public_ip]
}

variable "public_ip" {}
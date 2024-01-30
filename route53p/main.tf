resource "aws_route53_record" "public_rc" {
  zone_id = "Z01280802SKTCPOFIGWX3"
  name    = "roboz.online"
  type    = "A"
  ttl     = 30
  records = ["34.230.6.218"]
}

resource "aws_route53_record" "public_rcc" {
  zone_id = "Z01280802SKTCPOFIGWX3"
  name    = "roboz.online"
  type    = "A"
  ttl     = 30
  records = ["35.173.185.71"]
}
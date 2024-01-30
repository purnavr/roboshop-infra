resource "aws_route53_record" "publicc" {
  zone_id = "Z01280802SKTCPOFIGWX3"
  name    = "frontend.online"
  type    = "A"
  ttl     = 30
  records = ["52.230.9.2"]
}

resource "aws_route53_record" "public" {
  zone_id = "Z01280802SKTCPOFIGWX3"
  name    = "roboz.online"
  type    = "A"
  ttl     = 30
  records = ["41.173.18.73"]
}
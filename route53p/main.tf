resource "aws_route53_record" "public_rc" {
  zone_id = "Z01280802SKTCPOFIGWX3"
  name    = "roboz.online"
  type    = "A"
  ttl     = 30
  records = ["34.230.6.218"]
}
#variable "public_ip" {}
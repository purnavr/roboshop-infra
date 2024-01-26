#resource "aws_route53_record" "records" {
#  zone_id = "Z01280802SKTCPOFIGWX3"
#  name    = "${var.component}-roboz.online"
#  type    = "A"
#  ttl     = 30
#  records = [var.private_ip]
#}
#
#variable "component" {}
#variable "private_ip" {}
#
#resource "aws_route53_record" "records" {
#  zone_id = "Z01280802SKTCPOFIGWX3"
#  name    = "roboz.online"
#  type    = "A"
#  ttl     = 30
#  records = [var.public_ip]
#}
#variable "public_ip" {}

#resource "aws_route53_record" "records" {
#  zone_id = "Z01280802SKTCPOFIGWX3"
#  name    = "roboz.online"
#  type    = "A"
#  ttl     = 30
#  records = [34.229.160.180]
#}

#variable "component" {}
#variable "private_ip" {}
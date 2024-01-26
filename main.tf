#module "ec2" {
#  for_each      = var.instances
#  source        = "./ec2"
#  component     = each.value["name"]
#  instance_type = each.value["type"]
#  sg_id         = module.sg.sg_id
#
#}
#
#module "sg" {
#  source = "./sg"
#}
#
#module "route53" {
#  for_each = var.instances
#  source = "./route53"
#  component = each.value["name"]
#  private_ip = module.ec2[each.value["name"]].private_ip
#  public_ip = module.ec2["user"].public_ip
#}
#module "ec2" {
#  source = "./ec2"
#}
#module "dns" {
#  for_each = var.names
#  source = "./route53"
#  component = each.value["name"]
#  private_ip = module.ec2.pr1w
#}

resource "aws_route53_record" "records" {
  zone_id = "Z01280802SKTCPOFIGWX3"
  name    = "roboz.online"
  type    = "A"
  ttl     = 30
  records = [34.229.160.180]
}
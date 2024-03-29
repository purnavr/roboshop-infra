module "ec2" {
  for_each      = var.instances
  source        = "./ec2"
  component     = each.value["name"]
  instance_type = each.value["type"]
  sg_id         = module.sg.sg_id
}

#output "ec2" {
#  value = module.ec2.privateip
#}

module "sg" {
  source = "./sg"
}

#module "route53" {
#  for_each = var.instances
#  source = "./route53"
#  component = each.value["name"]
#  private_ip = module.ec2[each.value["name"]].privateip
#}
#
#module "route53p" {
#  source = "./route53p"
#  public_ip = module.ec2["catalogue"].publicip
#}


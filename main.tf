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
module "ec2" {
  source = "./ec2"
}
module "dns" {
  count = length(var.names)
  source = "./route53"
  component = count.index
  private_ip = module.ec2[count.index].pr1w


}
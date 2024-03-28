module "vpc" {
  source = "git::https://github.com/purnavr/tf-module-vpc.git"
  env    = var.env
  tags = var.tags
  default_route_table = var.default_route_table
  default_vpc_id = var.default_vpc_id

  for_each = var.vpc
  vpc_cidr_block = each.value["vpc_cidr_block"]
  public_subnets = each.value["public_subnets"]
  private_subnets = each.value["private_subnets"]
}

#output "vpc" {
#  value = module.vpc
#}

output "vpc" {
  value = local.db_subnet_ids
}

module "docdb" {
  source = "git::https://github.com/purnavr/tf-module-docdb.git"
  env = var.env
  tags = var.tags
  for_each = var.docdb
  engine = each.value["engine"]
  engine_version = each.value["engine_version"]
  backup_retention_period = each.value["backup_retention_period"]
  preferred_backup_window = each.value["preferred_backup_window"]
  skip_final_snapshot = each.value["skip_final_snapshot"]
  no_of_instances = each.value["no_of_instances"]
  instance_class = each.value["instance_class"]
  subnet_ids = local.db_subnet_ids

}

#module "rds" {
#  source = "git::https://github.com/purnavr/tf-module-rds.git"
#  env = var.env
#  tags = var.tags
#
#  subnet_ids = local.db_subnet_ids
#
#  for_each = var.rds
#  engine = each.value["engine"]
#  engine_version = each.value["engine_version"]
#  backup_retention_period = each.value["backup_retention_period"]
#  preferred_backup_window = each.value["preferred_backup_window"]
#}

locals {
  db_subnet_ids = tolist([module.vpc["main"].private_subnets["db-az1"].id, module.vpc["main"].private_subnets["db-az2"].id])
}

##locals {
##  ## private_subnets
##  private_subnets_ids = {for k, v in module.vpc["main"].private_subnets : k => v.id }
##}
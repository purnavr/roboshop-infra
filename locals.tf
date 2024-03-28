locals {
  db_subnet_ids = tolist([module.vpc["main"].private_subnets["db-az1"], module.vpc["main"].private_subnets["db-az2"]])
#  app_subnet_ids = tolist([module.vpc["main"].private_subnets["app-az1"], module.vpc["main"].private_subnets["app-az2"]])
#  web_subnet_ids = tolist([module.vpc["main"].private_subnets["web-az1"], module.vpc["main"].private_subnets["web-az2"]])
}

#locals {
#  ## private_subnets
#  private_subnets_ids = {for k, v in module.vpc["main"].private_subnets : k => v.id }
#}
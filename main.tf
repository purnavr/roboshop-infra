module "vpc" {
  source        = "git::https://github.com/purnavr/tf-module-vpc.git"
  for_each      = var.vpc
  vpc_cidr      = each.value["vpc_cidr"]
  env           = var.env
}



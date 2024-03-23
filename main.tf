module "vpc" {
  source = "git::https://github.com/purnavr/tf-module-vpc.git"
  env = var.env
  tags = var.tags
  for_each = var.vpc
  vpc_cidr = each.value["vpc_cidr"]
  public_subnets = each.value["public_subnets"]
  cidr_block = each.value["cidr_block"]
  name = each.value["name"]
}


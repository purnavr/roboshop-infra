module "vpc" {
  source = "git::https://example.com/vpc.git"
  env = var.env
  for_each = var.vpc
  vpc_cidr = each.value["vpc_cidr"]
}


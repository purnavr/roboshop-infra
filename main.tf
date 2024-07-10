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

output "vpc" {
  value = module.vpc
}

#output "alb" {
#  value = module.alb
#}

#output "vpc" {
#  value = local.db_subnet_ids
#}

module "docdb" {
  source = "git::https://github.com/purnavr/tf-module-docdb.git"
  env = var.env
  tags = var.tags

  vpc_id = module.vpc["main"].vpc_id

  for_each = var.docdb
  engine = each.value["engine"]
  engine_version = each.value["engine_version"]
  backup_retention_period = each.value["backup_retention_period"]
  preferred_backup_window = each.value["preferred_backup_window"]
  skip_final_snapshot = each.value["skip_final_snapshot"]
  no_of_instances = each.value["no_of_instances"]
  instance_class = each.value["instance_class"]
  subnet_ids = local.db_subnet_ids
  allow_subnets = lookup(local.subnet_cidr, each.value["allow_subnets"], null )
}

module "rds" {
  source = "git::https://github.com/purnavr/tf-module-rds.git"
  env = var.env
  tags = var.tags

  subnet_ids = local.db_subnet_ids
  vpc_id = module.vpc["main"].vpc_id

  for_each = var.rds
  engine = each.value["engine"]
  engine_version = each.value["engine_version"]
  backup_retention_period = each.value["backup_retention_period"]
  preferred_backup_window = each.value["preferred_backup_window"]
  no_of_instances = each.value["no_of_instances"]
  instance_class = each.value["instance_class"]
  allow_subnets = lookup(local.subnet_cidr, each.value["allow_subnets"], null)
}

module "elasticache" {
  source = "git::https://github.com/purnavr/tf-module-elasticache.git"
  env = var.env
  tags = var.tags

  subnet_ids = local.db_subnet_ids
  vpc_id = module.vpc["main"].vpc_id

  for_each = var.elasticache
  engine = each.value["engine"]
  node_type = each.value["node_type"]
  num_cache_nodes = each.value["num_cache_nodes"]
  engine_version = each.value["engine_version"]
  port = each.value["port"]
  allow_subnets = lookup(local.subnet_cidr, each.value["allow_subnets"], null)
}

module "rabbitmq" {
  source = "git::https://github.com/purnavr/tf-module-rabbitmq.git"
  env = var.env
  tags = var.tags

  subnet_ids = local.db_subnet_ids
  dns_domain = var.dns_domain
  bastion_cidr = var.bastion_cidr
  vpc_id = module.vpc["main"].vpc_id

  for_each = var.rabbitmq
  instance_type = each.value["instance_type"]
  allow_subnets = lookup(local.subnet_cidr, each.value["allow_subnets"], null)
}

module "alb" {
  source = "git::https://github.com/purnavr/tf-module-alb.git"
  env = var.env
  tags = var.tags

  vpc_id = module.vpc["main"].vpc_id

  for_each = var.alb
  name = each.value["name"]
  internal = each.value["internal"]
  load_balancer_type = each.value["load_balancer_type"]
  subnets = lookup(local.subnet_ids, each.value["subnet_name"], null)
  allow_cidr = each.value["allow_cidr"]
}



module "app" {

  depends_on = [module.vpc, module.docdb, module.rds, module.elasticache, module.rabbitmq, module.alb]

  source = "git::https://github.com/purnavr/tf-module-app.git"
  env = var.env
  tags = var.tags

  vpc_id = module.vpc["main"].vpc_id

  bastion_cidr = var.bastion_cidr
  monitoring_nodes = var.monitoring_nodes
  dns_domain = var.dns_domain

  for_each = var.apps
  component = each.value["component"]
  instance_type = each.value["instance_type"]
  desired_capacity = each.value["desired_capacity"]
  max_size = each.value["max_size"]
  min_size = each.value["min_size"]
  subnets = lookup(local.subnet_ids, each.value["subnet_name"], null )
  port = each.value["port"]
  allow_app_to = lookup(local.subnet_cidr, each.value["allow_app_to"], null )
  alb_dns_name = lookup(lookup(lookup(module.alb, each.value["alb"], null), "alb", null), "dns_name", null)
  listener_arn = lookup(lookup(lookup(module.alb, each.value["alb"], null), "listener", null), "arn", null)
  listener_priority = each.value["listener_priority"]
  parameters = each.value["parameters"]
}


### Load Runner
resource "aws_spot_instance_request" "load-runner" {
  ami           = data.aws_ami.ami.id
  instance_type = "t3.medium"
  wait_for_fulfillment = true
  vpc_security_group_ids = ["sg-0497e25cd969a429f"]

  tags = merge(var.tags, { Name = "load-runner"})

}

resource "aws_ec2_tag" "name-tag" {
  resource_id = aws_spot_instance_request.load-runner.spot_instance_id
  key         = "Name"
  value       = "load-runner"
}

resource "null_resource" "load-gen" {
  triggers = {
    abc = aws_spot_instance_request.load-runner.public_ip
  }
  provisioner "remote-exec" {
    connection {
      host = aws_spot_instance_request.load-runner.public_ip
      user = "root"
      password = data.aws_ssm_parameter.ssh_pass.value
      type = "ssh"
    }
    inline = [
      "cd /etc/yum.repos.d/",
      "sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*,",
      "sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*",
      "curl -s -L https://get.docker.com | bash",
      "systemctl enable docker",
      "systemctl start docker",
      "docker pull robotshop/rs-load"
    ]
  }
}


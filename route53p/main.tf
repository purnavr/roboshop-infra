module "rt" {
  for_each = var.route
  source = "./rt"
  component = each.value["name"]
}
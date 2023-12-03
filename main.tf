module "components" {
  source = "git::https://github.com/SPOORNACHANDRA/tf-module-vpc.git"
  for_each = var.vpc
  Cidr = each.value["cidr"]
  subnets = each.value
}
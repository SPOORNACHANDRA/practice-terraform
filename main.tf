module "components" {
  source = "git::https://github.com/SPOORNACHANDRA/tf-module-vpc.git"
  for_each = var.vpc
  subnets = each.value
}
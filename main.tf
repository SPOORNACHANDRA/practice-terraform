module "components" {
  source = "git::https://github.com/SPOORNACHANDRA/practice-tf-module-vpc.git"
  for_each = var.vpc
  Cidr = each.value["cidr"]
  subnets = each.value
}
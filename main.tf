module "vpc" {
  source = "git::https://github.com/SPOORNACHANDRA/practice-tf-module-vpc.git"
  for_each = var.vpc
  cidr = each.value["cidr"]
}

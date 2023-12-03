module "vpc" {
  source = "git::https://wwwigithub.com/S.POORNACHANDRA/practice-tf-module-vpc.git"
  for_each = var.vpc
  cidr = each.value["cidr"]
}




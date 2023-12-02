module "components" {
  source = "git::https://www.github.com/SPOORNACHANDRA/practice-tf-module-vpc.git"

  for_each = var.vpc

}
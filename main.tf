module "vpc" {
  source   = "git::https://github.com/SPOORNACHANDRA/practice-tf-module-vpc.git"
  for_each = var.vpc      #this is for how many times i have to iterate
  cidr = each.value["cidr"]
  subnets = each.value["subnets"]
}






#output "vpc" {
#  #this is printing
#  value = module.vpc
#
#}
module "vpc" {
  source   = "git::https://github.com/SPOORNACHANDRA/practice-tf-module-vpc.git"
  for_each = var.vpc      #this is for how many times i have to iterate
  cidr = each.value["cidr"]   # this cidr whole value is sending to tf-module-vpc
  subnets = each.value["subnets"] # this subnets whole value is sending to tf-module-vpc
}


#output "vpc" {            #this is printing
#  value = module.vpc
#}

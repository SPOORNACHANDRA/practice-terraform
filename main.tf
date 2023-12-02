module "components" {
  source = "git::https://github.com/SPOORNACHANDRA/practice-tf-module-vpc.git"
  cidr = "10.0.0.0/16"
}
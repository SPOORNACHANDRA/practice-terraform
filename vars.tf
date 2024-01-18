variable "vpc" {}     #this is variable for module in main.tf in roboshop-terraform-v1 and we are sending to main.tf module
variable "default_vpc_id" {}
variable "default_vpc_cidr" {}
variable "default_vpc_route_table_id" {}
variable "tags" {}
variable "env" {}
variable "alb" {}
variable "docdb" {}
variable "rds" {}
variable "elasticache" {}
variable "rabbitmq" {}
variable "zone_id" {}
variable "app" {}
variable "ssh_ingress_cidr" {}
variable "monitoring_ingress_cidr" {}



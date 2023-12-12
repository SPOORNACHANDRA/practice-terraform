variable "vpc" {}     #this is variable for module in main.tf in roboshop-terraform-v1 and we are sending to main.tf module
variable "default_vpc_id" {}
variable "default_vpc_cidr" {}
variable "default_vpc_route_table_id" {}
variable "tags" {}
variable "env" {}
variable "alb" {}
variable "docdb" {}
variable "backup_retention_period" {}
variable "preferred_backup_window" {}
variable "skip_final_snapshot" {}
variable "vpc_id" {}
variable "sg_ingress_cidr" {}



vpc = {
  main = {
    cidr    = "11.0.0.0/16"
    subnets = {
      public = {
        public1 = { cidr = "11.0.0.0/24", az = "us-east-1a" }
        public2 = { cidr = "11.0.1.0/24", az = "us-east-1b" }
      }
      app = {
        app1 = { cidr = "11.0.2.0/24", az = "us-east-1a" }
        app2 = { cidr = "11.0.3.0/24", az = "us-east-1b" }
      }
      db = {
        db1 = { cidr = "11.0.4.0/24", az = "us-east-1a" }
        db2 = { cidr = "11.0.5.0/24", az = "us-east-1b" }
      }
    }
  }
}

default_vpc_id             = "vpc-033b3aa1458aef7b1"
default_vpc_cidr           = "172.31.0.0/16"
default_vpc_route_table_id = "rtb-0428dc4fcf14ee4d3"

tags = {
  company_name  = "abc tech"
  business_unit = "ECommerce"
  project_Name  = "roboshop"
  cost_center   = "ecom_rs"
  created_by    = "terraform"
}
env = "dev"

alb = {
  public = {
    lb_type         = "application"
    internal        = false
    sg_ingress_cidr = ["0.0.0.0/0"]
    sg_port         = 443
  }
  private = {
    lb_type         = "application"
    internal        = true
    sg_ingress_cidr = ["172.31.0.0/16", "11.0.0.0/16"]
    sg_port         = 80
  }
}

docdb = {
  main = {
    backup_retention_period = 5
    preferred_backup_window = "07:00-09:00"
    skip_final_snapshot     = true
    engine_version          = "4.0.0"
#    engine_family           = "docdb4.0"
  }
}

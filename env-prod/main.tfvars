default_vpc_id             = "vpc-0fac6343d7a175d11"
default_vpc_cidr           = "172.31.0.0/16"
default_vpc_route_table_id = "rtb-090d55d6faa0a6626"
zone_id                    = "Z095093821BU1FHHF63BW"
env                        = "Prod"
ssh_ingress_cidr           = ["172.31.37.156/32"]# this is a bastion or workstation is only allow to ssh
monitoring_ingress_cidr    = ["172.31.46.19/32"]
# acm_certificate_arn        = "arn:aws:acm:us-east-1:633788536644:certificate/ad9f90f9-1f68-48a2-87d4-d31c6d91a0cc"
# kms_key_id                 = "arn:aws:kms:us-east-1:633788536644:key/dce90622-5a23-4f82-a639-be841f534702"

tags = {
  company_name  = "ABC Tech"
  business_unit = "Ecommerce"
  project_name  = "robotshop"
  cost_center   = "ecom_rs"
  created_by    = "terraform"
}

vpc = {
  main = {
    cidr    = "10.50.0.0/16"
    subnets = {
      public = {
        public1 = { cidr = "10.50.0.0/24", az = "us-east-1a" }
        public2 = { cidr = "10.50.1.0/24", az = "us-east-1b" }
      }
      app = {
        app1 = { cidr = "10.50.2.0/24", az = "us-east-1a" }
        app2 = { cidr = "10.50.3.0/24", az = "us-east-1b" }
      }
      db = {
        db1 = { cidr = "10.50.4.0/24", az = "us-east-1a" }
        db2 = { cidr = "10.50.5.0/24", az = "us-east-1b" }
      }
    }
  }
}


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
    sg_ingress_cidr = ["172.31.0.0/16", "10.50.0.0/16"]
    sg_port         = 80
  }
}

docdb = {
  main = {
    backup_retention_period = 5
    preferred_backup_window = "07:00-09:00"
    skip_final_snapshot     = true
    engine_version          = "4.0.0"
    engine_family           = "docdb4.0"
    instance_count          = 1
    instance_class          = "db.t3.medium"
  }
}

rds = {
  main = {
    rds_type                = "mysql"
    db_port                 = 3306
    engine_family           = "aurora-mysql5.7"
    engine                  = "aurora-mysql"
    engine_version          = "5.7.mysql_aurora.2.11.3"
    backup_retention_period = 5
    preferred_backup_window = "07:00-09:00"
    skip_final_snapshot     = true
    instance_count          = 1
    instance_class          = "db.t3.small"
  }
}

elasticache = {
  main = {
    elasticache_type = "redis"
    family           = "redis6.x"
    port             = 6379
    engine           = "redis"
    node_type        = "cache.t3.micro"
    num_cache_nodes  = 1
    engine_version   = "6.2"
  }
}

rabbitmq = {
  main = {

    instance_type = "t3.small"
  }
}

app = {
  frontend = {
    instance_type    = "t3.small"
    port             = 80
    desired_capacity = 2
    max_size         = 10
    min_size         = 2
    lb_priority      = 1
    lb_type          = "public"
    parameters       = ["nexus"]
    tags             = {monitor_nginx = "yes"}
  }
  catalogue = {
    instance_type    = "t3.small"
    port             = 8080
    desired_capacity = 2
    max_size         = 10
    min_size         = 2
    lb_priority      = 2
    lb_type          = "private"
    parameters       = ["docdb","nexus"]
    tags             = {}
  }
  user = {
    instance_type    = "t3.small"
    port             = 8080
    desired_capacity = 2
    max_size         = 10
    min_size         = 2
    lb_priority      = 3
    lb_type          = "private"
    parameters       = ["docdb","nexus"]
    tags             = {}

  }
  cart = {
    instance_type    = "t3.small"
    port             = 8080
    desired_capacity = 2
    max_size         = 10
    min_size         = 2
    lb_priority      = 4
    lb_type          = "private"
    parameters       = ["nexus"]
    tags             = {}
  }
  payment = {
    instance_type    = "t3.small"
    port             = 8080
    desired_capacity = 2
    max_size         = 10
    min_size         = 2
    lb_priority      = 5
    lb_type          = "private"
    parameters       = ["rabbitmq","nexus"]
    tags             = {}
  }
  shipping = {
    instance_type    = "t3.small"
    port             = 8080
    desired_capacity = 2
    max_size         = 10
    min_size         = 2
    lb_priority      = 6
    lb_type          = "private"
    parameters       = ["rds" ,"nexus"]
    tags             = {}
  }
}




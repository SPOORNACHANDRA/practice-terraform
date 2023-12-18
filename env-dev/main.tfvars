default_vpc_id             = "vpc-033b3aa1458aef7b1"
default_vpc_cidr           = "172.31.0.0/16"
default_vpc_route_table_id = "rtb-0428dc4fcf14ee4d3"
zone_id= "Z07143353VCC4QLIJE3K9"
env = "dev"
ssh_ingress_cidr = ["172.31.36.38/32"]     # this is a bastion or workstation is only allow to ssh


tags = {
  company_name  = "abc tech"
  business_unit = "ECommerce"
  project_Name  = "roboshop"
  cost_center   = "ecom_rs"
  created_by    = "terraform"
}

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


alb = {
  public = {
    lb_type         = "application"
    internal        = false
    sg_ingress_cidr = ["0.0.0.0/0"]
    sg_port         = 80
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
    engine_family = "docdb4.0"
    instance_count=1
    instance_class="db.t3.medium"
  }
}

rds = {
  main = {
    rds_type= "mysql"
    db_port= 3306
    engine_family= "aurora-mysql5.7"
    engine= "aurora-mysql"
    engine_version= "5.7.mysql_aurora.2.11.3"
    backup_retention_period= 5
    preferred_backup_window= "07:00-09:00"
    skip_final_snapshot     = true
    instance_count=1
    instance_class="db.t3.small"
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
      # this is a bastion or workstation is only allow to ssh
    instance_type = "t3.small"
  }
}

app = {
  frontend = {
    instance_type = "t3.micro"
    port= 80
    desired_capacity   = 1
    max_size           = 3
    min_size           = 1
  }
  user = {
    instance_type = "t3.micro"
    port= 8080
    desired_capacity   = 1
    max_size           = 3
    min_size           = 1
  }
  cart = {
    instance_type = "t3.micro"
    port= 8080
    desired_capacity   = 1
    max_size           = 3
    min_size           = 1
  }
  payment = {
    instance_type = "t3.micro"
    port= 8080
    desired_capacity   = 1
    max_size           = 3
    min_size           = 1
  }
  shipping = {
    instance_type = "t3.micro"
    port= 8080
    desired_capacity   = 1
    max_size           = 3
    min_size           = 1
  }
}

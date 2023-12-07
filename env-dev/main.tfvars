vpc = {
  main = {
    cidr = "11.0.0.0/16"
    subnets = {
      public = {
        public1 = {cidr = "11.0.0.0/24", az = "us-east-1a"}
        public2 = {cidr = "11.0.1.0/24", az = "us-east-1b"}
      }
      app = {
        app1 = {cidr = "11.0.2.0/24", az = "us-east-1a"}
        app2 = {cidr = "11.0.3.0/24", az = "us-east-1b"}
      }
      db = {
        db1 = {cidr = "11.0.4.0/24", az = "us-east-1a"}
        db2 = {cidr = "11.0.5.0/24", az = "us-east-1b"}
      }
    }
  }
}


vpc = {
  main = {
    cidr = "10.0.0.0/16"
    subnets = {
      public = { cidr = "10.0.0.0/24", az = "us-east-1a"}
      app = {cidr = "10.0.2.0/24", az = "us-east-1a"}
      db = { cidr = "10.0.4.0/24", az = "us-east-1a"}
    }
  }
}
























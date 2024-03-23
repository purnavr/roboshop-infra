env = "dev"

vpc = {
  main = {
    vpc_cidr_block = "10.0.0.0/16"
  }
  public_subnets = {
    public-az1 = {
      name = "public-az1"
      cidr_block = "10.0.0.0/24"
      availability_zone = "us-east-1a"
    }
    public-az2 = {
      name = "public-az2"
      cidr_block = "10.0.1.0/24"
      availability_zone = "us-east-1b"
    }
  }
}

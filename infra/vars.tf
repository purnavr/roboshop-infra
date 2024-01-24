variable "instances" {
  default = {
    catalogue = {
      name = "frontend"
      type = "t2.micro"
    }
    user = {
      name = "mongodb"
      type = "t2.micro"
    }
    user = {
      name = "catalogue"
      type = "t2.micro"
    }
    user = {
      name = "redis"
      type = "t2.micro"
    }
    user = {
      name = "user"
      type = "t2.micro"
    }
    user = {
      name = "cart"
      type = "t2.micro"
    }
    user = {
      name = "mysql"
      type = "t2.micro"
    }
    user = {
      name = "shipping"
      type = "t2.micro"
    }
    user = {
      name = "rabbitmq"
      type = "t2.micro"
    }
    user = {
      name = "payment"
      type = "t2.micro"
    }
    user = {
      name = "dispatch"
      type = "t2.micro"
    }
  }
}
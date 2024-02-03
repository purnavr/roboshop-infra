variable "instances" {
  default = {
    catalogue = {
      name = "catalogue"
      type = "t3.micro"
    }
    user = {
      name = "frontend"
      type = "t3.micro"
    }
  }
}




variable "instances" {
  default = {
    catalogue = {
      name = "catalogue"
      type = "t3.nano"
    }
    user = {
      name = "frontend"
      type = "t3.nano"
    }
  }
}




variable "instances" {
  default = {
    catalogue = {
      name = "catalogue"
      type = "t3.nano"
    }
    user = {
      name = "user"
      type = "t3.nano"
    }
  }
}


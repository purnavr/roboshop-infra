variable "instances" {
  default = {
    catalogue = {
      name = "catalogue"
      type = "t3.micro"
    }
    frontend = {
      name = "frontend"
      type = "t3.micro"
    }
  }
}

variable "parameters" {}




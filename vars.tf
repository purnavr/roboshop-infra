#variable "instances" {
#  default = {
#    catalogue = {
#      name = "catalogue"
#      type = "t3.micro"
#    }
#    user = {
#      name = "user"
#      type = "t3.micro"
#    }
#  }
#}

variable "names" {
  default = {
    workstation = {
      name = workstation
    }
    jenkins = {
      name = jenkins
    }
  }
}
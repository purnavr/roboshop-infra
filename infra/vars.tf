variable "instances" {
  default = {
    catalogue = {
      name = "frontend"
      type = "t2.micro"
    }
    user = {
      name = "useer"
      type = "t2.micro"
    }
  }
}
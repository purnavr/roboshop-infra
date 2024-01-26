resource "aws_spot_instance_request" "aws" {
  ami = "ami-0f3c7d07486cad139"
  spot_price = "0.010"
  instance_type          = "t3.nano"
  spot_type = "persistent"
}
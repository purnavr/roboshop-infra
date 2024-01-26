resource "aws_spot_instance_request" "ec2" {
  ami                    = "ami-0f3c7d07486cad139"
  instance_type          = "t3.nano"

  tags = {
    Name = "ec2"
  }
}
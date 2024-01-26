resource "aws_spot_instance_request" "ec2" {
  ami                    = "ami-03265a0778a880afb"
  instance_type          = "t3.nano"

  tags = {
    Name = "ec2"
  }
}
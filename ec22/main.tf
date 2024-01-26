resource "aws_spot_instance_request" "ec2" {
  ami                    = "ami-0f3c7d07486cad139"
  spot_price = "0.010"
  instance_type          = "t3.nano"
  spot_type = "persistent"
  block_duration_minutes = "120"
  wait_for_fulfillment   = "true"

  tags = {
    Name = "ec2"
  }
}
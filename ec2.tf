resource "aws_spot_instance_request" "spot" {
  ami                   = data.aws_ami.ami
  instance_type         = var.INSTANCE_TYPE
  wait_for_fulfillment  =  = true

  tags = {
    Name = "CheapWorker"
  }
}
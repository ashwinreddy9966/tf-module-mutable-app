resource "aws_spot_instance_request" "spot" {
  count                 = var.SPOT_INSTANCE_COUNT
  ami                   = data.aws_ami.ami
  instance_type         = var.INSTANCE_TYPE
  wait_for_fulfillment  = true

  tags = {
    Name = "CheapWorker"
  }
}
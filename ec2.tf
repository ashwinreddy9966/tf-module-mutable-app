resource "aws_spot_instance_request" "spot" {
  count                   = var.SPOT_INSTANCE_COUNT
  ami                     = data.aws_ami.ami
  instance_type           = var.INSTANCE_TYPE
  wait_for_fulfillment    = true
  vpc_security_group_ids  = [aws_security_group.allows_app.id]

  tags = {
    Name = "${var.COMPONENT}-${var.ENV}"
  }
}


resource "aws_instance" "OD" {
  count                 = var.OD_INSTANCE_COUNT
  ami                   = data.aws_ami.ami
  instance_type         = var.INSTANCE_TYPE

  tags = {
    Name = "${var.COMPONENT}-${var.ENV}"
  }
}
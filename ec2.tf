resource "aws_spot_instance_request" "spot" {
  count                   = var.SPOT_INSTANCE_COUNT
  ami                     = data.aws_ami.ami.id
  instance_type           = var.INSTANCE_TYPE
  wait_for_fulfillment    = true
  vpc_security_group_ids  = [aws_security_group.allows_app.id]
  subnet_id               = element(data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS, count.index)

  tags = {
    Name = "${var.COMPONENT}-${var.ENV}"
  }
}


resource "aws_instance" "OD" {
  count                   = var.OD_INSTANCE_COUNT
  ami                     = data.aws_ami.ami.id
  instance_type           = var.INSTANCE_TYPE
  vpc_security_group_ids  = [aws_security_group.allows_app.id]
  subnet_id               = element(data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS, count.index)
  tags = {
    Name = "${var.COMPONENT}-${var.ENV}"
  }
}

resource "aws_ec2_tag" "example" {
  count       = var.SPOT_INSTANCE_COUNT + var.OD_INSTANCE_COUNT
  resource_id =  aws_instance.OD.*.id  aws_spot_instance_request.spod.*.id
  key         = "Name"
  value       = "Hello World"
}
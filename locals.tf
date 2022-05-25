locals {
  ALL_INSTANCE_IDS = concat(aws_instance.OD.*.id, aws_spot_instance_request.spot.*.spot_instance_id)
  ALL_INSTANCE_PRIVATE_IPS = concat(aws_instance.OD.*.private_ip , aws_instance.OD.*.private_ip
  }
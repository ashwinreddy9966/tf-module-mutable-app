locals {
  ALL_INSTANCE_IDS = concat(aws_instance.OD.*.id, aws_spot_instance_request.spot.*.spot_instance_id)
}
resource "aws_route53_record" "record" {
  zone_id = data.terraform_remote_state.vpc.outputs.HOSTEDZONE_PRIVATE_ID
  name    = local.DNS_NAME
  type    = "CNAME"
  ttl     = "60"
  records = var.LB_TYPE == "internal" ? [data.terraform_remote_state.alb.outputs.PRIVATE_ALB_ADDRESS] : [data.terraform_remote_state.alb.outputs.PUBLIC_ALB_ADDRESS]
}

locals {
  DNS_NAME = "${var.COMPONENT}-${var.ENV}.${data.terraform_remote_state.vpc.outputs.HOSTEDZONE_PRIVATE_ZONE}"
}
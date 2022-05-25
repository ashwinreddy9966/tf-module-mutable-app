resource "aws_route53_record" "record" {
  zone_id = var.LB_TYPE == "internal" ? data.terraform_remote_state.vpc.outputs.HOSTEDZONE_PRIVATE_ID : data.terraform_remote_state.vpc.outputs.HOSTEDZONE_PUBLIC_ID
  name    = "${var.COMPONENT}-${var.ENV}.${data.terraform_remote_state.vpc.outputs.HOSTEDZONE_PRIVATE_ZONE}"
  name    = "${var.COMPONENT}-${var.ENV}.${data.terraform_remote_state.vpc.outputs.HOSTEDZONE_PRIVATE_ZONE}"
  type    = "CNAME"
  ttl     = "60"
  records = var.LB_TYPE == "internal" ? [data.terraform_remote_state.alb.outputs.PRIVATE_ALB_ADDRESS] : [data.terraform_remote_state.alb.outputs.PUBLIC_ALB_ADDRESS]
}


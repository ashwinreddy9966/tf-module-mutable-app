resource "aws_route53_record" "record" {
  zone_id = data.terraform_remote_state.vpc.outputs.HOSTEDZONE_PRIVATE_ID
  name    = "${var.COMPONENT}-${ENV}.${data.terraform_remote_state.vpc.outputs.HOSTEDZONE_PRIVATE_NAME}"
  type    = "A"
  ttl     = "60"
  records = var.[data.terraform_remote_state.alb.outputs.ALB_ADDRESS]
}
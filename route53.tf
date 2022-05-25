resource "aws_route53_record" "record" {
  zone_id = data.terraform_remote_state.vpc.outputs.HOSTEDZONE_PRIVATE_ID
  name    = "www.example.com"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.lb.public_ip]
}
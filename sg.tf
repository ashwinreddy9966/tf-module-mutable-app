resource "aws_security_group" "allows_app" {
  name        = "roboshop-${var.COMPONENT}-${var.ENV}"
  description = "roboshop-${var.COMPONENT}-${var.ENV}"

  ingress {
    description = "APP PORT"
    from_port   = var.APP_PORT
    to_port     = var.APP_PORT
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name =  "allow-${var.COMPONENT}"
  }
}
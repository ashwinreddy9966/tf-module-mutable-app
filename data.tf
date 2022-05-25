data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "robot-terraform-remote-state"
    key    = "vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "robot-terraform-remote-state"
    key    = "alb/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "rotot-with-ansible-ami"
  owners           = ["self"]
}
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

data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    bucket = "robot-terraform-remote-state"
    key    = "databases/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "rotot-with-ansible-ami"
  owners           = ["self"]
}

data "aws_secretsmanager_secret" "secret" {
  name = "${var.ENV}/roboshop/secrets"
}

data "aws_secretsmanager_secret_version" "secrets" {
  secret_id = data.aws_secretsmanager_secret.secret.id
}

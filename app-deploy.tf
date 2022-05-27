resource "null_resource" "app-deploy" {
  triggers = {
    abc = timestamp()
  }
  count = var.SPOT_INSTANCE_COUNT + var.OD_INSTANCE_COUNT
  provisioner "remote-exec" {
    connection {
      host     = element(local.ALL_INSTANCE_PRIVATE_IPS,count.index)
      user     = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["SSH_USERNAME"]
      password = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["SSH_PASSWORD"]
    }
    inline = [
      "ansible-pull -U https://github.com/ashwinreddy9966/ansible roboshop-pull.yml -e ENV=${var.ENV} -e APP_VERSION=${var.APP_VERSION} -e COMPONENT=${var.COMPONENT} -e MONGODB_ENDPOINT=${data.terraform_remote_state.db.outputs.MONGODB_ENDPOINT}"
    ]
  }
}
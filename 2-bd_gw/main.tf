# get the output of 1-network specifically the network name
data "terraform_remote_state" "zabbix_net" {
  backend = "local"

  config = {
    path = "../all-states/1-network/terraform.tfstate"
  }
}


# get the zabbix gateway docker image
resource "docker_image" "zabbix_gw" {
  name         = var.zbxjgw_image_name
  keep_locally = false
}

# start java gateway container
resource "docker_container" "zabbix_gw" {
  image   = docker_image.zabbix_gw.image_id
  name    = var.zbxjgw_container_name
  restart = "unless-stopped"
  networks_advanced {
    name = data.terraform_remote_state.zabbix_net.outputs.zabbix_network_name
  }

}

# get the MySQL docker image
resource "docker_image" "mysql" {
  name         = var.mysql_image_name
  keep_locally = false
}

# start java gateway container
resource "docker_container" "mysql" {
  image   = docker_image.mysql.image_id
  name    = var.mysql_container_name
  restart = "unless-stopped"
  env     = ["MYSQL_DATABASE=${var.mysql_env.database}", "MYSQL_USER=${var.mysql_env.user}", "MYSQL_PASSWORD=${var.mysql_env.password}", "MYSQL_ROOT_PASSWORD=${var.mysql_env.rootpwd}"]
  command = ["--character-set-server=utf8", "--collation-server=utf8_bin", "--default-authentication-plugin=mysql_native_password"]
  networks_advanced {
    name = data.terraform_remote_state.zabbix_net.outputs.zabbix_network_name
  }

}




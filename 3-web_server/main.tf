# get the output of 1-network specifically the network name
data "terraform_remote_state" "zabbix_net" {
  backend = "local"

  config = {
    path = "../all-states/1-network/terraform.tfstate"
  }
}

# get the output of 2-bd_gw specifically the mysql and java gateway running
data "terraform_remote_state" "bd_gw" {
  backend = "local"

  config = {
    path = "../all-states/2-bd_gw/terraform.tfstate"
  }
}


# get the zabbix server mysql docker image
resource "docker_image" "zabbix_server" {
  name         = var.zbxserver_image_name
  keep_locally = false
}

# start zabbix server mysql container
resource "docker_container" "zabbix_server" {
  image   = docker_image.zabbix_server.image_id
  name    = var.zbxserver_container_name
  restart = "unless-stopped"
  env     = ["MYSQL_DATABASE=${var.mysql_env.database}", "MYSQL_USER=${var.mysql_env.user}", "MYSQL_PASSWORD=${var.mysql_env.password}", "MYSQL_ROOT_PASSWORD=${var.mysql_env.rootpwd}", "DB_SERVER_HOST=${data.terraform_remote_state.bd_gw.outputs.mysql_container_name}", "ZBX_JAVAGATEWAY=${data.terraform_remote_state.bd_gw.outputs.zbxgw_container_name}"]
  networks_advanced {
    name = data.terraform_remote_state.zabbix_net.outputs.zabbix_network_name
  }
  ports {
    internal = 10051
    external = var.zbxserver_container_port
  }

}

# get the Zabbix web docker image
resource "docker_image" "zabbix_web" {
  name         = var.zbxweb_image_name
  keep_locally = false
}

# start Zabbix web container
resource "docker_container" "zabbix_web" {
  image   = docker_image.zabbix_web.image_id
  name    = var.zbxweb_container_name
  restart = "unless-stopped"
  env     = ["MYSQL_DATABASE=${var.mysql_env.database}", "MYSQL_USER=${var.mysql_env.user}", "MYSQL_PASSWORD=${var.mysql_env.password}", "MYSQL_ROOT_PASSWORD=${var.mysql_env.rootpwd}", "DB_SERVER_HOST=${data.terraform_remote_state.bd_gw.outputs.mysql_container_name}", "ZBX_SERVER_HOST=${docker_container.zabbix_server.name}"]
  networks_advanced {
    name = data.terraform_remote_state.zabbix_net.outputs.zabbix_network_name
  }
  ports {
    internal = 8080
    external = var.zbxweb_container_port
  }

}




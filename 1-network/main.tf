# get the nginx docker image
resource "docker_network" "zabbix_net" {
  name = var.zabbix_network
  ipam_config {
    subnet   = var.zabbix_sub
    ip_range = var.zabbix_range
  }
}

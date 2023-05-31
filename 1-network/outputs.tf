# output the container name as an example

output "zabbix_network_name" {
  description = "name of the zabbix network"
  value       = docker_network.zabbix_net.name
}


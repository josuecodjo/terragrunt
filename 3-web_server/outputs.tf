# output the container name as an example

output "zbxserver_container_name" {
  description = "name of the zabbix server container"
  value       = docker_container.zabbix_server.name
}

output "zbxweb_container_name" {
  description = "name of the zabbix web container"
  value       = docker_container.zabbix_web.name
}

output "zbxweb_container_exposed_port" {
  description = "exposed port of the zabbix web container"
  value       = docker_container.zabbix_web.ports[0].external
}
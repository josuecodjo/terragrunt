# output the container name as an example

output "zbxgw_container_name" {
  description = "name of the java gateway container"
  value       = docker_container.zabbix_gw.name
}

output "mysql_container_name" {
  description = "name of the mysql container"
  value       = docker_container.mysql.name
}

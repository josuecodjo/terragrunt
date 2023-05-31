variable "zbxserver_image_name" {
  type        = string
  description = "name of the image of zabbix server instance"
  default     = "zabbix/zabbix-server-mysql:alpine-6.4-latest"
}

variable "zbxserver_container_name" {
  type        = string
  description = "name of the container of zabbix server instance"
  default     = "zabbix-server-mysql"
}

variable "zbxserver_container_port" {
  type        = number
  description = "port of the container of zabbix server instance"
  default     = 10051
}

variable "zbxweb_image_name" {
  type        = string
  description = "name of the image"
  default     = "zabbix/zabbix-web-nginx-mysql:alpine-6.4-latest"
}

variable "zbxweb_container_name" {
  type        = string
  description = "name of the container"
  default     = "zabbix-web-nginx-mysql"
}

variable "zbxweb_container_port" {
  type        = number
  description = "port of the container of zabbix web instance"
  default     = 80
}

variable "mysql_env" {
  type = object({
    database = string
    user     = string
    password = string
    rootpwd  = string
  })
  description = "mysql enviroments variables"
  sensitive   = true
  default = {
    database = "zabbix"
    user     = "zabbix"
    password = "zabbix_pwd"
    rootpwd  = "root_pwd"
  }
}
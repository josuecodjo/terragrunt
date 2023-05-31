variable "zbxjgw_image_name" {
  type        = string
  description = "name of the image"
  default     = "zabbix/zabbix-java-gateway:alpine-6.4-latest"
}

variable "zbxjgw_container_name" {
  type        = string
  description = "name of the container"
  default     = "zabbix-java-gateway"
}

variable "mysql_image_name" {
  type        = string
  description = "name of the image"
  default     = "mysql:8.0-oracle"
}

variable "mysql_container_name" {
  type        = string
  description = "name of the container"
  default     = "mysql-server"
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
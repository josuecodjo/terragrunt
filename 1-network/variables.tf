variable "zabbix_network" {
  type        = string
  description = "name of the network"
  default     = "zabbix"
}

variable "zabbix_sub" {
  type        = string
  description = "subnet"
  default     = "172.20.0.0/16"
}

variable "zabbix_range" {
  type        = string
  description = "ip range"
  default     = "172.20.240.0/20"
}
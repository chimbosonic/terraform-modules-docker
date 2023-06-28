variable "image_name" {
  type = string
}

variable "volumes" {
  type = list(map(string))
  default = []
}

variable "network_id" {
    type = string
}

variable "env_vars" {
    type = list(string)
    default = []
}
variable "name" {
  type = string
}
variable "domain_name" {
type = string
}
variable "service_port" {
  type = string
}
variable "ports" {
  type = list(map(string))
  default = []
}
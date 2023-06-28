variable "image_name" {
  type = string
}

variable "volumes" {
  type = list(map(string))
  default = []
}

variable "ports" {
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
variable "command" {
  type = list(string)
  default = []
}

variable "devices" {
  type = list(map(string))
  default = []
}

variable "labels" {
  type = list(map(string))
  default = []
}

variable "stdin_open" {
  type = bool
  default = false
}

variable "tty" {
  type = bool
  default = false
}
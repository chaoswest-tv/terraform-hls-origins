variable "zone_id" {
  type = string
}

variable "zone_name" {
  type = string
}

variable "hostname" {
  type = string
}

variable "server_type" {
  type    = string
  default = "cpx11"
}

variable "ssh_keys" {
  type = list(string)
}


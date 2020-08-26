variable "zone_name" {
  type    = string
  default = "yolocdn.de"
}

variable "origin_map" {
  type = map(map(string))
}

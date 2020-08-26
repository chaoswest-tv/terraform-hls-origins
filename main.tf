data "hetznerdns_zone" "cdn" {
  name = var.zone_name
}

data "hcloud_ssh_keys" "all" {
}


module "origin" {
  for_each    = var.origin_map
  source      = "./modules/origin"
  zone_id     = data.hetznerdns_zone.cdn.id
  zone_name   = data.hetznerdns_zone.cdn.name
  hostname    = each.value.hostname
  server_type = each.value.server_type
  ssh_keys    = data.hcloud_ssh_keys.all.ssh_keys.*.name
}

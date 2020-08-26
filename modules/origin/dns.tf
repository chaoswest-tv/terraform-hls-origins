resource "hetznerdns_record" "a" {
  zone_id = var.zone_id
  name    = var.hostname
  value   = hcloud_server.primary.ipv4_address
  type    = "A"
  ttl     = 60
}

resource "hetznerdns_record" "aaaa" {
  zone_id = var.zone_id
  name    = var.hostname
  value   = hcloud_server.primary.ipv6_address
  type    = "AAAA"
  ttl     = 60
}

resource "hcloud_rdns" "a" {
  server_id  = hcloud_server.primary.id
  ip_address = hcloud_server.primary.ipv4_address
  dns_ptr    = "${var.hostname}.${var.zone_name}"
}

resource "hcloud_rdns" "aaaa" {
  server_id  = hcloud_server.primary.id
  ip_address = hcloud_server.primary.ipv6_address
  dns_ptr    = "${var.hostname}.${var.zone_name}"
}

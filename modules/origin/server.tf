resource "random_shuffle" "region" {
  input = ["nbg1", "fsn1"]
  seed  = var.hostname
}

resource "hcloud_server" "primary" {
  name        = var.hostname
  image       = "ubuntu-20.04"
  server_type = var.server_type
  location    = random_shuffle.region.result[0]
  ssh_keys    = var.ssh_keys
  backups     = false
  user_data   = file("${path.module}/templates/cloud-init.yaml")
  lifecycle   {
    ignore_changes = [
      location
    ]
  }
}


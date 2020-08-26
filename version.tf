terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.20.1"
    }
    hetznerdns = {
      source  = "timohirt/hetznerdns"
      version = "1.0.7"
    }
  }
}

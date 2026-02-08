# My Outputs
output "nyc_droplet" {
  value = {
    name   = digitalocean_droplet.nyc.name
    ip     = digitalocean_droplet.nyc.ipv4_address
    ipv6   = digitalocean_droplet.nyc.ipv6_address
    region = digitalocean_droplet.nyc.region
    ip_private = digitalocean_droplet.nyc.ipv4_address_private
    created    = digitalocean_droplet.nyc.created_at
    tags       = digitalocean_droplet.nyc.tags
  }
}

output "sfo_droplet" {
  value = {
    name   = digitalocean_droplet.sfo.name
    ip     = digitalocean_droplet.sfo.ipv4_address
    ipv6   = digitalocean_droplet.sfo.ipv4_address
    region = digitalocean_droplet.sfo.region
    ip_private = digitalocean_droplet.sfo.ipv4_address_private
    created    = digitalocean_droplet.sfo.created_at
    tags       = digitalocean_droplet.sfo.tags
  }
}


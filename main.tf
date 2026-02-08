resource "digitalocean_droplet" "nyc" {
  image  = "ubuntu-24-04-x64"
  name   = "web-nyc2"
  region = "nyc2"
  size   = "s-1vcpu-1gb"
  ipv6     = true               # Enable IPv6

  tags = ["web", "production", "nyc"]
}

# Droplet in San Francisco
resource "digitalocean_droplet" "sfo" {
  image  = "ubuntu-24-04-x64"
  name   = "web-sfo3"
  region = "sfo3"
  size   = "s-1vcpu-1gb"
  ipv6     = true               # Enable IPv6

  tags = ["web", "production", "sfo"]
}


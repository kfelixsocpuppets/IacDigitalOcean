data "digitalocean_ssh_key" "macosx" {
  name = "macosx"  # Use exact name from DO dashboard
}

data "digitalocean_ssh_key" "terraform" {
  name = "terraform"  # Use exact name from DO dashboard
}




resource "digitalocean_tag" "fw_web" {
  name = "fw_web"
}

resource "digitalocean_droplet" "nyc" {
  image  = "ubuntu-24-04-x64"
  name   = "web-nyc2"
  region = "nyc2"
  size   = "s-1vcpu-1gb"
  ipv6     = true               # Enable IPv6
  ssh_keys = [data.digitalocean_ssh_key.macosx.id]
  depends_on = [digitalocean_firewall.mydropslets]
  tags = [ "fw_web", "web", "production", "nyc"]
}

# Droplet in San Francisco
resource "digitalocean_droplet" "sfo" {
  image  = "ubuntu-24-04-x64"
  name   = "web-sfo3"
  region = "sfo3"
  size   = "s-1vcpu-1gb"
  ipv6     = true               # Enable IPv6
  ssh_keys = [data.digitalocean_ssh_key.terraform.id]
  depends_on = [digitalocean_firewall.mydropslets]
  tags = [ "fw_web", "web", "production", "sfo"]
}

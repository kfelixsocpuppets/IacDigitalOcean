resource "digitalocean_droplet" "NYC01" {
  image    = "ubuntu-24-04-x64"   
  name     = "NYC2UBUNTU01"
  region   = "nyc2"
  size     = "s-1vcpu-1gb"     
}
resource "digitalocean_droplet" SFO1" {
  image    = "ubuntu-24-04-x64"   
  name     = "SF01UBUNTU01"
  region   = "sfo1"
  size     = "s-1vcpu-1gb"     
}

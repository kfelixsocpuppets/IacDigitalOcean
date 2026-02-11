resource "digitalocean_firewall" "app" {
  name = "socpuppetsfirewallapp"
  tags = [digitalocean_tag.fw_app.name]



  # Allow SSH from anywhere
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # Allow SNMPv3	 
  inbound_rule {
    protocol         = "udp"
    port_range       = "161"
    source_addresses = ["52.18.233.22"]
  }

  # Allow all outbound traffic
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

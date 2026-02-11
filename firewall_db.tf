resource "digitalocean_firewall" "sql" {
  name = "socpuppetsfirewallsql"
  tags = [digitalocean_tag.fw_sql.name]



  # Allow SSH from anywhere
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # Allow SQL
  inbound_rule {
    protocol         = "tcp"
    port_range       = "3306"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # Allow SQL_1
  inbound_rule {
    protocol         = "tcp"
    port_range       = "3307"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }


  # Allow SQL_2
  inbound_rule {
    protocol         = "tcp"
    port_range       = "1433-1434"
    source_addresses = ["0.0.0.0/0", "::/0"]
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


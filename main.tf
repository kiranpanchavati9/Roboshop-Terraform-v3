# Create a new tag for the user
resource "digitalocean_tag" "tags" {
  for_each = var.components
  name     = each.key
}

# Create a new Droplet in nyc3 with the user tag
resource "digitalocean_droplet" "instances" {
  for_each = var.components
  image  = var.image
  name   = "${each.key}-dev"
  region = var.region
  size   = var.size
  tags = [digitalocean_tag.tags[each.key].name]
}

## FIREWALL RULE ALLOW ALL FOR THE USER

resource "digitalocean_firewall" "firewallrecords" {
  for_each = var.components

name = "${each.key}-fw"

droplet_ids = [digitalocean_droplet.instances[each.key].id]

inbound_rule {
  protocol         = var.protocol
  port_range       = var.port_range
  source_addresses = var.source_address
}

outbound_rule {
  protocol              = var.protocol
  port_range            = var.port_range
  destination_addresses = var.destination_addresses
}
}
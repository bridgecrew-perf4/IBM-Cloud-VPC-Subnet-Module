resource ibm_is_subnet subnet {
  name                     = var.name
  vpc                      = var.vpc
  zone                     = var.zone
  ipv4_cidr_block          = local.ipv4_cidr_block
  total_ipv4_address_count = local.address_count
  network_acl              = local.network_acl
  public_gateway           = local.public_gateway
  resource_group           = var.resource_group
  routing_table            = var.routing_table
  tags                     = concat(var.tags) 
}

locals {
  network_acl     = var.network_acl != "" ? var.network_acl : null
  public_gateway  = var.public_gateway != "" ? var.public_gateway : null
  ipv4_cidr_block = var.ipv4_cidr_block != "" ? var.ipv4_cidr_block : null
  address_count   = var.address_count != "" ? var.address_count : null
  routing_table   = var.routing_table != "" ? var.routing_table : null
}

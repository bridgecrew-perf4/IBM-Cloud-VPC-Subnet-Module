variable region {
  type        = string
  description = "The region where the VPC resources will be deployed."
  default     = ""
}

variable resource_group {
  type        = string
  description = "Resource group where resources will be deployed."
  default     = ""
}

variable ipv4_cidr_block {
  type        = string
  description = "IPv4 CIDR address to create for the subnet."
  default     = ""
}

variable address_count {
  type        = string
  description = "Number of IP addresses to create for the subnet."
  default     = ""
}

variable public_gateway {
  type        = string
  description = "Public Gateway for the subnet. If none is defined, the subnet is created without a Public Gateway."
  default     = ""
}

variable network_acl {
  type        = string
  description = "Network ACL ID to assign to the Subnet. If none is supplied the default VPC ACL is applied to the subnet."
  default     = ""
}

variable zone {
  type        = string
  description = "VPC Zone where the subnet will be created."
  default     = ""
}

variable vpc {
  type        = string
  description = "VPC where the subnet will be created."
  default     = ""
}

variable name {
  type        = string
  description = "Name to assign to subnet."
  default     = ""
}

variable routing_table {
  type        = string
  description = "Routing Table ID to assign to the Subnet. If none is supplied the default VPC routes are applied to the subnet."
  default     = ""
}

variable tags {
  type = list(string)
  description = "Tags to assign to resources."
  default     = []
}

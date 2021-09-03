# Subnet Module for IBM Cloud VPC 
Terraform module for creating a VPC Subnet in IBM Cloud. You can either specify the [ipv4_cidr_block](https://cloud.ibm.com/docs/terraform?topic=terraform-vpc-gen2-resources#subnet) or [total_ipv4_address_count](https://cloud.ibm.com/docs/terraform?topic=terraform-vpc-gen2-resources#subnet).

## Usage
If you need to include an IBM Cloud VPC Subnet in your deployment you can use the following code:

## Examples
### Subnet **without** a public gateway attached and a specific CIDR

```
variable ipv4_cidr_block {
  default = "10.240.0.0/26"
}

module subnet {
  source          = "git::https://github.com/cloud-design-dev/IBM-Cloud-VPC-Subnet-Module.git"
  name            = var.name
  resource_group  = var.resource_group
  network_acl     = var.network_acl
  ipv4_cidr_block = var.ipv4_cidr_block
  vpc             = var.vpc_id
  zone            = var.zone
}
```

### Subnet **with** a Public Gateway and custom ACL attached

```
variable address_count {
  default = "128"
}

variable network_acl {
  default = "network-acl-unique-identifier"
}

variable public_gateway {
  default = "public-gateway-unique-identifier"
}

module subnet {
  source         = "git::https://github.com/cloud-design-dev/IBM-Cloud-VPC-Subnet-Module.git"
  name           = var.name
  resource_group = var.resource_group
  network_acl    = var.network_acl
  address_count  = var.address_count
  vpc            = var.vpc_id
  zone           = var.zone
  public_gateway = var.public_gateway
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name for subnet | `string` | n/a | yes |
| vpc | ID of the VPC where the subnet will be created | `string` | n/a | yes |
| zone | VPC zone where the subnet will be created. | `string` | n/a | yes |
| resource\_group | The Resource Group to attach to the subnet | `string` | `Default` | yes | 
| ipv4_cidr_block | The CIDR for the subnet being created. | `string` | n/a | optional |
| address\_count | Number of IPs to assign to subnet | `string` | n/a | optional |
| network\_acl | Network ACL to attach to subnet | `string` | `VPC Default` | optional |
| public\_gateway | Public Gateway to attach to the subnet | `string` | `""` | optional | 
| routing\_table | Routing Table to attach to the subnet | `string` | `VPC Default` | optional | 


## Outputs

| Name | Description |
|------|-------------|
| id | ID of the created Subnet | 
| ipv4_cidr_block | IPv4 CIDR block for the subnet |
| available_ipv4_address_count | Number of IPs in the subnet  | 

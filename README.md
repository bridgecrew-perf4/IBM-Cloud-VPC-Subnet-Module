# Subnet Module for IBM Cloud VPC 
Terraform module for creating a VPC Subnet in IBM Cloud. You can either specify the [ipv4_cidr_block](https://cloud.ibm.com/docs/terraform?topic=terraform-vpc-gen2-resources#subnet) or [total_ipv4_address_count](https://cloud.ibm.com/docs/terraform?topic=terraform-vpc-gen2-resources#subnet).

## Usage
If you need to include an IBM Cloud VPC Subnet in your deployment you can use the following code:

### Subnet **without** a public gateway attached

```
data "ibm_resource_group" "group" {
  name = var.resource_group
}

data "ibm_is_zones" "mzr" {
  region = var.region
}

module subnet {
  source         = "git::https://github.com/cloud-design-dev/IBM-Cloud-VPC-Subnet-Count-Module.git"
  name           = var.name
  resource_group = data.ibm_resource_group.group.id
  network_acl    = var.network_acl
  address_count  = var.address_count
  vpc_id         = var.vpc_id
  zone           = data.ibm_is_zones.mzr.zones[0]
}
```

### Subnet **with** a public gateway attached

```
data "ibm_resource_group" "group" {
  name = var.resource_group
}

data "ibm_is_zones" "mzr" {
  region = var.region
}

module subnet {
  source         = "git::https://github.com/cloud-design-dev/IBM-Cloud-VPC-Subnet-Count-Module.git"
  name           = var.name
  resource_group = data.ibm_resource_group.group.id
  network_acl    = var.network_acl
  address_count  = var.address_count
  vpc_id         = var.vpc_id
  zone           = data.ibm_is_zones.mzr.zones[0]
  public_gateway = var.public_gateway
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | ID of the resource group to associate with the virtual server instance | `string` | n/a | yes |
| vpc | ID of the VPC where the subnet will be created | `string` | n/a | yes |
| zone | VPC zone where the subnet will be created. | `string` | n/a | yes |
| resource\_group | The Resource Group to attach to the subnet | `string` | `""` | yes | 
| ipv4_cidr_block | The CIDR for the subnet being created. | `string` | n/a | optional |
| address_count | Number of IPs to assign to subnet | `string` | n/a | optional |
| network\_acl | Network ACL to attach to subnet | `string` | `""` | optional |
| public\_gateway | Public Gateway to attach to the subnet | `string` | `""` | optional | 


## Outputs

| Name | Description |
|------|-------------|
| id | ID of the created Subnet | 
| ipv4_cidr_block | IPv4 CIDR block for the subnet |
| available_ipv4_address_count | Number of IPs in the subnet  | 

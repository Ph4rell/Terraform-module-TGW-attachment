# Terraform-module-TGW-attachment

Manages a Transit Gateway VPC Attachment between a VPC (with one or more subnet(s) to select) or a VPN and a Transit Gateway from Engie BackBone.

## Getting Started

Call the module in directly from git or git clone in your working directory.

### Prerequisites
```
Terraform > v.0.12
```
## How it works ?


## Usage

#### Fill in the **data.tf** with the Transit Gateway references.
```
data "aws_ec2_transit_gateway" "prod" {
    id = "tgw-xxxxxxx"
}

data "aws_ec2_transit_gateway" "preprod" {
    id = "tgw-yyyyyy"
}

data "aws_ec2_transit_gateway" "dev" {
    id = "tgw-zzzzzz"
}
```
#### Call the module in you terraform code.
```
module "transit_gateway_attachment" {
  source = "git::https://github.com/Ph4rell/Terraform-module-TGW-attachment.git"
  
  subnet_ids = [
      list of subnets ID (example: aws_subnet.subnet.id)
    ]

  transit_gateway_id  = var.transit_gateway_id
  vpc_id              = aws_vpc.vpc.id
  dns_support         = enable/disable
  ipv6_support        = enable/disable
  vpc_name            = var.vpc_name
  contact             = var.contact
  tags                = var.tags

}
```

## Running the test

It is possible to run a test in the test folder.

After a git clone of the project, go to test folder.

Put your test variables in the `terraform.tfvars`.
#### Example
```
vpc_name = "VPC-Test"
contact = "email@example.com"
tags = {
    tag1 = "value1"
    tag2 = "value2"
    tag3 = "value3"
}
transit_gateway = "Prod"
```

```
terraform init
terraform plan
terraform apply
```

Check if the resources have been well created in the account.
Don't forget to destroy the resources with terraform.
```
terraform destroy
```


## Deployment

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| contact | n/a | `string` | n/a | yes |
| dns\_support | (Optional) Whether DNS support is enabled. Valid values: disable, enable. Default value: enable | `string` | `"enable"` | no |
| ipv6\_support | (Optional) Whether IPv6 support is enabled. Valid values: disable, enable. Default value: disable | `string` | `"disable"` | no |
| subnet\_ids | (Required) Identifiers of Subnets (Example: subnet-xxxxxxxxxxxxxxxxx) | `list(string)` | n/a | yes |
| tags | A map of tags | `map(string)` | n/a | yes |
| transit\_gateway | (Required) Select the environement of the Transit Gateway: Prod, Preprod or Dev | `string` | n/a | yes |
| transit\_gateway\_default\_route\_table\_association | (Optional) Boolean whether the VPC Attachment should be associated with the Transit Gateway association default route table. Default value: false | `string` | `false` | no |
| transit\_gateway\_default\_route\_table\_propagation | (Optional) Boolean whether the VPC Attachment should propagate routes with the Transit Gateway propagation default route table. Default value: false | `string` | `false` | no |
| vpc\_id | (Required) Identifier of the VPC to attach | `string` | n/a | yes |
| vpc\_name | (Required) Provide the logical name of the VPC that will be attached to the transit gateway,format VPC-Name | `string` | `"VPC-CLIENT"` | no |

## Outputs

| Name | Description |
|------|-------------|
| attach\_id | Transit Gateway VPC Attachment identifier |
| dns\_support | Whether DNS support is enabled |
| ipv6\_support | Whether IPv6 support is enabled |
| subnet\_ids | Identifiers of Subnets |
| tags | Key-value tags for the Transit Gateway VPC Attachment |
| transit\_gateway\_id | Transit Gateway identifier |
| vpc\_id | Identifier of the VPC |
| vpc\_owner\_id | Identifier of the AWS account that owns the VPC |

# TGW-attachment
output "attach_id" {
  description = "EC2 Transit Gateway VPC Attachment identifier"
  value       = module.transit_gateway_attachment.attach_id
}

output "subnet_ids" {
  description = "Identifiers of EC2 Subnets"
  value       = module.transit_gateway_attachment.subnet_ids
}

output "vpc_id" {
  description = "Identifier of EC2 VPC"
  value       = module.transit_gateway_attachment.vpc_id
}

output "vpc_owner_id" {
  description = "Identifier of the AWS account that owns the EC2 VPC"
  value       = module.transit_gateway_attachment.vpc_owner_id
}

output "dns_support" {
  description = "Whether DNS support is enabled"
  value       = module.transit_gateway_attachment.dns_support
}

output "ipv6_support" {
  description = "Whether IPv6 support is enabled"
  value       = module.transit_gateway_attachment.ipv6_support
}

output "transit_gateway_id" {
  description = "EC2 Transit Gateway identifier"
  value       = module.transit_gateway_attachment.transit_gateway_id
}

output "tags" {
  description = "Key-value tags for the EC2 Transit Gateway VPC Attachment"
  value       = module.transit_gateway_attachment.tags
}

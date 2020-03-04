# TGW-attachment
output "attach_id" {
  description = "Transit Gateway VPC Attachment identifier"
  value       = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.id
}

output "subnet_ids" {
  description = "Identifiers of Subnets"
  value       = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.subnet_ids
}

output "vpc_id" {
  description = "Identifier of the VPC"
  value       = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.vpc_id
}

output "vpc_owner_id" {
  description = "Identifier of the AWS account that owns the VPC"
  value       = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.vpc_owner_id
}

output "dns_support" {
  description = "Whether DNS support is enabled"
  value       = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.dns_support
}

output "ipv6_support" {
  description = "Whether IPv6 support is enabled"
  value       = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.ipv6_support
}

output "transit_gateway_id" {
  description = "Transit Gateway identifier"
  value       = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.transit_gateway_id
}

output "tags" {
  description = "Key-value tags for the Transit Gateway VPC Attachment"
  value       = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.tags
}

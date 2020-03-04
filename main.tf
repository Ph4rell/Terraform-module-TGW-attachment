provider "aws" {
  version   = "~> 2.0"
  region    = "eu-west-1"
}

terraform {
  required_version  = ">= 0.12"
  # experimental feature
  experiments       = [variable_validation]
}

################################################################################
# TGW Attachment
################################################################################
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment" {
  subnet_ids          = var.subnet_ids
  transit_gateway_id  = var.transit_gateway == "Prod" ? data.aws_ec2_transit_gateway.prod.id : (var.transit_gateway == "Preprod" ? data.aws_ec2_transit_gateway.preprod.id : data.aws_ec2_transit_gateway.dev.id)
  vpc_id              = var.vpc_id
  dns_support         = var.dns_support
  ipv6_support        = var.ipv6_support
  tags = merge(
    {
      "Name" = format("%s_%s_%s-%s_%s",
      "ATT",
      var.vpc_name,
      "TGW",
      var.transit_gateway,
      data.aws_region.current.name
    )
    },
    {
      "Contact" = var.contact
    },
    {
      "tags" = var.tags
    }
  )
  transit_gateway_default_route_table_association = var.transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = var.transit_gateway_default_route_table_propagation
}
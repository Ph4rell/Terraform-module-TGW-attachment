provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-1"
}

terraform {
  required_version = ">= 0.12"
}

#Create a vpc for the test
resource "aws_vpc" "vpc_test" {
  cidr_block       = "192.168.222.0/24"
  instance_tenancy = "dedicated"

  tags    = {
    Name  = "VPC_test_transit_gateway"
  }
}

#Create a subnet for the test
resource "aws_subnet" "subnet_test" {
  vpc_id            = aws_vpc.vpc_test.id
  availability_zone = "eu-west-1a"
  cidr_block        = "192.168.222.128/26"

  tags    = {
    Name  = "Subnet_test_transit_Gateway"
  }
}

#Create a subnet for the test
resource "aws_subnet" "subnet_test2" {
  vpc_id            = aws_vpc.vpc_test.id
  availability_zone = "eu-west-1b"
  cidr_block        = "192.168.222.0/26"

  tags    = {
    Name  = "Subnet2_test_transit_Gateway"
  }
}

#Use the module for the attachement
module "transit_gateway_attachment" {
    source = "git::https://github.com/Ph4rell/Terraform-module-TGW-attachment.git"

    subnet_ids = [
        aws_subnet.subnet_test.id, 
        aws_subnet.subnet_test2.id
        ]

    transit_gateway       = var.transit_gateway
    vpc_id                = aws_vpc.vpc_test.id
    dns_support           = var.dns_support
    ipv6_support          = var.ipv6_support
    vpc_name              = var.vpc_name
    contact               = var.contact
    tags                  = var.tags
    transit_gateway_default_route_table_association = true
    transit_gateway_default_route_table_propagation = true
}
data "aws_ec2_transit_gateway" "prod" {
    id = "tgw-xxxxxxx"
}

data "aws_ec2_transit_gateway" "preprod" {
    id = "tgw-yyyyyy"
}

data "aws_ec2_transit_gateway" "dev" {
    id = "tgw-zzzzzz"
}

data "aws_region" "current" {}
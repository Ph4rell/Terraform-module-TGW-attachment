#######################################################
# TGW attachment
#######################################################
variable "subnet_ids" {
  type        = list(string)
  description = "(Required) Identifiers of Subnets (Example: subnet-xxxxxxxxxxxxxxxxx)"
}

variable "transit_gateway" {
  type        = string
  description = "(Required) Select the environement of the Transit Gateway: Prod, Preprod or Dev"

  validation {
    condition     = var.transit_gateway == "Prod" || var.transit_gateway == "Preprod" || var.transit_gateway == "Dev"
    error_message = "Transit Gateway available : Prod, Preprod or Dev."
  }
}

variable "vpc_id" {
  type        = string
  description = "(Required) Identifier of the VPC to attach"
}

variable "dns_support" {
  type        = string
  default     = "enable"
  description = "(Optional) Whether DNS support is enabled. Valid values: disable, enable. Default value: enable"
}

variable "ipv6_support" {
  type        = string
  default     = "disable"
  description = "(Optional) Whether IPv6 support is enabled. Valid values: disable, enable. Default value: disable"
}

variable "transit_gateway_default_route_table_association" {
  type        = string
  default     = false
  description = "(Optional) Boolean whether the VPC Attachment should be associated with the Transit Gateway association default route table. Default value: false"
}

variable "transit_gateway_default_route_table_propagation" {
  type        = string
  default     = false
  description = "(Optional) Boolean whether the VPC Attachment should propagate routes with the Transit Gateway propagation default route table. Default value: false"
}
#######################################################
# TGW Tags
#######################################################
variable "vpc_name" {
  type = string
  default = "VPC-CLIENT"
  description = "(Required) Provide the logical name of the VPC that will be attached to the transit gateway,format VPC-Name"
}

variable "contact" {
  type = string
}

variable "tags" {
    type = map(string)
    description = "A map of tags"
}

#######################################################
# TGW attachment
#######################################################
variable "transit_gateway" {
 type        = string
 description = "(Required) Prod/Preprod/Dev"
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


#######################################################
# TAGS
#######################################################
variable "vpc_name" {
  type = string
}
variable "contact" {
  type = string
}
variable "tags" {
    type = map(string)
}

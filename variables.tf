variable "name" {
  type        = string
  description = "The name of the security group."
}

variable "description" {
  type        = string
  description = "Description for the security group."
  default     = null
}

variable "tenant_id" {
  type        = string
  description = <<-EOT
    The tenant for which to create the security group.
    This is only required for admins creating security groups for other tenant.
  EOT
  default     = null
}

variable "delete_default_rules" {
  type        = bool
  description = <<-EOT
    Whether or not to delete the default egress rules applied to the security group.
    Default rules allow egress ipv4 and ipv6 to 0.0.0.0/0.
  EOT
  default     = false
}

variable "ingress_rules" {
  type        = map(map(string))
  description = <<-EOT
    The list of ingress rules to attach to the security group.
    You can use all regular entries from the openstack_networking_secgroup_rule_v2 resource
    provided by the openstack provider, except region, which defaults to the region of the provider used,
    and direction, which defaults to ingress.
    By default, if ethertype is not specified, it will by IPv4.
  EOT
  default     = {}
}

variable "egress_rules" {
  type        = map(map(string))
  description = <<-EOT
    The list of egress rules to attach to the security group.
    You can use all regular entries from the openstack_networking_secgroup_rule_v2 resource
    provided by the openstack provider, except region, which defaults to the region of the provider used,
    and direction, which defaults to egress.
    By default, if ethertype is not specified, it will by IPv4.
  EOT
  default     = {}
}

variable "tags" {
  type        = list(string)
  description = "A list of tags (strings) to apply to the security group"
  default     = []
}

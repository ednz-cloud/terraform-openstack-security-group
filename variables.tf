variable "name" {
  type        = string
  description = "The name of the security group."
}

variable "description" {
  type        = string
  description = "Description for the security group."
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

variable "tenant_id" {
  type        = string
  description = <<-EOT
    The tenant for which to create the security group.
    This is only required for admins creating security groups for other tenant.
  EOT
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "A list of tags (strings) to apply to the security group"
  default     = []
}

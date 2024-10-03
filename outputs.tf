output "name" {
  value       = openstack_networking_secgroup_v2.this.name
  sensitive   = false
  description = "The name of the security group"
  depends_on  = []
}

output "id" {
  value       = openstack_networking_secgroup_v2.this.id
  sensitive   = false
  description = "The id of the security group"
  depends_on  = []
}

output "sg_raw" {
  value       = openstack_networking_secgroup_v2.this
  sensitive   = false
  description = "The raw security group object, with all its values"
  depends_on  = []
}

output "sg_ingress_rules_raw" {
  value       = length(openstack_networking_secgroup_rule_v2.ingress) > 0 ? openstack_networking_secgroup_rule_v2.ingress : null
  sensitive   = false
  description = "The raw security group ingress rules, if any"
  depends_on  = []
}

output "sg_egress_rules_raw" {
  value       = length(openstack_networking_secgroup_rule_v2.egress) > 0 ? openstack_networking_secgroup_rule_v2.egress : null
  sensitive   = false
  description = "The raw security group egress rules, if any (except the default ones, if created)"
  depends_on  = []
}

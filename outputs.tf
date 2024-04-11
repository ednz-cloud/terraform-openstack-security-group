output "name" {
  value       = openstack_networking_secgroup_v2.this.name
  description = "The name of the security group"
}

output "id" {
  value       = openstack_networking_secgroup_v2.this.id
  description = "The id of the security group"
}

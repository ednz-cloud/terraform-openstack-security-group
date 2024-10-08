terraform {
  required_version = ">= 1.0.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = ">= 1.54"
    }
  }
}

resource "openstack_networking_secgroup_v2" "this" {
  name                 = var.name
  description          = var.description
  tenant_id            = var.tenant_id
  delete_default_rules = var.delete_default_rules
  tags                 = var.tags
}

resource "openstack_networking_secgroup_rule_v2" "ingress" {
  for_each = var.ingress_rules

  direction         = "ingress"
  security_group_id = openstack_networking_secgroup_v2.this.id
  tenant_id         = var.tenant_id

  description      = try(each.value.description, false) != false ? each.value.description : "Terraform managed."
  ethertype        = try(each.value.ethertype, false) != false ? each.value.ethertype : "IPv4"
  protocol         = try(each.value.protocol, false) != false ? each.value.protocol : null
  port_range_min   = try(each.value.port_range_min, false) != false ? each.value.port_range_min : null
  port_range_max   = try(each.value.port_range_max, false) != false ? each.value.port_range_max : null
  remote_ip_prefix = try(each.value.remote_ip_prefix, false) != false ? each.value.remote_ip_prefix : null
  remote_group_id  = try(each.value.remote_group_id, false) != false ? (each.value.remote_group_id == "self" ? openstack_networking_secgroup_v2.this.id : each.value.remote_group_id) : null
}

resource "openstack_networking_secgroup_rule_v2" "egress" {
  for_each = var.egress_rules

  direction         = "egress"
  security_group_id = openstack_networking_secgroup_v2.this.id
  tenant_id         = var.tenant_id

  description      = try(each.value.description, false) != false ? each.value.description : "Terraform managed."
  ethertype        = try(each.value.ethertype, false) != false ? each.value.ethertype : "IPv4"
  protocol         = try(each.value.protocol, false) != false ? each.value.protocol : null
  port_range_min   = try(each.value.port_range_min, false) != false ? each.value.port_range_min : null
  port_range_max   = try(each.value.port_range_max, false) != false ? each.value.port_range_max : null
  remote_ip_prefix = try(each.value.remote_ip_prefix, false) != false ? each.value.remote_ip_prefix : null
  remote_group_id  = try(each.value.remote_group_id, false) != false ? (each.value.remote_group_id == "self" ? openstack_networking_secgroup_v2.this.id : each.value.remote_group_id) : null
}

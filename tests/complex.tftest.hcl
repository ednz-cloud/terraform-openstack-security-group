run "complex" {
  module {
    source = "./tests/module"
  }

  variables {
    name        = "complex-sg"
    description = "Tofu automated tests."
    delete_default_rules = true
    ingress_rules = {
      http = {
        protocol         = "tcp"
        port_range_min   = 80
        port_range_max   = 80
        remote_ip_prefix = "0.0.0.0/0"
      }
      https = {
        protocol         = "tcp"
        port_range_min   = 443
        port_range_max   = 443
        remote_ip_prefix = "0.0.0.0/0"
      }
      cluster = {
        protocol         = ""
        port_range_min   = 0
        port_range_max   = 0
        remote_group_id = "self"
      }
      ssh = {
        protocol         = "tcp"
        port_range_min   = 22
        port_range_max   = 22
        remote_ip_prefix = "0.0.0.0/0"
      }
    }
    egress_rules = {
      icmp = {
        protocol         = "icmp"
        remote_ip_prefix = "0.0.0.0/0"
      }
    }
    tags = [
      "tofu=true",
      "env=testing",
    ]
  }

  assert {
    condition = module.security_group.name == "complex-sg"
    error_message = "The security group name is not what was set as input"
  }

  assert {
    condition = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", module.security_group.id))
    error_message = "The security group id is not a valid uuid"
  }

  assert {
    condition = length(module.security_group.sg_ingress_rules_raw) == 4
    error_message = "There are not the expected amount of ingress rules"
  }

  assert {
    condition = length(module.security_group.sg_egress_rules_raw) == 1
    error_message = "There are not the expected amount of egress rules"
  }

  assert {
    condition = module.security_group.sg_ingress_rules_raw["http"].remote_ip_prefix == "0.0.0.0/0"
    error_message = "The http ingress rule is not scoped to the correct remote cidr"
  }

  assert {
    condition = module.security_group.sg_ingress_rules_raw["https"].remote_ip_prefix == "0.0.0.0/0"
    error_message = "The https ingress rule is not scoped to the correct remote cidr"
  }

  assert {
    condition = module.security_group.sg_ingress_rules_raw["cluster"].remote_group_id == module.security_group.id
    error_message = "The cluster ingress rule is not scoped to itself"
  }

  assert {
    condition = module.security_group.sg_egress_rules_raw["icmp"].remote_ip_prefix == "0.0.0.0/0"
    error_message = "The icmp egress rule is not scoped to the correct remote cidr"
  }
}

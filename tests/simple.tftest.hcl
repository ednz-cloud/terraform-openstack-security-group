run "simple" {
  module {
    source = "./tests/module"
  }

  variables {
    name        = "simple-sg"
    description = "Tofu automated tests."
    delete_default_rules = false
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
    }
    egress_rules = {}
    tags = [
      "tofu=true",
      "env=testing",
    ]
  }

  assert {
    condition = module.security_group.name == "simple-sg"
    error_message = "The security group name is not what was set as input"
  }

  assert {
    condition = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", module.security_group.id))
    error_message = "The security group id is not a valid uuid"
  }

  assert {
    condition = length(module.security_group.sg_ingress_rules_raw) == 2
    error_message = "There are not the expected amount of ingress rules"
  }

  assert {
    condition = module.security_group.sg_ingress_rules_raw["http"].remote_ip_prefix == "0.0.0.0/0"
    error_message = "The http ingress rule is not scoped to the correct remote cidr"
  }

  assert {
    condition = module.security_group.sg_ingress_rules_raw["https"].remote_ip_prefix == "0.0.0.0/0"
    error_message = "The https ingress rule is not scoped to the correct remote cidr"
  }
}

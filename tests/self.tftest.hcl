run "self" {
  module {
    source = "./tests/module"
  }

  variables {
    name        = "self-sg"
    description = "Tofu automated tests."
    delete_default_rules = false
    ingress_rules = {
      cluster = {
        protocol         = ""
        port_range_min   = 0
        port_range_max   = 0
        remote_group_id = "self"
      }
    }
    egress_rules = {
      cluster = {
        protocol         = ""
        port_range_min   = 0
        port_range_max   = 0
        remote_group_id = "self"
      }
    }
    tags = [
      "tofu=true",
      "env=testing",
    ]
  }

  assert {
    condition = module.security_group.name == "self-sg"
    error_message = "The security group name is not what was set as input"
  }

  assert {
    condition = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", module.security_group.id))
    error_message = "The security group id is not a valid uuid"
  }

  assert {
    condition = length(module.security_group.sg_ingress_rules_raw) == 1
    error_message = "There are not the expected amount of ingress rules"
  }

  assert {
    condition = length(module.security_group.sg_egress_rules_raw) == 1
    error_message = "There are not the expected amount of egress rules"
  }

  assert {
    condition = module.security_group.sg_ingress_rules_raw["cluster"].remote_group_id == module.security_group.id
    error_message = "The cluster ingress rule is not scoped to itself"
  }
}

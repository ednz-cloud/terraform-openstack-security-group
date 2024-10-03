locals {
  name                 = var.name
  description          = var.description
  tenant_id            = var.tenant_id
  delete_default_rules = var.delete_default_rules
  ingress_rules        = var.ingress_rules
  egress_rules         = var.egress_rules
  tags                 = var.tags
}

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 2.1.0"
    }
  }
}

provider "vault" {
  address         = "https://active.vault.service.consul:8200"
  skip_tls_verify = true
}

provider "openstack" {
  auth_url                      = data.vault_kv_secret_v2.openstack_provider_region.data["auth_url"]
  region                        = data.vault_kv_secret_v2.openstack_provider_region.data["region_name"]
  tenant_name                   = data.vault_kv_secret_v2.openstack_provider_project_info.data["tenant_name"]
  application_credential_id     = data.vault_kv_secret_v2.openstack_provider_project_user.data["application_credential_id"]
  application_credential_secret = data.vault_kv_secret_v2.openstack_provider_project_user.data["application_credential_secret"]
}

data "vault_kv_secret_v2" "openstack_provider_region" {
  mount = "kv"
  name  = "infrastructure/openstack/regions/dc3_a"
}

data "vault_kv_secret_v2" "openstack_provider_project_user" {
  mount = "kv"
  name  = "infrastructure/openstack/projects/pcp_dawxdax/users/tofu"
}

data "vault_kv_secret_v2" "openstack_provider_project_info" {
  mount = "kv"
  name  = "infrastructure/openstack/projects/pcp_dawxdax/info"
}

module "security_group" {
  source = "../../"

  name                 = local.name
  description          = local.description
  tenant_id            = local.tenant_id
  delete_default_rules = local.delete_default_rules
  ingress_rules        = local.ingress_rules
  egress_rules         = local.egress_rules
  tags                 = local.tags
}

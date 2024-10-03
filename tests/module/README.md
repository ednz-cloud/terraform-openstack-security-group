# module

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement_openstack) | ~> 2.1.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider_vault) | n/a |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_security_group"></a> [security_group](#module_security_group) | ../../ | n/a |

### Resources

| Name | Type |
|------|------|
| [vault_kv_secret_v2.openstack_provider_project_info](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/kv_secret_v2) | data source |
| [vault_kv_secret_v2.openstack_provider_project_user](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/kv_secret_v2) | data source |
| [vault_kv_secret_v2.openstack_provider_region](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/kv_secret_v2) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delete_default_rules"></a> [delete_default_rules](#input_delete_default_rules) | Whether or not to delete the default egress rules applied to the security group.<br>Default rules allow egress ipv4 and ipv6 to 0.0.0.0/0. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input_description) | Description for the security group. | `string` | `null` | no |
| <a name="input_egress_rules"></a> [egress_rules](#input_egress_rules) | The list of egress rules to attach to the security group.<br>You can use all regular entries from the openstack_networking_secgroup_rule_v2 resource<br>provided by the openstack provider, except region, which defaults to the region of the provider used,<br>and direction, which defaults to egress.<br>By default, if ethertype is not specified, it will by IPv4. | `map(map(string))` | `{}` | no |
| <a name="input_ingress_rules"></a> [ingress_rules](#input_ingress_rules) | The list of ingress rules to attach to the security group.<br>You can use all regular entries from the openstack_networking_secgroup_rule_v2 resource<br>provided by the openstack provider, except region, which defaults to the region of the provider used,<br>and direction, which defaults to ingress.<br>By default, if ethertype is not specified, it will by IPv4. | `map(map(string))` | `{}` | no |
| <a name="input_name"></a> [name](#input_name) | The name of the security group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input_tags) | A list of tags (strings) to apply to the security group | `list(string)` | `[]` | no |
| <a name="input_tenant_id"></a> [tenant_id](#input_tenant_id) | The tenant for which to create the security group.<br>This is only required for admins creating security groups for other tenant. | `string` | `null` | no |

### Outputs

No outputs.
<!-- END_TF_DOCS -->

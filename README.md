# terraform-openstack-security-group

Terraform module to deploy a Neutron security-group in a given project.<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement_openstack) | >= 1.54 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider_openstack) | >= 1.54 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [openstack_networking_secgroup_rule_v2.egress](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_rule_v2) | resource |
| [openstack_networking_secgroup_rule_v2.ingress](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_rule_v2) | resource |
| [openstack_networking_secgroup_v2.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_v2) | resource |

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

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output_id) | The id of the security group |
| <a name="output_name"></a> [name](#output_name) | The name of the security group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

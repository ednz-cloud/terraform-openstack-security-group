# terraform-openstack-security-group

Terraform module to deploy a Neutron security-group in a given project.<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

No requirements.

### Providers

No providers.

### Modules

No modules.

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delete_default_rules"></a> [delete_default_rules](#input_delete_default_rules) | Whether or not to delete the default egress rules applied to the security group.<br>Default rules allow egress ipv4 and ipv6 to 0.0.0.0/0. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input_description) | Description for the security group. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input_name) | The name of the security group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input_tags) | A list of tags (strings) to apply to the security group | `list(string)` | `[]` | no |
| <a name="input_tenant_id"></a> [tenant_id](#input_tenant_id) | The tenant for which to create the security group.<br>This is only required for admins creating security groups for other tenant. | `string` | `null` | no |

### Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

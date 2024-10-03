## v0.1.0 (2024-10-03)

### Feat

- add raw output for the security group objects
- enable 'self' keyword for remote_group_id
- update provider requirement to be more flexible
- allow sec group sec for any traffic (do not default to tcp)
- **secgroup_rules**: add default description in case none is passed for securitygroup_rules
- **variables**: add default to allow empty ingress and egress blocks
- **outputs**: add simple outputs name and id
- **main**: add secgroup and rules to module
- **variables**: add initial files and start working on variables

### Fix

- ingress rules should also default to any protocol
- conditions trying to see if variables exist

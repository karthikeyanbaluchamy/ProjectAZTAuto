resource_group_name="app-grp"
location = "North Europe"
vnet_name="app-network"
vnet_address_prefix="10.0.0.0/16"
vnet_subnet_count=3
network_interfaces_count=3
public_ip_address_count=3
virtual_machine_count=3
network_security_group_rules=[
    {
      priority=300
      destination_port_range="22"
    },
    {
      priority=310
      destination_port_range="80"
    }
  ]

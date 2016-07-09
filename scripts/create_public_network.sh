#!/bin/sh

PUBLIC_NETWORK_CIDR=10.3.0.0/24
START_IP_ADDRESS=10.3.0.201
END_IP_ADDRESS=10.3.0.250
DNS_RESOLVER=10.3.0.1
PUBLIC_NETWORK_GATEWAY=10.3.0.1

neutron net-create provider --router:external --provider:physical_network provider --provider:network_type flat

neutron subnet-create provider $PUBLIC_NETWORK_CIDR --name provider \
  --allocation-pool start=$START_IP_ADDRESS,end=$END_IP_ADDRESS \
  --dns-nameserver $DNS_RESOLVER --disable-dhcp --gateway $PUBLIC_NETWORK_GATEWAY


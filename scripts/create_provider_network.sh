#!/bin/sh

PROVIDER_NETWORK_CIDR=10.0.0.0/24
START_IP_ADDRESS=10.0.0.201
END_IP_ADDRESS=10.0.0.250
DNS_RESOLVER=10.0.0.1
PROVIDER_NETWORK_GATEWAY=10.0.0.1

openstack network create  --share --external --provider-physical-network provider --provider-network-type flat provider

openstack subnet create --network provider \
  --allocation-pool start=$START_IP_ADDRESS,end=$END_IP_ADDRESS \
  --dns-nameserver $DNS_RESOLVER --gateway $PROVIDER_NETWORK_GATEWAY \
  --no-dhcp --subnet-range $PROVIDER_NETWORK_CIDR provider


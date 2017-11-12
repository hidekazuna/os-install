#!/bin/sh

SELFSERVICE_NETWORK_CIDR=172.16.1.0/24
SELFSERVICE_NETWORK_GATEWAY=172.16.1.1
DNS_RESOLVER=10.0.0.1

openstack network create selfservice

openstack subnet create --network selfservice \
  --dns-nameserver $DNS_RESOLVER --gateway $SELFSERVICE_NETWORK_GATEWAY \
  --subnet-range $SELFSERVICE_NETWORK_CIDR selfservice

openstack router create router

neutron router-interface-add router selfservice

neutron router-gateway-set router provider

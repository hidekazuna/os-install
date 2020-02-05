#!/bin/sh
openstack user create --domain default --password $1 neutron
openstack role add --project service --user neutron admin
openstack service create --name neutron --description "OpenStack Networking" network
openstack endpoint create --region RegionOne network public $2://$3:9696
openstack endpoint create --region RegionOne network internal $2://$3:9696
openstack endpoint create --region RegionOne network admin $2://$3:9696

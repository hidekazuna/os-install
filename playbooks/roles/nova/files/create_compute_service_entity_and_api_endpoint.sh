#!/bin/sh
openstack user create --domain default --password $1 nova
openstack role add --project service --user nova admin
openstack service create --name nova --description "OpenStack Compute" compute
openstack endpoint create --region RegionOne compute public $2://$3:8774/v2.1
openstack endpoint create --region RegionOne compute internal $2://$3:8774/v2.1
openstack endpoint create --region RegionOne compute admin $2://$3:8774/v2.1

#!/bin/sh
openstack user create --domain default --password $1 placement
openstack role add --project service --user placement admin
openstack service create --name placement --description "Placement API" placement
openstack endpoint create --region RegionOne placement public http://$2:8778
openstack endpoint create --region RegionOne placement internal http://$2:8778
openstack endpoint create --region RegionOne placement admin http://$2:8778

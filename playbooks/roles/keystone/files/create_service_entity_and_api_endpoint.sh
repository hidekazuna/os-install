#!/bin/sh

openstack service create --name keystone --description "OpenStack Identity" identity
openstack endpoint create --region RegionOne identity public http://$1:5000/v3
openstack endpoint create --region RegionOne identity internal http://$1:5000/v3
openstack endpoint create --region RegionOne identity admin http://$1:35357/v3

#!/bin/sh
openstack user create --domain default --password $1 ceilometer
openstack role add --project service --user ceilometer admin
openstack service create --name ceilometer --description "Telemetry" metering
openstack endpoint create --region RegionOne metering public http://$2:8777
openstack endpoint create --region RegionOne metering internal http://$2:8777
openstack endpoint create --region RegionOne metering admin http://$2:8777

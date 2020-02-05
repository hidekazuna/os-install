#!/bin/sh
openstack user create --domain default --password $1 cinder
openstack role add --project service --user cinder admin
openstack service create --name cinderv2 --description "OpenStack Block Storage" volumev2
openstack service create --name cinderv3 --description "OpenStack Block Storage" volumev3
openstack endpoint create --region RegionOne volumev2 public $2://$3:8776/v2/%\(project_id\)s
openstack endpoint create --region RegionOne volumev2 internal $2://$3:8776/v2/%\(project_id\)s
openstack endpoint create --region RegionOne volumev2 admin $2://$3:8776/v2/%\(project_id\)s
openstack endpoint create --region RegionOne volumev3 public $2://$3:8776/v3/%\(project_id\)s
openstack endpoint create --region RegionOne volumev3 internal $2://$3:8776/v3/%\(project_id\)s
openstack endpoint create --region RegionOne volumev3 admin $2://$3:8776/v3/%\(project_id\)s

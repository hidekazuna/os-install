openstack user create --domain default --password $1 glance
openstack role add --project service --user glance admin
openstack service create --name glance --description "OpenStack Image service" image
openstack endpoint create --region RegionOne image public $2://$3:9292
openstack endpoint create --region RegionOne image internal $2://$3:9292
openstack endpoint create --region RegionOne image admin $2://$3:9292

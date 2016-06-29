#!/bin/bash

/usr/bin/pg_ctlcluster "9.5" main start
su - postgres -c 'createuser -s bucardo'
su - bucardo  -c 'bucardo install --batch'
su - bucardo  -c 'bucardo show all'
/usr/bin/pg_ctlcluster "9.5" main stop

# Normal startup
/sbin/my_init

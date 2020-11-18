#!/bin/bash

JOINS=`getent hosts tasks.rethinkdb | awk '{ print $1 }' | sed -e 's/^/--join /' | tr '\n' ' '`
echo "Starting rethinkdb using $JOINS"
$HOSTNAME=`hostname -i`
rethinkdb --bind all --no-http-admin --canonical-address $HOSTNAME $JOINS

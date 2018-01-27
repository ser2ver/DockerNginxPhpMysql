#!/bin/bash

DOCKER_HOST_VOLUME_UID=`stat -c "%u" /var/www`
usermod -u $DOCKER_HOST_VOLUME_UID www-data

exec "$@"

#!/bin/sh

set -e

shopt -s nocasematch

if [ -z ${TZ+x} ]; then
  echo "Warning : TimeZone is unset !";
else
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone ;
fi

# Starting the custom entrypointf it exists
if [ -f /docker/custom-entrypoint.sh ]; then
    source /config/custom-entrypoint.sh
fi

# Moving static files to a sharedVolume with the nginx
rm -rf /nginx/*
if [ -d "/var/www/html/public" ]; then
    cp -rf /var/www/html/public /nginx
fi

exec "$@"
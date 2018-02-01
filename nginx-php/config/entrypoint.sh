#!/bin/sh
set -e

if [ -z ${TZ+x} ]; then
  echo "Warning : TimeZone is unset !";
else
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone ;
fi

if [ -z ${PHP_ADDRESS+x} ]; then
  echo "Error : PHP_ADDRESS is unset, please specify 127.0.0.1 or php hostname";
  exit 1
else
  sed -i "s/\${PHP_ADDRESS}/${PHP_ADDRESS}/" /etc/nginx/conf.d/default.conf
fi

exec "$@"

#!/bin/sh

set -e

shopt -s nocasematch

if [ -z ${TZ+x} ]; then
  echo "Warning : TimeZone is unset !";
else
  sudo ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ | sudo tee /etc/timezone ;
fi

if [ $XDEBUG_ENABLE == "true" ]; then
  sudo sed -i "s#XDEBUG_REMOTE_HOST#$(ip r | awk '/default/{print $3}')#" /usr/local/etc/php/conf.d/xdebug.ini
else
  echo "XDebug disabled";
fi

if [ $REMOTE_HOST_ENABLE == "true" ]; then
  if ! grep -Fxq "remote_host" /etc/hosts; then
    echo "$(ip r | awk '/default/{print $3}') remote_host" | sudo tee --append /etc/hosts
  fi;
else
  echo "remote host disabled";
fi
# Starting the custom entrypointf it exists
if [ -f /docker/custom-entrypoint.sh ]; then
    source /config/custom-entrypoint.sh
fi

exec "$@"
#!/bin/bash
while :
  IP=`hostname -I`
do
  if [ -n "${IP}" ]; then
    curl -X POST -H 'Authorization: Bearer token' -F "message=${IP}" https://notify-api.line.me/api/notify
    break 
  fi
  sleep 1
done
exit 0

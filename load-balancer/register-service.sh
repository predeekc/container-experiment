#!/bin/bash

SERVICE_NAME=$1
SERVICE_IPV4=$2

while true; do
    curl -f ${SERVICE_IPV4};
    if [ $? -eq 0 ]; then
      etcdctl set /services/${SERVICE_NAME}/${SERVICE_IPV4} \'${SERVICE_IPV4}\' --ttl 30;
    else
      etcdctl rm /services/${SERVICE_NAME}/${SERVICE_IPV4};
    fi;
    sleep 20;
done



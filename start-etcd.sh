#!/bin/bash

#PUBLIC_IP=192.168.73.121
PUBLIC_IP=$1

docker run -d --name=etcd -p 7001:7001 -p 4001:4001 coreos/etcd -peer-addr ${PUBLIC_IP}:7001 -addr ${PUBLIC_IP}:4001 
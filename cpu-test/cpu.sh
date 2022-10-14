#!/bin/bash

while true
do
  # curl -XGET http://payment-route-cp4i.itzroks-666000qmn3-lxe97o-6ccd7f378ae819553d37d5f2ee142bd6-0000.jp-tok.containers.appdomain.cloud/welcome
  curl -s -o /dev/null -XGET http://payment-service.cp4i.svc.cluster.local:8080/welcome 
  sleep 0.001
done

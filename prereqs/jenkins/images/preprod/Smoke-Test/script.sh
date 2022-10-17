#!/bin/bash

sleep 20

pod_name=$(/var/jenkins_home/workspace/Preproduction/oc get pods -n pre-production | grep build-config | awk '{print $1}' )

while [[ $(/var/jenkins_home/workspace/Preproduction/oc get pods -n pre-production $pod_name -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "False" ]]
	do echo "waiting for build config pod to finish execution" && sleep 10
done

sleep 15

while [[ $(/var/jenkins_home/workspace/Preproduction/oc get pods -n pre-production -l deployment=payment-application -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]
	do echo "waiting for Java application to be ready" && sleep 10
done

echo "Executing test..."

status_code=$(curl  -I -XGET payment-application.pre-production.svc.cluster.local:8080/welcome -s | head -n 1 | awk '{print $2}')
echo $status_code

if [ "$status_code" = "200" ]; then
    echo "Test passed"
    exit 0
else
    echo "Test failure"
    exit 1
fi

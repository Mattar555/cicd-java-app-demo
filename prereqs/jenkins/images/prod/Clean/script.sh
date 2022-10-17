#!/bin/bash

echo "Removing build config job pod"

/var/jenkins_home/workspace/Preproduction/oc get pods -n pre-production | awk '/^payment-application-build-config/{system("/var/jenkins_home/workspace/Preproduction/oc -n pre-production delete pod " $1)}'

echo "Successfully removed build config job pod"

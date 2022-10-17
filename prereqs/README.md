# README


## Commands to perform

1) oc new-app --imagestream=existing-image-stream-here. This is because subsequent pushes to the internal registry will auto-create the deployment and service. Optionally the route we can create but this is not needed for the integration testing as we are using the internal service name here as Jenkins is running from within the cluster.

2) oc policy add-role-to-user system:image-puller system:serviceaccount:cp4i:default --namespace=pre-production

3) oc policy add-role-to-user admin system:serviceaccount:jenkins:jenkins   

#!/bin/bash

git config --global user.email "marwan.attar93@gmail.com"
git config --global user.name "Marwan Attar"


build_name=$(/var/jenkins_home/workspace/Preproduction/oc get builds -n pre-production | tail -n 1 | awk '{print $1}')

sha=$(/var/jenkins_home/workspace/Preproduction/oc get build $build_name -n pre-production -o jsonpath='{.status.output.to.imageDigest}' && echo)

echo $build_name
echo $sha

cat <<EOF > gitops/base/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: payment-deployment
  namespace: changeme
  labels:
    app: payment-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: payment-app
  template:
    metadata:
      labels:
        app: payment-app
    spec:
      containers:
        - name: payments
          image: image-registry.openshift-image-registry.svc:5000/pre-production/payment-application@$sha
          ports:
            - containerPort: 8080
EOF


git add gitops/base/deployment.yaml
git commit -m "JOB: $JOB_NAME, Commit: $GIT_COMMIT"
#git push origin HEAD:main

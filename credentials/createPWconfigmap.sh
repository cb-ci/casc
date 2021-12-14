#! /bin/bash
kubectl delete configmap simple-pw-config
kubectl create configmap simple-pw-config \
       --from-env-file=pw.properties

kubectl delete -f mysecrets.yaml
kubectl create -f mysecrets.yaml



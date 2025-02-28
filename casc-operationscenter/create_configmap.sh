#! /bin/bash

NS=cloudbees-core
BUNDLEDIR=${1:-"bundle"}
#kubectl create configmap oc-casc-bundle -n $NS --from-file=$BUNDLEDIR --dry-run=client -o yaml | kubectl apply -f -
kubectl -n $NS  delete cm oc-casc-bundle
kubectl -n $NS  create cm  oc-casc-bundle --from-file=$BUNDLEDIR
kubectl -n $NS  create cm  oc-casc-bundle --from-file=$BUNDLEDIR --dry-run=client -o yaml
kubectl -n $NS  delete pod cjoc-0
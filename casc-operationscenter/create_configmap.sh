#!/bin/bash

NS=cloudbees-core

kubectl create configmap oc-casc-bundle -n $NS --from-file=bundle --dry-run=client -o yaml | kubectl apply -f -
#kubectl -n $NS  delete cm oc-casc-bundle
#kubectl -n $NS  create cm  oc-casc-bundle --from-file=bundle
#kubectl -n $NS  create cm  oc-casc-bundle --from-file=bundle --dry-run=client -o yaml

#kubectl -n $NS  delete pod cjoc-0
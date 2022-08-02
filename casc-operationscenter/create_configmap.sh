#!/bin/bash

NS=cloudbees-core

kubectl -n $NS  delete cm oc-casc-bundle
#kubectl -n $NS  create cm  oc-casc-bundle --from-file=bundle --dry-run=client -o yaml
kubectl -n $NS  create cm  oc-casc-bundle --from-file=bundle
kubectl -n $NS  delete pod cjoc-0
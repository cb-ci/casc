#!/bin/bash


kubectl delete cm oc-casc-bundle
kubectl create cm  oc-casc-bundle --from-file=bundle --dry-run=client -o yaml
kubectl delete pod cjoc-0
kubectl create cm  oc-casc-bundle --from-file=bundle
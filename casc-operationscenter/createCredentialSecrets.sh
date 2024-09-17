#! /bin/bash

#kubectl create secret generic oc-secrets -n "$CBCI_NS" \
#    --from-literal=login="$(yq '.login' secrets/cbci-secrets.yaml )" \
#    --from-literal=githubUser="$(yq '.githubUser' secrets/cbci-secrets.yaml )" \
#    --from-literal=githubToken="$(yq '.githubToken' secrets/cbci-secrets.yaml )" \
#    --from-literal=licenseCert="$(yq '.licenseCert' secrets/cbci-secrets.yaml )" \
#    --from-literal=licenseKey="$(yq '.licenseKey' secrets/cbci-secrets.yaml )"
kubectl delete secret oc-casc-secrets
kubectl delete secret oc-secrets
#kubectl create secret generic oc-casc-secrets -n "$CBCI_NS" \
#    --from-literal=ocLogin="$(yq '.ocLogin' secrets/cbci-secrets.yaml )" \
#    --from-literal=githubUser="$(yq '.githubUser' secrets/cbci-secrets.yaml )" \
#    --from-literal=githubToken="$(yq '.githubToken' secrets/cbci-secrets.yaml )" \
#    --from-literal=gitHubSSHpriv="$(yq '.gitHubSSHpriv' secrets/cbci-secrets.yaml )" \
#    --from-literal=licenseCert="$(yq '.licenseCert' secrets/cbci-secrets.yaml )" \
#    --from-literal=licenseKey="$(yq '.licenseKey' secrets/cbci-secrets.yaml )"

kubectl create secret generic oc-secrets -n "$CBCI_NS" \
    --from-literal=ocLoginPassword="$(yq '.ocLoginPassword' secrets/cbci-secrets.yaml )" \
    --from-literal=githubUser="$(yq '.githubUser' secrets/cbci-secrets.yaml )" \
    --from-literal=githubToken="$(yq '.githubToken' secrets/cbci-secrets.yaml )" \
    --from-literal=gitHubSSHpriv="$(yq '.gitHubSSHpriv' secrets/cbci-secrets.yaml )" \
    --from-literal=licenseCert="$(yq '.licenseCert' secrets/cbci-secrets.yaml )" \
    --from-literal=licenseKey="$(yq '.licenseKey' secrets/cbci-secrets.yaml )" \
    --from-literal=awsAccessKey="$(yq '.awsAccessKey' secrets/cbci-secrets.yaml )" \
    --from-literal=awsSecretKey="$(yq '.awsSecretKey' secrets/cbci-secrets.yaml )"

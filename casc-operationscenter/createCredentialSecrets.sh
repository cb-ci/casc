#! /bin/bash


export CBCI_NS=cloudbees-core
#export CBCI_NS=cjoc1

#kubectl create secret generic oc-secrets -n "$CBCI_NS" \
#    --from-literal=login="$(yq '.login' secrets/cbci-secrets.yaml )" \
#    --from-literal=githubUser="$(yq '.githubUser' secrets/cbci-secrets.yaml )" \
#    --from-literal=githubToken="$(yq '.githubToken' secrets/cbci-secrets.yaml )" \
#    --from-literal=licenseCert="$(yq '.licenseCert' secrets/cbci-secrets.yaml )" \
#    --from-literal=licenseKey="$(yq '.licenseKey' secrets/cbci-secrets.yaml )"

kubectl delete secret oc-secrets -n $CBCI_NS
kubectl delete secret controller-secrets -n $CBCI_NS
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
    --from-literal=jiraUser="$(yq '.jiraUser' secrets/cbci-secrets.yaml )" \
    --from-literal=jiraToken="$(yq '.jiraToken' secrets/cbci-secrets.yaml )" \
    --from-literal=gitHubSSHpriv="$(yq '.gitHubSSHpriv' secrets/cbci-secrets.yaml )" \
    --from-literal=licenseCert="$(yq '.licenseCert' secrets/cbci-secrets.yaml )" \
    --from-literal=licenseKey="$(yq '.licenseKey' secrets/cbci-secrets.yaml )" \
    --from-literal=awsAccessKey="$(yq '.awsAccessKey' secrets/cbci-secrets.yaml )" \
    --from-literal=awsSecretKey="$(yq '.awsSecretKey' secrets/cbci-secrets.yaml )"

kubectl create secret generic controller-secrets -n "$CBCI_NS" \
    --from-literal=gitHubAppId="$(yq '.gitHubAppId' secrets/cbci-secrets.yaml )" \
    --from-literal=gitHubAppPrivateKey="$(yq '.gitHubAppPrivateKey' secrets/cbci-secrets.yaml )" \
    --from-literal=dockerConfigJson="$(yq '.dockerConfigJson' secrets/cbci-secrets.yaml )"

kubectl delete secret controller-secrets -n cloudbees-controllers

kubectl create secret generic controller-secrets -n cloudbees-controllers \
     --from-literal=gitHubAppId="$(yq '.gitHubAppId' secrets/cbci-secrets.yaml )" \
     --from-literal=gitHubAppPrivateKey="$(yq '.gitHubAppPrivateKey' secrets/cbci-secrets.yaml )" \
      --from-literal=dockerConfigJson="$(yq '.dockerConfigJson' secrets/cbci-secrets.yaml )"


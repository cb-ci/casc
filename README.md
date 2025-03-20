# CloudBees CI Configuration as Code (CasC)

This repo has some samples about casc. 
See 
* https://docs.cloudbees.com/docs/cloudbees-ci/latest/casc-oc/casc-landing-page
* https://docs.cloudbees.com/docs/cloudbees-ci/latest/casc-oc/casc-intro


# Private Notes

## Things to remove from casc export 

see also [patch.sh](patch.sh) 

* cleaning jenkins.yaml after export
* remove info unique to instance (delete whole keys/children from jenkins.yaml)
* location property (instance URL)
* credentials (update to external secrets)
* connection details to the operations center
* operationsCenterRootAction property
* licence (certificate + key)
* gitHubPluginConfig-hookUrl
* rbac (if you manage this on OC, remove from controller)
* remove info coming from OC
* labelAtoms
* authorizationStrategy
* updateCenter
* remove default config (anything that you haven’t configured yourself)
* agentProtocols
* beekeeper ??
* globalCredentialsConfiguration
* remotingSecurity


## Convert to yaml
```

cat jenkins-plugins.txt |cut -d " " -f 1  | sed "s/^/- id: /g" > plugins.yaml
```

## Define plugin.yaml

```
PLUGINS_BASE=controller-base/plugins.yaml
PLUGINS_CHILD=controller-child/plugins.yaml
```
## Find common lines using process substitution

```
common_lines=$(comm -12 <(sort $PLUGINS_BASE) <(sort $PLUGINS_CHILD))
common_lines=$(comm -12 <(sort controller-base/plugins.yaml) <(sort controller-child/plugins.yaml))
# Print the list of common lines/ PRINT COMMON PLUGINS FOR BASE BUNDLE
echo "$common_lines"
```


## Find lines unique to file2.txt using process substitution

```
unique_to_file2=$(comm -13 <(sort $PLUGINS_1) <(sort $PLUGINS_2))
unique_to_file1=$(comm -13 <(sort $PLUGINS_2) <(sort $PLUGINS_1))
```

## Print the list of lines unique to  

```
echo "$unique_to_file2"
echo "$unique_to_file1"
```

## Validate bundle by CLI/REST
Using Jenkins CLI.
java -jar jenkins-cli.jar casc-pre-validate-bundle < bundle.zip
Using HTTP endpoints.
curl -s -H ‘Accept: application/json’ -H ‘Content-Type: application/zip;charset=utf-8’ --user [USER] --data-binary @[PATH_TO_ZIP] -XPOST $JENKINS_URL/casc-bundle/pre-validate-bundle



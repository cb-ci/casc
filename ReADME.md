# CloudBees CI Configuratin as Conde (CasC)

This repo has some samples about casc. 
See 
* https://docs.cloudbees.com/docs/cloudbees-ci/latest/casc-oc/casc-landing-page
* https://docs.cloudbees.com/docs/cloudbees-ci/latest/casc-oc/casc-intro


Private Notes



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
> echo "$unique_to_file2"
echo "$unique_to_file1"

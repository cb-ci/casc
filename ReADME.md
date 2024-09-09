
# Convert to yaml

> cat jenkins0.yaml |cut -d " " -f 1  | sed "s/^/- id: /g" > plugins.yaml

# Define plugin.yaml
```
RS_PLUGINS_1=rs-jenkins-global/plugins_all.yaml
RS_PLUGINS_2=rs-jenkins0/plugins_all.yaml
```
# Find common lines using process substitution
```
common_lines=$(comm -12 <(sort $RS_PLUGINS_1) <(sort $RS_PLUGINS_2))
common_lines=$(comm -12 <(sort rs-jenkins-global/plugins.yaml) <(sort rs-jenkins0/plugins.yaml))
```
# Print the list of common lines
# PRINT COMMON PLUGINS FOR  BASE BUNDLE

> echo "$common_lines"


# Find lines unique to file2.txt using process substitution

```
unique_to_file2=$(comm -13 <(sort $RS_PLUGINS_1) <(sort $RS_PLUGINS_2))
unique_to_file1=$(comm -13 <(sort $RS_PLUGINS_2) <(sort $RS_PLUGINS_1))
```

# Print the list of lines unique to 
> echo "$unique_to_file2"
echo "$unique_to_file1"

# casc


curl -v -H "X-CasC-Token: 93eb135e-dd46-43cf-a12a-461b97007364" "https://cb-core.caternberg.eu/cjoc/config-bundle/master0" -k


export TOKEN="admin:114bc396134b9502c2084da93a21e1e3ff"
curl -v  "https://${TOKEN}@cb-core.caternberg.eu/master3/configuration-as-code/checNewSource?newSource='https://raw.githubusercontent.com/cb-ci/casc/master/jcasc-master0/jenkins.yaml'"
https://cb-core.caternberg.eu/master3/'"
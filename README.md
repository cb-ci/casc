# casc



export TOKEN="admin:<JENKINS_TOKEN>"
#curl -v  "https://${TOKEN}@cb-core.caternberg.eu/master3/configuration-as-code/checNewSource?newSource='https://raw.githubusercontent.com/cb-ci/casc/master/jcasc-master0/jenkins.yaml'"
#https://cb-core.caternberg.eu/master3/'"

curl -v -H "X-CasC-Token: <JENKINS_TOKEN>" \
https://cb-core.caternberg.eu/config-bundle/master0

#http://jenkins-updates.cloudbees.com/download/plugins/beer/1.1/beer.hpi
curl -v  https://admin:<NEXUS_PASSWORD>@nexus.acaternberg.flow-training.beescloud.com/repository/cloudbees-plugins/beer/1.3/beer.hpi -o beer.hpi
#! /bin/bash
JENKINS_YAML=${1:-"jenkins.yaml"}
cp -f $JENKINS_YAML $JENKINS_YAML.bak
cat $JENKINS_YAML | yq e -P 'del(.unclassified.operationsCenterRootAction, .jenkins.agentProtocols, .jenkins.license, .jenkins.labelAtoms, .jenkins.remotingSecurity, .jenkins.slaveAgentPort, .jenkins.updateCenter, .credentials, .unclassified.quietStartConfiguration)'  | tee patched-jenkins.yaml
diff patched-jenkins.yaml $JENKINS_YAML

#!/usr/bin/env bash
#mkdir -p $JENKINS_HOME/jcasc-bundles-store/
BUNDLE_DIR=$JENKINS_HOME/jcasc-bundles-store


rm -Rf $BUNDLE_DIR
mkdir -p $BUNDLE_DIR

#cp casc/core-casc-security.xml ${JENKINS_HOME}/
#rsync -avz --exclude '.git' . ${BUNDLE_DIR}/
rm -Rf .git
cp -vR * ${BUNDLE_DIR}/
ls -lathR ${BUNDLE_DIR}/

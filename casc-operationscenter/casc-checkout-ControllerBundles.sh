#! /bin/bash

CJOC_URL=https://cjoc.acaternberg.pscbdemos.com
CONTROLLER_URL=https://cjoc.acaternberg.pscbdemos.com/controller0/
TOKEN="admin:11aea39b4037a76c97fc964d2c92b877c4"
curl -s -X POST -u $TOKEN ${CJOC_URL}/cjoc/casc-bundle/check-out
#curl -s -X POST -u $TOKEN ${CONTROLLER_URL}/casc-bundle-mgnt/reload-bundle
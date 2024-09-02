C#! /bin/bash

#https://docs.cloudbees.com/docs/cloudbees-ci-api/latest/bundle-management-api


#Download jq, if not present
#curl -sLo /tmp/jq https://stedolan.github.io/jq/download/linux64/jq
#chmod 755 /tmp/jq
CJOC_URL=https://cjoc.acaternberg.pscbdemos.com
TOKEN="admin:11aea39b4037a76c97fc964d2c92b877c4"
curl -s -X GET -u $TOKEN ${CJOC_URL}/cjoc/casc-bundle-mgnt/check-bundle-update > check-bundle-update.json
cat check-bundle-update.json | jq
#updateAvailable=$(jq '."update-available"' check-bundle-update.json)
#validBundle=$(jq '.versions."new-version".validations[]' check-bundle-update.json)


curl -s -X POST -u $TOKEN ${CJOC_URL}/cjoc/casc-bundle-mgnt/reload-bundle

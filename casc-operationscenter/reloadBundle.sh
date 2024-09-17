#! /bin/bash

#https://docs.cloudbees.com/docs/cloudbees-ci-api/latest/bundle-management-api


#Download jq, if not present
#curl -sLo /tmp/jq https://stedolan.github.io/jq/download/linux64/jq
#chmod 755 /tmp/jq

curl -s -X GET -u admin:admin ${CJOC_URL}/cjoc/casc-bundle-mgnt/check-bundle-update > check-bundle-update.json
cat check-bundle-update.json | jq
updateAvailable=$(jq '."update-available"' check-bundle-update.json)
validBundle=$(jq '.versions."new-version".validations[]' check-bundle-update.json)

TOKEN="admin:11aea39b4037a76c97fc964d2c92b877c4"

if [ -z "$validBundle" ] && [ "$updateAvailable" = true ]
then
    echo "Updating valid bundle";
    #if [ "$updateAvailable" = true ] ; then
        echo '      Applying update available'
        curl -s -X POST -u $TOKEN ${CJOC_URL}/cjoc/casc-bundle-mgnt/reload-bundle > reload-bundle.json
        reloaded=$(jq '.reloaded' reload-bundle.json)
        # Use reloaded if needed
        exit 0; # terminate successfully

    #fi
else
    if [ ! -z "$validBundle" ] ; then
        echo '[SEVERE] There are warnings in the bundle'
        echo $validBundle;
        exit 1 # terminate and indicate error
    fi
    if [ "$updateAvailable" = false ] ; then
        echo '[SEVERE] There is no update available';
        exit 1 # terminate and indicate error
    fi
fi

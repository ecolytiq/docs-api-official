#!/bin/sh
set -euxo pipefail

npx -y @redocly/cli@1.12.0 join openapi-gateway.yaml openapi-action.yaml --without-x-tag-groups -o openapi.yaml
npx -y @redocly/cli@1.12.0 build-docs openapi.yaml  --disableGoogleFont --template ./ecolytiq.hbs --output=index.html --config=./redocly.yaml

# Replace the version in the openapi.yaml file with the current date
CURRENT_DATE=$(date +%Y-%m-%d)
# sed differs for MacOS and Linux if you try inplace replacement i.e. we do not use -i flag
sed "s/version: .*/version: v3-$CURRENT_DATE/" openapi.yaml > temp.yaml && mv temp.yaml openapi.yaml

bash ./buildPostman.sh openapi.yaml ecolytiq_Sandbox.postman_collection.json

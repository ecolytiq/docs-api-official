#!/bin/sh
npx -y @redocly/cli@1.12.0 join openapi-gateway.yaml openapi-action.yaml --without-x-tag-groups -o openapi.yaml
npx -y @redocly/cli@1.12.0 build-docs openapi.yaml  --disableGoogleFont --template ./ecolytiq.hbs --output=index.html --config=./redocly.yaml
bash ./buildPostman.sh openapi.yaml ecolytiq_Sandbox.postman_collection.json

#!/bin/sh
npx @redocly/cli@1.11.0 build-docs openapi.yaml --disableGoogleFont --template ecolytiq.hbs --output index.html --config redocly.yaml
bash ./buildPostman.sh openapi.yaml ecolytiq_Sandbox.postman_collection.json

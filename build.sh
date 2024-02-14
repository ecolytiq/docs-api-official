#!/bin/sh

npx redoc-cli@0.13.21 build openapi.yaml --options=theme.json --disableGoogleFont -t ecolytiq.hbs --output index.html
bash ./buildPostman.sh openapi.yaml ecolytiq_Sandbox.postman_collection.json

#!/bin/sh

version=v3-2023-08-01

npx redoc-cli@0.13.21 build openapi.yaml --options=theme.json --disableGoogleFont -t ecolytiq.hbs --output index.html
bash ./buildPostman.sh openapi.yaml ecolytiq_Sandbox.postman_collection.json

mkdir -p "${version}"/postman
cp openapi.yaml "${version}"/openapi.yaml
cp index.html "${version}"/index.html
cp ecolytiq_Sandbox.postman_collection.json "${version}"/postman/ecolytiq_Sandbox.postman_collection.json

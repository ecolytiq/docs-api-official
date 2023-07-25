#!/bin/sh

version=v3-$(date '+%Y-%m-%d')

mkdir -p ${version}/postman

cp openapi.yaml ${version}/openapi.yaml

redoc-cli build ${version}/openapi.yaml --options=theme.json --disableGoogleFont -t ecolytiq.hbs
cp redoc-static.html ${version}/index.html

./buildPostman.sh ${version}/openapi.yaml ${version}/postman/ecolytiq_Sandbox.postman_collection.json

mv redoc-static.html index.html

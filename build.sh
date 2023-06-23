#!/bin/sh

version_directory=v3-2023-06-23

redoc-cli build ${version_directory}/openapi.yaml --options=theme.json --disableGoogleFont -t ecolytiq.hbs
cp redoc-static.html ${version_directory}/index.html

mkdir -p ${version_directory}/postman

./buildPostman.sh ${version_directory}/openapi.yaml ${version_directory}/postman/ecolytiq_Sandbox.postman_collection.json

mv redoc-static.html index.html

 
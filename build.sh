#!/bin/sh

redoc-cli bundle 2.4.0/openapi-2.4.0.yaml --options=theme.json
cp redoc-static.html 2.4.0/index.html

redoc-cli bundle 3.0.0/openapi-3.0.0.yaml --options=theme.json
cp redoc-static.html 3.0.0/index.html

redoc-cli bundle 3.2.0/openapi-3.2.0.yaml --options=theme.json
cp redoc-static.html 3.2.0/index.html

redoc-cli bundle preview/openapi.yaml --options=theme.json
cp redoc-static.html preview/index.html

redoc-cli bundle v3-2022-09-01/openapi.yaml --options=theme.json
cp redoc-static.html v3-2022-09-01/index.html
mv redoc-static.html index.html

 
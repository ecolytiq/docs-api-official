#!/bin/sh

redoc-cli bundle 2.4.0/openapi-2.4.0.yaml --options=theme.json
cp redoc-static.html 2.4.0/index.html

redoc-cli bundle 3.0.0/openapi-3.0.0.yaml --options=theme.json
cp redoc-static.html 3.0.0/index.html

redoc-cli bundle 3.3.0-preview/openapi-3.3.0.yaml --options=theme.json
cp redoc-static.html 3.3.0-preview/index.html

redoc-cli bundle 3.2.0/openapi-3.2.0.yaml --options=theme.json
cp redoc-static.html 3.2.0/index.html
mv redoc-static.html index.html

 
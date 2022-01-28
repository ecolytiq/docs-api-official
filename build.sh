#!/bin/sh

redoc-cli bundle ecolytiq-ecolytiq-api-1.1.0-clean-swagger.yaml --options=theme.json
mv redoc-static.html index.html

redoc-cli bundle ecolytiq-ecolytiq-api-3.0.0-draft-swagger.yaml --options=theme.json
mv redoc-static.html draft/index.html
 
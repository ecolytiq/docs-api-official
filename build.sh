#!/bin/sh

 redoc-cli bundle ecolytiq-ecolytiq-api-1.1.0-swagger.yaml --options=theme.json
 mv redoc-static.html index.html
 
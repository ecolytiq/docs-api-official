#!/bin/sh

redoc-cli build 2.4.0/openapi-2.4.0.yaml --options=theme.json --disableGoogleFont -t ecolytiq.hbs
cp redoc-static.html 2.4.0/index.html

redoc-cli build 3.0.0/openapi-3.0.0.yaml --options=theme.json --disableGoogleFont -t ecolytiq.hbs 
cp redoc-static.html 3.0.0/index.html

redoc-cli build 3.2.0/openapi-3.2.0.yaml --options=theme.json --disableGoogleFont -t ecolytiq.hbs
cp redoc-static.html 3.2.0/index.html

redoc-cli build preview/openapi.yaml --options=theme.json --disableGoogleFont -t ecolytiq.hbs
cp redoc-static.html preview/index.html

redoc-cli build v3-2022-10-04/openapi.yaml --options=theme.json --disableGoogleFont -t ecolytiq.hbs
cp redoc-static.html v3-2022-10-04/index.html
mv redoc-static.html index.html

 
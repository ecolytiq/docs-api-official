# ecolytiq API Docs

## Requirements
1. Install `jq` https://jqlang.github.io/jq/ and make sure `jq` is added to your PATH. \
   (The version used while writing this was `1.6`)
2. Install `Node.js` https://nodejs.org/en and make sure `npx` is added to your PATH. \
   (The version used while writing this was `18.15.0`)

## Update and Build Docs
See [Confluence](https://ecolytiq.atlassian.net/wiki/spaces/EC/pages/4528275659/API+Documentation#Changing-API-Docs).

## Build Postman Collection from OpenAPI

INFO: This step is included in the `build.sh` script and is not needed to be executed additionally.

Requirements 2 and 3 must be met for this!

Use the `buildPostman.sh` script in this repo:

```console
$ ./buildPostman.sh <INPUT> <OUTPUT>
````

This script does the following steps: 

1. Parses the OpenAPI spec file and includes the `{{bearerToken}}` variable to all request headers
2. Parse the OpenAPI spec file and set the proper values for the basic authentication for "Request Access Token"
3. Parse the resulting JSON file and
   1. Include a test that is executed when the "Request Access Token" endpoint is called. This enables Postman to store the access token in the `{{bearerToken}}` variable
   2. update the request urls for the "Request Access Token" endpoint to `{{tokenUrl}}`
   3. Set the correct values for `grant_type` `scope` 
   4. Delete the "Postman" part where it says how to get and import the postman collection. I don't think that is useful information at this point anymore.


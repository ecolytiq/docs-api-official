# ecolytiq API Docs

## Requirements
1. redoc-cli (`npm i -g redoc-cli`)
2. openapi-to-postmanv2 (`npm i -g openapi-to-postmanv2`)
   * must provide the `openapi2postmanv2` command.
   * this can be achieved by creating an alias, e.g., 
      ```console
      alias openapi2postmanv2="/opt/homebrew/lib/node_modules/openapi-to-postmanv2/bin/openapi2postmanv2.js"
      ```
3. jq (`brew install jq`)

## Update and Build Docs
1. Update `openapi.yaml` in the root directory with your changes.
2. Update the version variable in `build.sh` with the same date as in the `openapi.yaml` on line 6.
3. Run the build script:
```
./build.sh
```

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


#!/bin/sh
# Use this script to convert an OpenAPI json file to a postman collection

print_usage() {
    echo "Usage: `basename $0` INPUT OUTPUT"
}

E_BADARGS=85

if [ ! -n "$1" ] && [ ! -n "$2" ]
then
    print_usage
    exit $E_BADARGS
fi

E_FILENOTFOUND=2

if [ ! -f $1 ]
then 
    echo "Input file $1 not found"
    print_usage 
    exit $E_FILENOTFOUND
fi

INPUT=$1
OUTPUT=$2

TEMP1=$(mktemp)

# TEMP2=$(mktemp)

# TEMP3=$(mktemp)

openapi2postmanv2 -s $INPUT -o $TEMP1 -p -O folderStrategy=Tags,optimizeConversion=false,stackLimit=20,parametersResolution=Example

sed -i "" -e "s/Bearer null/Bearer {{bearerToken}}/g"  \
    -e "s/{{basicAuthUsername}}/{{clientId}}/g" \
    -e "s/{{basicAuthPassword}}/{{clientSecret}}/g" $TEMP1

jq '(.item[] 
        | select(.name=="Authentication").item[] 
        | select(.name="Request Access Token")).event=
            [ 
                { 
                    "listen": "test", 
                    "script": {
                        "exec": [ 
                            "pm.collectionVariables.set(\"bearerToken\", pm.response.json().access_token);" 
                        ], 
                        "type": "text/javascript" 
                    } 
                } 
            ]
    |(.item[] 
        | select(.name=="Authentication").item[] 
        | select(.name="Request Access Token")).url=
            {
                "raw": "{{tokenUrl}}", 
                "host": ["{{tokenUrl}}"]
            }
    |(.item[]
        | select(.name=="Authentication").item[]
        | select(.name=="Request Access Token").request.body.urlencoded[] 
        | select(.key=="grant_type")).value="client_credentials"
    |(.item[]
        | select(.name=="Authentication").item[]
        | select(.name=="Request Access Token").request.body.urlencoded[] 
        | select(.key=="grant_type")).type="text" 
    |(.item[]
        | select(.name=="Authentication").item[]
        | select(.name=="Request Access Token").request.body.urlencoded[] 
        | select(.key=="scope")).value="all"
    |(.item[]
        | select(.name=="Authentication").item[]
        | select(.name=="Request Access Token").request.body.urlencoded[] 
        | select(.key=="scope")).type="text"
    |del(.item[] | select(.name == "Postman"))' $TEMP1 > $OUTPUT
rm $TEMP1

# jq '(.item[] | select(.name=="Authentication").item[] | select(.name="Request Access Token")).url={"raw": "{{tokenUrl}}", "host": ["{{tokenUrl}}"]}' $TEMP2 > $TEMP3
# rm $TEMP2

# jq 'del(.item[] | select(.name == "Postman"))' $TEMP3 > $OUTPUT
# rm $TEMP3

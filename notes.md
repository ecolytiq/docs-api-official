# Convert OpenAPI to postman

Use [openapi2postmanv2](https://www.npmjs.com/package/openapi-to-postmanv2) to convert API description into postman collection

## Call Options

See [List of Options](https://github.com/postmanlabs/openapi-to-postman/blob/HEAD/OPTIONS.md) as for why

```console
$ openapi2postmanv2 -s <openapi-file> - o postman/<timestamp>_ecolytiq_Sandbox.postman_collection.json -O optimizeConversion=false,stackLimit=20 
```

# Some example data

## accounts

a083e879-b37c-4307-9407-a9825d82800b

## transactions

* flight: 62c12ecc-17d7-469f-9ecc-b08e00eb8c90
* servicestations: fa2e6d26-fb0f-49f5-bc8d-ccedbc1ca084

### empty

```json
{
    "transactions": [
        {
            "transaction_id": "<Transaction ID>",
            "account_id": "<Account ID>",
            "amount": {
                "value": <Amount>,
                "currency_code": "<Currency Code>"
            },
            "category": {
                "value": "<Category Code>",
                "system": "<Category System>"
            },
            "co2_model": "<Country Model>",
            "datetime": "<Time Stamp>"
        }
    ]
}
```
```yaml
```

### ex:transport.flight

62c12ecc-17d7-469f-9ecc-b08e00eb8c90

#### Request
```json
{
    "transactions": [
        {
            "transaction_id": "62c12ecc-17d7-469f-9ecc-b08e00eb8c90",
            "account_id": "a083e879-b37c-4307-9407-a9825d82800b",
            "amount": {
                "value": -2854.0,
                "currency_code": "EUR"
            },
            "category": {
                "value": "ex:transport.flight",
                "system": "ECOLYTIQ"
            },
            "co2_model": "DE",
            "datetime": "2022-05-15T14:18:34Z"
        }
    ]
}
```

```yaml
transactions:
    - transaction_id: "62c12ecc-17d7-469f-9ecc-b08e00eb8c90"
      account_id: "a083e879-b37c-4307-9407-a9825d82800b"
      category:
        system: "ECOLYTIQ"
        value: "ex:transport.flight"
      co2_model: "DE"
      amount: 
        value: -2854.00
        currency_code: "EUR"
      datetime: "2022-05-15T14:18:34Z"
```

#### Response

```json
{
    "request_id": "1d2dd5f3b23d3870",
    "results": [
        {
            "transaction_id": "62c12ecc-17d7-469f-9ecc-b08e00eb8c90",
            "category": {
                "value": "ex:transport.flight",
                "system": "ECOLYTIQ"
            },
            "co2_footprint": {
                "value": 4486488,
                "unit": "g"
            }
        }
    ],
    "errors": []
}
```

```yaml
request_id: "1d2dd5f3b23d3870"
results: 
  - transaction_id: "62c12ecc-17d7-469f-9ecc-b08e00eb8c90"
    category: 
      value: "ex:transport.flight"
      system: "ECOLYTIQ"
    co2_footprint: 
      value: 4486488
      unit: "g"
errors: []
```

### ex:transport.servicestations

#### Request

```json
{
    "transactions": [
        {
            "transaction_id": "fa2e6d26-fb0f-49f5-bc8d-ccedbc1ca084",
            "account_id": "a083e879-b37c-4307-9407-a9825d82800b",
            "amount": {
                "value": -192.60,
                "currency_code": "EUR"
            },
            "category": {
                "value": "ex:transport.servicestations",
                "system": "ECOLYTIQ"
            },
            "co2_model": "DE",
            "datetime": "2022-09-05T11:18:34Z"
        }
    ]
}
```

```yaml
transactions:
  - transaction_id: "fa2e6d26-fb0f-49f5-bc8d-ccedbc1ca084"
    account_id: "a083e879-b37c-4307-9407-a9825d82800b"
    category:
      system: "ECOLYTIQ"
      value: "ex:transport.servicestations"
    amount:
      value: -192.60
      currency_code: "EUR"
    co2_model: "DE"
    datetime: "2022-09-05T11:18:34Z"
```

#### Response

```json
{
    "request_id": "1d2dd5f3b23d3870",
    "results": [
        {
            "transaction_id": "fa2e6d26-fb0f-49f5-bc8d-ccedbc1ca084",
            "category": {
                "value": "ex:transport.servicestations",
                "system": "ECOLYTIQ"
            },
            "co2_footprint": {
                "value": 348606,
                "unit": "g"
            }
        }
    ],
    "errors": []
}
```

```yaml
request_id: "1d2dd5f3b23d3870",
results:
  - transaction_id: "fa2e6d26-fb0f-49f5-bc8d-ccedbc1ca084"
    category: 
      value: "ex:transport.servicestations"
      system: "ECOLYTIQ"
    co2_footprint: 
      value: 348606
      unit: "g"
errors: []
```


### Request with Merchant
#### Request
```json
{
  "transactions": [
    {
      "transaction_id": "71b24bdd-8aa4-4b8d-893b-4e74b05a1c98",
      "account_id": "10547323-5594-45a7-a58f-3b8618770b7c",
      "category": {
        "system": "MCC",
        "value": "763"
      },
      "co2_model": "DE",
      "amount": {
        "value": -20.59,
        "currency_code": "EUR"
      },
      "datetime": "2021-01-17T12:45:00Z",
      "merchant": {
        "name": "Fancy Supermarket",
        "address": {
          "city": "Berlin",
          "country_code": "DE"
        }
      }
    },
    {
      "transaction_id": "fbc78d6b-122b-4ae3-8b5b-50f45230a39f",
      "account_id": "10547323-5594-45a7-a58f-3b8618770b7c",
      "category": {
        "system": "MCC",
        "value": "1711"
      },
      "co2_model": "DE",
      "amount": {
        "value": -20.59,
        "currency_code": "EUR"
      },
      "datetime": "2021-01-17T12:45:00Z",
      "merchant": {
        "name": "Fancy Supermarket",
        "address": {
          "city": "London",
          "country_code": "GB"
        }
      }
    }
  ]
}
```

```yaml
transactions:
  - transaction_id: 71b24bdd-8aa4-4b8d-893b-4e74b05a1c98
    account_id: 10547323-5594-45a7-a58f-3b8618770b7c
    category:
      system: MCC
      value: "763"
    co2_model: DE
    amount:
      value: -20.59
      currency_code: EUR
    datetime: "2021-01-17T12:45:00Z"
    merchant:
      name: Fancy Supermarket
      address:
        city: Berlin
        country_code: DE
  - transaction_id: fbc78d6b-122b-4ae3-8b5b-50f45230a39f
    account_id: 10547323-5594-45a7-a58f-3b8618770b7c
    category:
      system: MCC
      value: "1711"
    co2_model: DE
    amount:
      value: -20.59
      currency_code: EUR
    datetime: "2021-01-17T12:45:00Z"
    merchant:
      name: Fancy Supermarket
      address:
        city: London
        country_code: GB

```
#### Response
```json
{
    "request_id": "2bbf33459525a4e2",
    "results": [
        {
            "transaction_id": "71b24bdd-8aa4-4b8d-893b-4e74b05a1c98",
            "category": {
                "value": "ex:misc",
                "system": "ECOLYTIQ"
            },
            "co2_footprint": {
                "value": 16472,
                "unit": "g"
            }
        },
        {
            "transaction_id": "fbc78d6b-122b-4ae3-8b5b-50f45230a39f",
            "category": {
                "value": "ex:food.groceries",
                "system": "ECOLYTIQ"
            },
            "co2_footprint": {
                "value": 17666,
                "unit": "g"
            }
        }
    ],
    "errors": []
}
```

```yaml
request_id: 2bbf33459525a4e2
results:
  - transaction_id: 71b24bdd-8aa4-4b8d-893b-4e74b05a1c98
    category:
      value: ex:misc
      system: ECOLYTIQ
    co2_footprint:
      value: 16472
      unit: g
  - transaction_id: fbc78d6b-122b-4ae3-8b5b-50f45230a39f
    category:
      value: ex:food.groceries
      system: ECOLYTIQ
    co2_footprint:
      value: 17666
      unit: g
errors: []

```

### Asynchronous Request
#### Request
```json
{
  "async": true,
  "transactions": [
    {
      "transaction_id": "46cd8390-ccda-4773-b59d-03b2e6d3d11d",
      "account_id": "10547323-5594-45a7-a58f-3b8618770b7c",
      "category": {
        "system": "MCC",
        "value": "763"
      },
      "co2_model": "DE",
      "amount": {
        "value": -20.59,
        "currency_code": "EUR"
      },
      "datetime": "2021-01-17T12:45:00Z",
      "merchant": {
        "name": "Fancy Supermarket",
        "address": {
          "city": "Berlin",
          "country_code": "DE"
        }
      }
    },
    {
      "transaction_id": "21e41260-7107-4a65-804c-d9b4f5f25e3a",
      "account_id": "10547323-5594-45a7-a58f-3b8618770b7c",
      "category": {
        "system": "MCC",
        "value": "1711"
      },
      "co2_model": "DE",
      "amount": {
        "value": -20.59,
        "currency_code": "EUR"
      },
      "datetime": "2021-01-17T12:45:00Z",
      "merchant": {
        "name": "Fancy Supermarket",
        "address": {
          "city": "London",
          "country_code": "GB"
        }
      }
    }
  ]
}
```
```yaml
async: true
transactions:
  - transaction_id: 46cd8390-ccda-4773-b59d-03b2e6d3d11d
    account_id: 10547323-5594-45a7-a58f-3b8618770b7c
    category:
      system: MCC
      value: "763"
    co2_model: DE
    amount:
      value: -20.59
      currency_code: EUR
    datetime: "2021-01-17T12:45:00Z"
    merchant:
      name: Fancy Supermarket
      address:
        city: Berlin
        country_code: DE
  - transaction_id: 21e41260-7107-4a65-804c-d9b4f5f25e3a
    account_id: 10547323-5594-45a7-a58f-3b8618770b7c
    category:
      system: MCC
      value: "1711"
    co2_model: DE
    amount:
      value: -20.59
      currency_code: EUR
    datetime: "2021-01-17T12:45:00Z"
    merchant:
      name: Fancy Supermarket
      address:
        city: London
        country_code: GB

```
#### Response
```json
{
    "request_id": "f90b728d538cf847"
}
```
```yaml
request_id: f90b728d538cf847
```
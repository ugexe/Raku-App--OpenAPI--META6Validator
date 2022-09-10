# App::OpenAPI::META6Validator

A Raku META6 validation api service based on Cro and OpenAPI 3.0

## Server

##### Running from a local repo
```
$ git clone https://github.com/ugexe/Raku-App--OpenAPI--META6Validator.git
$ cd Raku-App--OpenAPI--META6Validator
$ zef install . --deps-only --/test
$ raku -I. bin/openapi-server.raku

Listening at http://localhost:3000
```

##### Installed Server
```
$ zef install https://github.com/ugexe/Raku-App--OpenAPI--META6Validator.git
$ openapi-server.raku --port=420

Listening at http://localhost:420
```

## Client Validation

##### curl
```
$ curl -H "Accept: application/json" -H "Content-type: application/json" -X POST -d @./META6.json http://localhost:3000/validate

{"success": 1}
```

##### built-in utility (if installed)
```
$ validate-meta6-file.raku ./META6.json

[OK] 200 /validate - ::1
```

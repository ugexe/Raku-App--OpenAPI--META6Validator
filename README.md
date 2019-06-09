# App::OpenAPI::META6Validator

A Perl6 META6 validation api service based on Cro and OpenAPI 3.0

## Server

##### Running from a local repo
```
$ git clone https://github.com/ugexe/Perl6-App--OpenAPI--META6Validator.git
$ cd Perl6-App--OpenAPI--META6Validator
$ zef install . --deps-only --/test
$ perl6 -I. bin/openapi-server.p6

Listening at http://localhost:3000
```

##### Installed Server
```
$ zef install https://github.com/ugexe/Perl6-App--OpenAPI--META6Validator.git
$ openapi-server.p6 --port=420

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
$ validate-meta6-file.p6 ./META6.json

[OK] 200 /validate - ::1
```

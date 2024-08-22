#!/bin/bash
#docker run -v <absolute-path-to-local-file>:/zap/wrk/:rw -it --rm soosio/dast --clientId=<client>--apiKey=<apiKey> --projectName=<api project name> --scanMode=apiscan --apiScanFormat=openapi swagger.yaml
zap-full-scan.py -t http://myapp:8080

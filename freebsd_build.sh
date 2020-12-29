#!/bin/bash

### get VERSIONSTRING
VERSIONSTRING="$(git describe --tags --exact-match || git rev-parse --short HEAD)"

echo "Building version ${VERSIONSTRING} of Prosody-Filer ..."

### Compile and link statically
CGO_ENABLED=0 GOOS=freebsd go build -a -ldflags "-extldflags '-static' -w -s -X main.versionString=${VERSIONSTRING}" prosody-filer.go


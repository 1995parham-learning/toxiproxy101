#!/usr/bin/env bash

# https://stackoverflow.com/questions/3822621/how-to-exit-if-a-command-failed
set -eu
set -o pipefail

echo "run toxiproxy using custom-build binary before continue"

toxiproxy-cli --host=localhost:8484 create --listen 127.0.0.1:8888 --upstream httpbin.org:80 my-http-service
toxiproxy-cli --host=localhost:8484 toxic add --upstream -n my-httptoxic-service -t http my-http-service
curl -vvv 127.0.0.1:8888

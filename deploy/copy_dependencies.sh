#!/usr/bin/env bash

echo ">>>> Moving to $(dirname "$0")"
cd "$(dirname "$0")"

echo "Copying vendor directory from the container"
docker cp docker_silex_skeleton:/var/www/html/vendor $PWD/../www/vendor
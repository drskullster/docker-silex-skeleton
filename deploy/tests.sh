#!/usr/bin/env bash

echo ">>>> Moving to $(dirname "$0")"
cd "$(dirname "$0")"

echo ">>>> Executing tests"
docker exec -it docker_silex_skeleton php $PWD/../www/vendor/phpunit/phpunit/phpunit
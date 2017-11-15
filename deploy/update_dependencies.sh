#!/usr/bin/env bash

echo ">>>> Moving to $(dirname "$0")"
cd "$(dirname "$0")"

echo ">>>> Updating dependencies"
docker exec -it docker_silex_skeleton php /var/www/html/composer.phar update --prefer-dist --no-interaction --ignore-platform-reqs --working-dir=/var/www/html

echo "Copying new composer.lock from the container"
docker cp docker_silex_skeleton:/var/www/html/composer.lock $PWD/../composer.lock

$PWD/copy_dependencies.sh
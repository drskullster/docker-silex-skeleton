#!/usr/bin/env bash
export PORT_OUTSIDE=$1
export PORT_INSIDE=$2

echo ">>>> Moving to $(dirname "$0")"
cd "$(dirname "$0")"
echo ">>>> Building docker image"
docker build -t docker_silex_skeleton:latest $PWD/..

echo ">>>> Installing dependencies"
php $PWD/../www/composer.phar install --prefer-dist --no-interaction --ignore-platform-reqs --working-dir=$PWD/../www

echo ">>>> Removing old container"
docker rm -f game_of_life || true

echo ">>>> Running new container"
docker run --name docker_silex_skeleton -e APP_ENV=local -e APP_DEBUG=TRUE -e PORT=$PORT_INSIDE -d -p $PORT_OUTSIDE:$PORT_INSIDE -v $PWD/../www:/var/www/html docker_silex_skeleton:latest

echo ">>>> Tailing logs"
docker logs -f docker_silex_skeleton

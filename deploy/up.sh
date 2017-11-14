#!/usr/bin/env bash

export OUTSIDE_PORT=${OUTSIDE_PORT:=80}
export INSIDE_PORT=${INSIDE_PORT:=80}
export APACHE_USER=${APACHE_USER:=root}
export HOST_NAME=${HOST_NAME:=app.com}

export APP_ENV=${APP_ENV:=prod}
export APP_DEBUG=${APP_DEBUG:=false}

export XDEBUG_ENABLE=${XDEBUG_ENABLE:=off}
export XDEBUG_IDEKEY=${XDEBUG_IDEKEY:=idekey}
export XDEBUG_REMOTE_PORT=${XDEBUG_REMOTE_PORT:=9000}
export XDEBUG_REMOTE_HOST=${XDEBUG_REMOTE_HOST:=localhost}

echo ">>>> Moving to $(dirname "$0")"
cd "$(dirname "$0")"
echo ">>>> Building docker image"
docker build \
    --build-arg INSIDE_PORT=$INSIDE_PORT \
    --build-arg APACHE_USER=$APACHE_USER \
    --build-arg HOST_NAME=$HOST_NAME \
    --build-arg APP_ENV=$APP_ENV \
    --build-arg APP_DEBUG=$APP_DEBUG \
    --build-arg XDEBUG_ENABLE=$XDEBUG_ENABLE \
    --build-arg XDEBUG_REMOTE_PORT=$XDEBUG_REMOTE_PORT \
    --build-arg XDEBUG_REMOTE_HOST=$XDEBUG_REMOTE_HOST \
    -t docker_silex_skeleton:latest $PWD/..

echo ">>>> Removing old container"
docker rm -f docker_silex_skeleton || true

echo ">>>> Running new container"
docker run --name docker_silex_skeleton -d -p $OUTSIDE_PORT:$INSIDE_PORT -v $PWD/../www:/var/www/html docker_silex_skeleton:latest

echo ">>>> Tailing logs"
docker logs -f docker_silex_skeleton

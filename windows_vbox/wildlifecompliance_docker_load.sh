#!/bin/bash

DOCKER_IMAGE="dbcawa/docker_app_dev:wildlifelegacy_dev_2022.10.03.09.3018"
INSTANCE_NAME="wildlifecomplance-dev"
CONTAINER_WEB_PORT="7006"
DEVPORTS="9051-9060"
SSHPORT="2226"
ENV_FILE="env/compliance.env"

if [ "$1" ]
then
      DOCKER_IMAGE=$1
      echo "Loading Image: $1"
fi

if [ "$2" ]
then
      ENV_FILE=$2
      echo "Loading ENV: $2"
fi

docker stop $INSTANCE_NAME
docker run --rm  --pull=always --name=$INSTANCE_NAME --env-file=$ENV_FILE --hostname $INSTANCE_NAME  --mount type=bind,source=/data/data/dockerhome/,target=/home/docker/ --mount type=bind,source=/windata/,target=/windata/  --mount type=bind,source=/data/,target=/data/  -p 10.17.0.10:$DEVPORTS:$DEVPORTS -p 10.17.0.10:$SSHPORT:22 -p 10.17.0.10:$CONTAINER_WEB_PORT:8080 -d -i -t $DOCKER_IMAGE

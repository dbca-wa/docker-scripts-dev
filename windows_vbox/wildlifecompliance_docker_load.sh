#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`
DOCKER_IMAGE="dbcawa/docker_app_dev:wildlifecompliance_dev_latest"
INSTANCE_NAME="wildlifecompliance-dev"
CONTAINER_WEB_PORT="7006"
DEVPORTS="9051-9060"
SSHPORT="2226"
ENV_FILE="/env/wildlifecompliance.env"

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
docker run --rm  --pull=always --name=$INSTANCE_NAME --env-file=$SCRIPTPATH$ENV_FILE --hostname $INSTANCE_NAME --mount type=bind,source=/data/data/containerhome/,target=/home/container/ --mount type=bind,source=/data/data/dockerhome/,target=/home/docker/ --mount type=bind,source=/windata/,target=/windata/  --mount type=bind,source=/data/,target=/data/  -p 10.17.0.10:$DEVPORTS:$DEVPORTS -p 10.17.0.10:$SSHPORT:22 -p 10.17.0.10:$CONTAINER_WEB_PORT:8080 -d -i -t $DOCKER_IMAGE

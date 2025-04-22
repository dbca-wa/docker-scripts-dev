#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`
DOCKER_IMAGE="dbcawa/docker_app_dev:pbs_dev_2024.10.23.02.2303"
INSTANCE_NAME="pbs-legacy-dev"
CONTAINER_WEB_PORT="10030"
DEVPORTS="10201-10205"
ENV_FILE="/env/pbs_legacy.env"

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

if [ -d "/data/data/containerhome/" ]
then
   echo "Directory Exists /data/data/containerhome/"
else
   sudo mkdir "/data/data/containerhome/"
fi


docker stop $INSTANCE_NAME
docker run --rm  --pull=always --name=$INSTANCE_NAME --env-file=$SCRIPTPATH$ENV_FILE --hostname $INSTANCE_NAME --mount type=bind,source=/data/data/containerhome/,target=/home/container/ --mount type=bind,source=/windata/,target=/windata/  --mount type=bind,source=/data/,target=/data/  -p 10.17.0.10:$DEVPORTS:$DEVPORTS -p 10.17.0.10:$CONTAINER_WEB_PORT:8080 -d -i -t $DOCKER_IMAGE


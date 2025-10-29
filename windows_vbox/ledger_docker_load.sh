#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`
DOCKER_IMAGE="ghcr.io/dbca-wa/docker_app_dev:ledger_dev_latest"
INSTANCE_NAME="ledger-dev"
CONTAINER_WEB_PORT="7001"
DEVPORTS="9021-9030"
SSHPORT="2224"
ENV_FILE="/env/ledger.env"

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
#docker run --rm  --pull=always --name=$INSTANCE_NAME --env-file=$SCRIPTPATH$ENV_FILE --hostname $INSTANCE_NAME --mount type=bind,source=/data/data/containerhome/,target=/home/container/ --mount type=bind,source=/windata/,target=/windata/  --mount type=bind,source=/data/,target=/data/  -p 10.17.0.10:$DEVPORTS:$DEVPORTS -p 10.17.0.10:$SSHPORT:22 -p 10.17.0.10:$CONTAINER_WEB_PORT:8080 -d -i -t $DOCKER_IMAGE
docker run --rm  --pull=always --name=$INSTANCE_NAME --env-file=$SCRIPTPATH$ENV_FILE --hostname $INSTANCE_NAME --mount type=bind,source=/data/data/containerhome/,target=/home/container/ --mount type=bind,source=/windata/,target=/windata/  --mount type=bind,source=/data/,target=/data/ -p 7001:8080 -d -i -t $DOCKER_IMAGE



#docker stop ledger-dev 
#docker run --rm --name=ledger-dev --env-file=env/ledger.env --hostname ledger-dev  --mount type=bind,source=/windata/,target=/windata/ -p 10.17.0.10:9021-9030:9021-9030 -p 10.17.0.10:2224:22 -p 10.17.0.10:7001:8080  -d -i -t dbcawa/docker_app_dev:ledger_dev_latest

#!/bin/bash

DOCKER_IMAGE="dbcawa/docker_app_dev:wildlifelegacy_dev_2022.10.03.09.3018"
INSTANCE_NAME="wildlifelegacy-dev"
CONTAINER_WEB_PORT="7005"
DEVPORTS="9041-9050"
SSHPORT="2225"
ENV_FILE="env/boranga.env"

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





#docker stop wildlifelegacy-dev
#docker run --rm  --pull=always --name=wildlifelegacy-dev --env-file=env/wildlifelegacy.env --hostname wildlifelegacy-dev --mount type=bind,source=/data/data/dockerhome/,target=/home/docker/ --mount type=bind,source=/windata/,target=/windata/  --mount type=bind,source=/data/,target=/data/  -p 10.17.0.10:9041-9050:9041-9050 -p 10.17.0.10:2225:22 -p 10.17.0.10:7005:8080 -d -i -t dbcawa/docker_app_dev:wildlifelegacy_dev_2022.10.03.09.3018

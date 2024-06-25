#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`
ENV_FILE="/env/geoserver_2_25_1.env"
LINUX_DIR="geoserver_2.25-dev_1"
DOCKER_HOSTNAME='geoserver1_2.25'

if [ -d "/data" ]
then
   echo "Directory Exists /data"
else
   sudo mkdir "/data"
fi

if [ -d "/linuxdata" ]
then
   echo "Directory Exists /linuxdata"
else
   sudo mkdir "/linuxdata"
fi

if [ -d "/linuxdata/$LINUX_DIR/" ]
then
   echo "Directory Exists /linuxdata/$LINUX_DIR/"
else
   sudo mkdir "/linuxdata/$LINUX_DIR/"
fi

if [ -d "/linuxdata/$LINUX_DIR/data" ]
then
   echo "Directory Exists /linuxdata/$LINUX_DIR/data"
else
   sudo mkdir "/linuxdata/$LINUX_DIR/data"
fi

if [ -d "/linuxdata/$LINUX_DIR/data_dir" ]
then
   echo "Directory Exists /linuxdata/$LINUX_DIR/data_dir"
else
   sudo mkdir "/linuxdata/$LINUX_DIR/data_dir"
fi

if [ -d "/linuxdata/$LINUX_DIR/geoserver_data" ]
then
   echo "Directory Exists /linuxdata/$LINUX_DIR/geoserver_data"
else
   sudo mkdir "/linuxdata/$LINUX_DIR/geoserver_data"
fi

if [ -d "/linuxdata/$LINUX_DIR/opt_geoserver_data" ]
then
   echo "Directory Exists /linuxdata/$LINUX_DIR/opt_geoserver_data"
else
   sudo mkdir "/linuxdata/$LINUX_DIR/opt_geoserver_data"
fi

if [ -d "/linuxdata/$LINUX_DIR/geocache" ]
then
   echo "Directory Exists /linuxdata/$LINUX_DIR/geocache"
else
   sudo mkdir "/linuxdata/$LINUX_DIR/geocache"
fi


if [ -d "/windata" ]
then
   echo "Directory Exists /windata"
else
   sudo mkdir "/windata"
fi

if [ "$2" ]
then
      ENV_FILE=$2
      echo "Loading ENV: $2"
fi

docker stop $DOCKER_HOSTNAME 
docker run --rm --pull=always --name=$DOCKER_HOSTNAME --hostname $DOCKER_HOSTNAME  --env-file=$SCRIPTPATH$ENV_FILE  --mount type=bind,source=/linuxdata/$LINUX_DIR/data/,target=/data/  --mount type=bind,source=/linuxdata/$LINUX_DIR/data_dir/,target=/opt/geoserver/data_dir/ --mount type=bind,source=/linuxdata/$LINUX_DIR/geoserver_data/,target=/opt/geoserver/geoserver_data/ --mount type=bind,source=/linuxdata/$LINUX_DIR/opt_geoserver_data/,target=/opt/geoserver_data/ --mount type=bind,source=/linuxdata/$LINUX_DIR/geocache/,target=/opt/geoserver/geocache/  -p 10.17.0.10:9186-9190:9186-9190 -p 10.17.0.10:2247:22 -p 7027:8080  -d -i -t dbcawa/appsteam-geoserver:2_25_2024.06.25.13.1417

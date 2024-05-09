#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`
ENV_FILE="/env/geoserver2.env"

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

if [ -d "/linuxdata/geoserver2-dev/" ]
then
   echo "Directory Exists /linuxdata/geoserver2-dev/"
else
   sudo mkdir "/linuxdata/geoserver2-dev/"
fi

if [ -d "/linuxdata/geoserver2-dev/data" ]
then
   echo "Directory Exists /linuxdata/geoserver2-dev/data"
else
   sudo mkdir "/linuxdata/geoserver2-dev/data"
fi

if [ -d "/linuxdata/geoserver2-dev/data_dir" ]
then
   echo "Directory Exists /linuxdata/geoserver2-dev/data_dir"
else
   sudo mkdir "/linuxdata/geoserver2-dev/data_dir"
fi

if [ -d "/linuxdata/geoserver2-dev/geoserver_data" ]
then
   echo "Directory Exists /linuxdata/geoserver2-dev/geoserver_data"
else
   sudo mkdir "/linuxdata/geoserver2-dev/geoserver_data"
fi


if [ -d "/linuxdata/geoserver2-dev/geocache" ]
then
   echo "Directory Exists /linuxdata/geoserver2-dev/geocache"
else
   sudo mkdir "/linuxdata/geoserver2-dev/geocache"
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

docker stop geoserver2-dev
docker run --rm --pull=always --name='geoserver2-dev' --hostname geoserver2-dev  --env-file=$SCRIPTPATH$ENV_FILE  --mount type=bind,source=/linuxdata/geoserver2-dev/data/,target=/data/  --mount type=bind,source=/linuxdata/geoserver2-dev/data_dir/,target=/opt/geoserver/data_dir/ --mount type=bind,source=/linuxdata/geoserver2-dev/geoserver_data/,target=/opt/geoserver/geoserver_data/ --mount type=bind,source=/linuxdata/geoserver2-dev/geocache/,target=/opt/geoserver/geocache/  -p 10.17.0.10:9181-9185:9181-9185 -p 10.17.0.10:2246:22 -p 7026:8080  -d -i -t dbcawa/appsteam-geoserver:2023.07.04.10.3752 

#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`
ENV_FILE="/env/geoserver.env"

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

if [ -d "/linuxdata/geoserver-dev/" ]
then
   echo "Directory Exists /linuxdata/geoserver-dev/"
else
   sudo mkdir "/linuxdata/geoserver-dev/"
fi

if [ -d "/linuxdata/geoserver-dev/data" ]
then
   echo "Directory Exists /linuxdata/geoserver-dev/data"
else
   sudo mkdir "/linuxdata/geoserver-dev/data"
fi


if [ -d "/linuxdata/geoserver-dev/data_dir" ]
then
   echo "Directory Exists /linuxdata/geoserver-dev/data_dir"
else
   sudo mkdir "/linuxdata/geoserver-dev/data_dir"
fi

if [ -d "/linuxdata/geoserver-dev/geoserver_data" ]
then
   echo "Directory Exists /linuxdata/geoserver-dev/geoserver_data"
else
   sudo mkdir "/linuxdata/geoserver-dev/geoserver_data"
fi


if [ -d "/linuxdata/geoserver-dev/geocache" ]
then
   echo "Directory Exists /linuxdata/geoserver-dev/geocache"
else
   sudo mkdir "/linuxdata/geoserver-dev/geocache"
fi

#./geoserver_data/workspaces/private
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

docker stop geoserver-dev
docker run --rm --pull=always --name='geoserver-dev' --hostname geoserver-dev  --env-file=$SCRIPTPATH$ENV_FILE  --mount type=bind,source=/linuxdata/geoserver-dev/data/,target=/data/ --mount type=bind,source=/linuxdata/geoserver-dev/geoserver_data/,target=/opt/geoserver_data/ -p 10.17.0.10:9116-9120:9116-9120 -p 10.17.0.10:2224:22 -p 7014:8080  -d -i -t dbcawa/appsteam-geoserver:2023.07.04.10.3752 

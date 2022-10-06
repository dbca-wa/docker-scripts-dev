#!/bin/bash

if [ -d "/data" ]
then
   echo "Directory Exists /data"
else
   mkdir "/data"
fi

if [ -d "/linuxdata" ]
then
   echo "Directory Exists /linuxdata"
else
   mkdir "/linuxdata"
fi

if [ -d "/linuxdata/postgres-dev/" ]
then
   echo "Directory Exists /linuxdata/postgres-dev/"
else
   mkdir "/linuxdata/postgres-dev/"
fi

if [ -d "/windata" ]
then
   echo "Directory Exists /windata"
else
   mkdir "/windata"
fi

docker stop postgres-dev
docker run --rm --pull=always --name=postgres-dev --hostname postgres-dev --mount type=bind,source=/linuxdata/postgres-dev/data/,target=/data/  --mount type=bind,source=/windata/,target=/windata/ --mount type=bind,source=/data/,target=/webdav  -p 10.17.0.10:9011-9020:9011-9020 -p 10.17.0.10:2223:22 -p 5432:5432  -d -i -t dbcawa/docker_app_dev:postgresubuntu2004_latest

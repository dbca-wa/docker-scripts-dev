#!/bin/bash

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

if [ -d "/linuxdata/postgres2404-dev/" ]
then
   echo "Directory Exists /linuxdata/postgres2404-dev/"
else
   sudo mkdir "/linuxdata/postgres2404-dev/"
fi

if [ -d "/linuxdata/postgres2404-dev/data" ]
then
   echo "Directory Exists /linuxdata/postgres2404-dev/data"
else
   sudo mkdir "/linuxdata/postgres2404-dev/data"
fi

if [ -d "/windata" ]
then
   echo "Directory Exists /windata"
else
   sudo mkdir "/windata"
fi

docker stop postgres-dev
docker run --rm --pull=always --name=postgres2404-dev --hostname postgres2404-dev --mount type=bind,source=/linuxdata/postgres2404-dev/data/,target=/data/ --mount type=bind,source=/data/,target=/datadev  -p 15432:5432  -d -i -t dbcawa/docker_app_dev:postgresubuntu2404_latest

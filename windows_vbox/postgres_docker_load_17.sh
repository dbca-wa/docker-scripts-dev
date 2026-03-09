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

if [ -d "/linuxdata/postgres-dev-17/" ]
then
   echo "Directory Exists /linuxdata/postgres-dev-17/"
else
   sudo mkdir "/linuxdata/postgres-dev-17/"
fi

if [ -d "/linuxdata/postgres-dev-17/data" ]
then
   echo "Directory Exists /linuxdata/postgres-dev-17/data"
else
   sudo mkdir "/linuxdata/postgres-dev-17/data"
fi

if [ -d "/windata" ]
then
   echo "Directory Exists /windata"
else
   sudo mkdir "/windata"
fi

docker stop postgres-dev-17
docker run --rm --pull=always --name=postgres-dev-17 --hostname postgres-dev-17 --mount type=bind,source=/linuxdata/postgres-dev-17/data/,target=/data/ --mount type=bind,source=/data/,target=/datadev  -p 25432:5432  -d -i -t ghcr.io/dbca-wa/docker-apps-dev:postgres17ubuntu_latest

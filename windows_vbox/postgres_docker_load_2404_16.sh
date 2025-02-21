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

if [ -d "/linuxdata/postgres2404-dev-16/" ]
then
   echo "Directory Exists /linuxdata/postgres2404-dev-16/"
else
   sudo mkdir "/linuxdata/postgres2404-dev-16/"
fi

if [ -d "/linuxdata/postgres2404-dev-16/data" ]
then
   echo "Directory Exists /linuxdata/postgres2404-dev-16/data"
else
   sudo mkdir "/linuxdata/postgres2404-dev-16/data"
fi

if [ -d "/windata" ]
then
   echo "Directory Exists /windata"
else
   sudo mkdir "/windata"
fi

docker stop postgres2404-dev-16
docker run --rm --pull=always --name=postgres2404-dev-16 --hostname postgres2404-dev-16 --mount type=bind,source=/linuxdata/postgres2404-dev-16/data/,target=/data/ --mount type=bind,source=/data/,target=/datadev  -p 25432:5432  -d -i -t ghcr.io/dbca-wa/docker-apps-dev:postgresubuntu2404_16_latest

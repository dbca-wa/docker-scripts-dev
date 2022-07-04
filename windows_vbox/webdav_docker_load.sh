#!/bin/bash

docker stop webdav
docker rm webdav

docker run  --restart always -v /data:/var/lib/dav -e AUTH_TYPE=Digest -e USERNAME=docker -e PASSWORD=docker --publish 6999:80 --name webdav     -e LOCATION=/webdav -d dbcawa/docker_app_dev:webdav_dev_latest 

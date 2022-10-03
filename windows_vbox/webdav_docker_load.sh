#!/bin/bash

docker stop webdav
docker rm webdav

# specifically for a dev environment. - not for production use.
docker run  --pull=always  --restart always -v /data:/var/lib/dav -e AUTH_TYPE=Digest -e USERNAME=docker -e PASSWORD=dockerpass --publish 6999:80 --name webdav -e LOCATION=/webdav -d dbcawa/docker_app_dev:webdav_dev_2022.10.02.03.4834

#!/bin/bash

docker stop code-server
docker rm code-server

docker run -d --name=code-server --env-file=env/codeserver.env -p 8443:8443 -v /container-data/code-server/config:/config -v /container-data/datamount/:/config/workspace --restart unless-stopped lscr.io/linuxserver/code-server:latest

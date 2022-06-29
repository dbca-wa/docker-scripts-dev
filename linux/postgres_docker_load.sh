#!/bin/bash

docker stop postgres-dev
docker rm postgres-dev

docker run --rm --name=postgres-dev --mount type=bind,source=/container-data/postgres-dev/data/,target=/data/ --hostname postgres-dev -p 172.17.0.1:9011-9020:9011-9020 -p 172.17.0.1:2223:22 -p 172.17.0.1:5432:5432  -d -i -t dbcawa/docker_app_dev:postgresubuntu2004_latest

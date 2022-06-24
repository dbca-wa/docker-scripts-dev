#!/bin/bash

docker stop boranga-dev
docker run --rm --pull=always --name=boranga-dev --env-file=env/boranga.env --mount type=bind,source=/container-data/datamount/,target=/data/ --hostname boranga-dev -p 172.17.0.1:9000-9010:9000-9010 -p 172.17.0.1:2222:22 -p 172.17.0.1:7002:8080 -d -i -t dbcawa/docker_app_dev:boranga_dev_latest

#!/bin/bash

docker stop ledger-dev 
docker run --rm --name=ledger-dev --env-file=env/ledger.env --mount type=bind,source=/container-data/ledger-web-dev/data/,target=/data/ --hostname ledger-dev -p 172.17.0.1:9021-9030:9021-9030 -p 172.17.0.1:2224:22 -p 172.17.0.1:7001:8080  -d -i -t dbcawa/docker_app_dev:ledger_dev_latest

docker stop ledger-dev 
docker run --rm --name=ledger-dev --env-file=env/ledger.env --hostname ledger-dev  --mount type=bind,source=/windata/,target=/windata/ -p 10.17.0.10:9021-9030:9021-9030 -p 10.17.0.10:2224:22 -p 10.17.0.10:7001:8080  -d -i -t dbcawa/docker_app_dev:ledger_dev_latest

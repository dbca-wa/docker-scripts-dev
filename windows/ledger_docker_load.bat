docker stop ledger-dev 
docker run --rm --name=ledger-dev --env-file=env/ledger.env --hostname ledger-dev  -v dockercontainer:/data/ -p 10.17.0.1:9021-9030:9021-9030 -p 10.17.0.1:2224:22 -p 10.17.0.1:7001:8080  -d -i -t dbcawa/docker_app_dev:ledger_dev_latest

docker stop boranga-dev
docker run --rm --name=boranga-dev --env-file=env/boranga.env --hostname boranga-dev  -v dockercontainer:/data/ -p 10.17.0.1:9000-9010:9000-9010 -p 10.17.0.1:2222:22 -p 172.17.0.1:7002:8080 -d -i -t dbcawa/docker_app_dev:boranga_dev_latest

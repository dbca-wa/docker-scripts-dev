docker stop boranga-dev
docker run --rm --name=boranga-dev --env-file=env/boranga.env --hostname boranga-dev   --mount type=bind,source=/windata/,target=/windata/  --mount type=bind,source=/data/,target=/data/  -p 10.17.0.10:9000-9010:9000-9010 -p 10.17.0.10:2222:22 -p 10.17.0.10:7002:8080 -d -i -t dbcawa/docker_app_dev:boranga_dev_latest

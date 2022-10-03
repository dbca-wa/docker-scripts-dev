docker stop postgres-dev
docker run --rm --pull=always --name=postgres-dev --hostname postgres-dev --mount type=bind,source=/linuxdata/postgres-dev/data/,target=/data/  --mount type=bind,source=/windata/,target=/windata/ --mount type=bind,source=/data/,target=/webdav  -p 10.17.0.10:9011-9020:9011-9020 -p 10.17.0.10:2223:22 -p 5432:5432  -d -i -t dbcawa/docker_app_dev:postgresubuntu2004_latest

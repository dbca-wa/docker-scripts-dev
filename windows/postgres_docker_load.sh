
docker stop postgres-dev
docker run --rm --name=postgres-dev --hostname boranga-dev -v postgresdb:/data/ -p 10.17.0.1:9011-9020:9011-9020 -p 10.17.0.1:2223:22 -p 10.17.0.1:5432:5432  -d -i -t dbcawa/docker_app_dev:postgresubuntu2004_latest

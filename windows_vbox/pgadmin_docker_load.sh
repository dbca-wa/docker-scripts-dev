#!/bin/bash
docker stop pgadmin4
docker rm pgadmin4
docker run --name="pgadmin4" -p 5050:80  -e "PGADMIN_DEFAULT_EMAIL=docker@docker.host" -e "PGADMIN_DEFAULT_PASSWORD=docker" -v /linuxdata/pgadmin4-dev:/var/lib/pgadmin  -d dpage/pgadmin4

docker stop sss-dev
docker run --rm  --pull=always --name=sss-dev --env-file=env/gokartsss.env --hostname gokartsss-dev  --mount type=bind,source=/data/data/dockerhome/,target=/home/docker/ --mount type=bind,source=/windata/,target=/windata/  --mount type=bind,source=/data/,target=/data/  -p 10.17.0.10:9020-9030:9020-9030 -p 10.17.0.10:2222:22 -p 10.17.0.10:7003:8080 -d -i -t dbcawa/gokart:2022.03.22.03.2649


#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`
ENV_FILE="/env/ftpdevserver.env"


if [ -d "/linuxdata/ftpserver-dev/" ]
then
   echo "Directory Exists /linuxdata/ftpserver-dev/"
else
   sudo mkdir "/linuxdata/ftpserver-dev/"
fi

if [ -d "/linuxdata/ftpserver-dev/home" ]
then
   echo "Directory Exists /linuxdata/ftpserver-dev/home"
else
   sudo mkdir "/linuxdata/ftpserver-dev/home"
fi

if [ "$2" ]
then
      ENV_FILE=$2
      echo "Loading ENV: $2"
fi

docker stop ftpserver-dev
docker run      --rm \
                -d \
                --name='ftpserver-dev' \
                --hostname ftpserver-dev \
                --env-file=$SCRIPTPATH$ENV_FILE \
                --mount type=bind,source=/linuxdata/ftpserver-dev/home/,target=/home/ \
                -p 10.17.0.10:21:21 \
                -p 10.17.0.10:30000-30059:30000-30059 stilliard/pure-ftpd bash /run.sh \
                -c 30 -C 10 -l puredb:/etc/pure-ftpd/pureftpd.pdb -E -j -R -P localhost -p 30000:30059


# Example Environment variables for ./env/ftpdevserver.env

FTP_USER_NAME=testftp
FTP_USER_PASS=*********
FTP_USER_HOME=/home/testftp
